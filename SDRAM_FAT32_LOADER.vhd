library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- l'adressage entre le fat32_loader et le spi_master se fait en byte, donc on est limit� � 4Go
-- il n'y a pas de buffer de donn�e sur le fat32_loader, le buffer existe dans spi_master
entity SDRAM_FAT32_LOADER is
	Generic (
		-- le SPI mode ne fonctionne pas avec 2048 block, c'est bizarre
		-- windob ne formate pas en 512 block
		ROM_COUNT:integer:=4; -- attention ya du code en dur : "if files_loaded="11111" then"
		DSK_OFF:std_logic:='0'; -- si 1 alors ne cherche pas de disquette, si 0 alors cherche une disquette
		BLOCK_SIZE:integer:=4096; -- bytes
		--FAT32_SECTOR0_OFFSET:STD_LOGIC_VECTOR (31 downto 0):=x"00400C00" -- in byte
		FAT32_SECTOR0_OFFSET:STD_LOGIC_VECTOR (31 downto 0):=x"00400000" -- in byte
	);
    Port ( CLK:in STD_LOGIC;
           file_select:in std_logic_vector(7 downto 0);
           ram_A : out  STD_LOGIC_VECTOR (22 downto 0):=(others=>'0');
           ram_D : inout  STD_LOGIC_VECTOR (7 downto 0):=(others=>'Z'); -- for sim
           ram_W : out  STD_LOGIC:='0';
           spi_A : out  STD_LOGIC_VECTOR (31 downto 0);
           spi_D : in  STD_LOGIC_VECTOR (7 downto 0);
           spi_do : out  STD_LOGIC;
           spi_done : in  STD_LOGIC;
			  spi_init_done : in STD_LOGIC;
			  stop:in std_logic; -- stop main state machine
			  leds:out STD_LOGIC_VECTOR(7 downto 0);
			  load_init_done:out std_logic;
			  is_ucpm:out std_logic:='0'
			  );
			  	attribute keep : string;
				attribute keep of file_select : signal is "TRUE";

			  
end SDRAM_FAT32_LOADER;

architecture Behavioral of SDRAM_FAT32_LOADER is
	constant ATTR_ARCHIVE:std_logic_vector(7 downto 0):=x"20";
	constant file_dsk_extention:std_logic_vector((4)*8-1 downto 0):=x"44534B" & ATTR_ARCHIVE; -- DSK & ATTR_ARCHIVE
	constant file_dsk_address:std_logic_vector(31 downto 0):=x"00040000";
	subtype name_type is std_logic_vector(11*8-1 downto 0);
	type file_rom_name_type is array(ROM_COUNT-1 downto 0) of name_type;
	constant file_rom_name: file_rom_name_type:=
--		(x"4F53343634202020524F4D", -- OS464.ROM
--		x"4241534943312D30524F4D", -- BASIC1-0.ROM
--		x"414D53444F532020524F4D"); -- AMSDOS.ROM
		(x"4F53363132382020524F4D", -- OS6128.ROM
		 x"4241534943312D31524F4D", -- BASIC1-1.ROM
		x"414D53444F532020524F4D", -- AMSDOS.ROM
		x"4D4158414D202020524F4D"); -- MAXAM.ROM
	subtype address_type is std_logic_vector(31 downto 0);
	type file_rom_address_type is array(ROM_COUNT-1 downto 0) of address_type;
	constant file_rom_address: file_rom_address_type:=
		(x"00000000",
		x"00004000",
		x"00008000",
		x"0000C000");
	
	
	
	-- selon wiki eng : file allocation table
	constant BPB_RsvdSecCnt_addr:STD_LOGIC_VECTOR(31 downto 0):=x"0000000e";
	constant BPB_NumFATs_addr:STD_LOGIC_VECTOR(31 downto 0):=x"00000010";
	constant BPB_FATSz32_addr:STD_LOGIC_VECTOR(31 downto 0):=x"00000024";
	constant BPB_SecPerClus_addr:STD_LOGIC_VECTOR(31 downto 0):=x"0000000d";
	constant BPB_RootClus_addr:STD_LOGIC_VECTOR(31 downto 0):=x"0000002c"; 
	constant BPB_TotSec32_addr:STD_LOGIC_VECTOR(31 downto 0):=x"00000020";
	constant BPB_BytsPerSec_addr:STD_LOGIC_VECTOR(31 downto 0):=x"0000000B";
	
	signal data_reader1:STD_LOGIC_VECTOR(7 downto 0);
	signal data_reader2:STD_LOGIC_VECTOR(15 downto 0);
	signal data_reader4:STD_LOGIC_VECTOR(31 downto 0);
	
	signal data_do:boolean:=false;
	signal data_addr:STD_LOGIC_VECTOR(31 downto 0); -- data est utilis� pour lire les variables du BR
	signal data_length:integer range 1 to 4:=1;
	signal data_done:boolean:=true;
	signal data_spi_A:STD_LOGIC_VECTOR(spi_A'range);
	signal data_spi_do:std_logic:='0';
	
	signal compare_to12:STD_LOGIC_VECTOR(8*12-1 downto 0);
	--signal compare_to3:STD_LOGIC_VECTOR(8*3-1 downto 0);
	
	signal compare_length : integer range 3 to 12:=3;
	signal compare_result :boolean;
	signal compare_address:STD_LOGIC_VECTOR(31 downto 0);
	signal compare_do :boolean:=false;
	signal compare_done :boolean:=true;
	signal compare_spi_A:STD_LOGIC_VECTOR(spi_A'range);
	signal compare_spi_do:std_logic:='0';

	signal transmit_address_from:STD_LOGIC_VECTOR(31 downto 0);
	signal transmit_address_to:STD_LOGIC_VECTOR(31 downto 0);
	signal transmit_length:integer range 0 to BLOCK_SIZE;
	signal transmit_do:boolean:=false;
	signal transmit_done:boolean:=true;
	signal transmit_spi_A:STD_LOGIC_VECTOR(spi_A'range);
	signal transmit_spi_do:std_logic:='0';
	
	constant SWITCH_NONE:integer:=0;
	constant SWITCH_TRANSMIT:integer:=1;
	constant SWITCH_COMPARE:integer:=2;
	constant SWITCH_BR:integer:=3;
	
	signal switch_br_compare_transmit:integer range 0 to 3:=SWITCH_NONE;
	
	constant SWITCH_GRIPSOU:integer:=2;
	signal switch_transmit_gripsou:integer range 0 to 2:=SWITCH_NONE;

	signal transmit_ram_A:std_logic_vector(ram_A'range):=(others=>'0');
	signal transmit_ram_D:std_logic_vector(ram_D'range):=(others=>'Z');
	signal transmit_ram_W:std_logic:='0';
	signal gripsou_ram_A:std_logic_vector(ram_A'range):=(others=>'0');
	signal gripsou_ram_D:std_logic_vector(ram_D'range):=(others=>'Z');
	signal gripsou_ram_W:std_logic:='0';
	signal gripsou_address:std_logic_vector(ram_A'range):=(others=>'0');
	signal gripsou_data:std_logic_vector(ram_D'range):=(others=>'Z');
	signal gripsou_write:std_logic:='0';
	

begin

	ram_A<= gripsou_ram_A when switch_transmit_gripsou=SWITCH_GRIPSOU else transmit_ram_A when switch_transmit_gripsou=SWITCH_TRANSMIT else (others=>'0');
	ram_D<= gripsou_ram_D when switch_transmit_gripsou=SWITCH_GRIPSOU else transmit_ram_D when switch_transmit_gripsou=SWITCH_TRANSMIT else (others=>'Z');
	ram_W<= gripsou_ram_W when switch_transmit_gripsou=SWITCH_GRIPSOU else transmit_ram_W when switch_transmit_gripsou=SWITCH_TRANSMIT else '0';
	
	spi_A<=(others=>'0') when switch_br_compare_transmit=SWITCH_NONE
		else data_spi_A when switch_br_compare_transmit=SWITCH_BR
		else compare_spi_A when switch_br_compare_transmit=SWITCH_COMPARE
		else transmit_spi_A;

	spi_do<='0' when switch_br_compare_transmit=SWITCH_NONE
		else data_spi_do when switch_br_compare_transmit=SWITCH_BR
		else compare_spi_do when switch_br_compare_transmit=SWITCH_COMPARE
		else transmit_spi_do;

	-- permet de charger les variable BR, et les autres variables en g�n�ral
	spi_to_loader: process(CLK) is
		variable data_step:integer range 0 to 6:=0;
		variable data_cursor:integer range 0 to 3:=0;
		variable data_reader1_mem:std_logic_vector(7 downto 0):=(others=>'0');
		variable data_reader2_mem:std_logic_vector(15 downto 0):=(others=>'0');
		variable data_reader4_mem:std_logic_vector(31 downto 0):=(others=>'0');
		variable leds_mem:std_logic_vector(7 downto 0):=(others=>'0');
	begin
		--leds<=leds_mem;
		if rising_edge(CLK) then
			data_reader1<=data_reader1_mem;
			data_reader2<=data_reader2_mem;
			data_reader4<=data_reader4_mem;
			
			--leds<=conv_std_logic_vector(data_step,8);
			
			if data_do then
				data_done<=false;
				data_step:=0;
				if not (data_done) then
					data_step:=6; -- over run
				end if;
			end if;
			
			data_spi_do<='0'; -- heu c'est quoi �a d�j� ? un sorte de data_do
			
			if data_done then
				leds_mem(0):='0';
			else
				leds_mem(0):='1';
			end if;
			
			if not data_done then
				case data_step is
					when 0=>
						leds_mem(1):='0';
						leds_mem(2):='1';
						if not(data_spi_do='1') and spi_done='1' then
							leds_mem(1):='1';
							leds_mem(2):='0';
							data_cursor:=0;
							data_spi_A<=data_addr +data_cursor;
							data_step:=1;
							data_spi_do<='1';
						end if;
					when 1=>
						if not(data_spi_do='1') and spi_done='1' then
							case data_length is
								when 1 => -- 1 byte
									data_reader1_mem(7 downto 0):=spi_D(7 downto 0);
									data_step:=5;
								when 2 => -- 2 byte
									data_reader2_mem(15 downto 8):=spi_D(7 downto 0);
									data_cursor:=1;
									data_spi_A<=data_addr +data_cursor;
									data_step:=2;
									data_spi_do<='1';
								when 4 => -- 4 byte
									data_reader4_mem(31 downto 24):=spi_D(7 downto 0);
									data_cursor:=1;
									data_spi_A<=data_addr +data_cursor;
									data_step:=2;
									data_spi_do<='1';
								when 03 =>
									NULL;
							end case;
						end if;
					when 2 =>
						if not(data_spi_do='1') and spi_done='1' then
							case data_length is
								when 2 => -- 2 byte
									data_reader2_mem(7 downto 0):=spi_D(7 downto 0);
									data_step:=5;
								when 4 => -- 4 byte
									data_reader4_mem(23 downto 16):=spi_D(7 downto 0);
									data_cursor:=2;
									data_spi_A<=data_addr +data_cursor;
									data_step:=3;
									data_spi_do<='1';
								when 1 => NULL;
								when 3 => NULL;
							end case;
						end if;
					when 3 =>
						if not(data_spi_do='1') and spi_done='1' then
							case data_length is
								when 4 => -- 4 byte
									data_reader4_mem(15 downto 8):=spi_D(7 downto 0);
									data_cursor:=3;
									data_spi_A<=data_addr +data_cursor;
									data_step:=4;
									data_spi_do<='1';
								when 1 => NULL;
								when 2 => NULL;
								when 3 => NULL;
							end case;
						end if;
					when 4 =>
						if not(data_spi_do='1') and spi_done='1' then
							case data_length is
								when 4 => -- 4 byte
									data_reader4_mem(7 downto 0):=spi_D(7 downto 0);
									data_step:=5;
								when 1 => NULL;
								when 2 => NULL;
								when 3 => NULL;
							end case;
						end if;
					when 5 => -- variable transfert completed
						data_done<=true;
						data_step:=0;
					when 6=>NULL; -- over run
				end case;
			end if;
		end if;
	end process;

	-- compare 8bytes ou 3 bytes
	comparator:process(CLK) is
		variable compare_step:integer range 0 to 3:=0;
		variable cursor:integer range 0 to 12:=0;
		variable leds_mem:std_logic_vector(7 downto 0):=(others=>'0');
	begin
		--leds<=leds_mem;
		if rising_edge(CLK) then
			compare_spi_do<='0';
			--leds<=conv_std_logic_vector(compare_step,8);
			if compare_do then
				compare_done<=false;
				compare_step:=0;
				--compare_result<=false;
				if not compare_done then
					compare_step:=2;-- over run
				end if;
			end if;
			if not compare_done then
				compare_spi_A<=compare_address+cursor;
				if not(compare_spi_do='1') and spi_done='1' then
					case compare_step is
						when 0=>
							cursor:=0;
							compare_spi_do<='1';
							compare_spi_A<=compare_address+cursor;
							compare_step:=1;
						when 1=>
--							case compare_length is
--								when 3=>
--									if compare_to3((3-cursor)*8-1 downto (3-cursor-1)*8) /= spi_D then
--										compare_result<=false;
--										compare_done<=true;
--									else
--										cursor:=cursor+1;
--										if cursor>=3 then
--											compare_result<=true;
--											compare_done<=true;
--										else
--											compare_spi_do<='1';
--											compare_spi_A<=compare_address+cursor;
--										end if;
--										--compare_step:=3;
--									end if;
--									
--								when 11=>
									if compare_to12((12-cursor)*8-1 downto (12-cursor-1)*8) /= spi_D then
										compare_result<=false;
										compare_done<=true;
									else
										cursor:=cursor+1;
										if cursor>=compare_length then
											compare_result<=true;
											compare_done<=true;
										else
											compare_spi_do<='1';
											compare_spi_A<=compare_address+cursor;
										end if;
									end if;
--								when others=>NULL;
--							end case;
						when 2=>NULL; -- over run
						when 3=>NULL; -- debug
					end case;
				end if;
			end if;
		end if;
	end process;
	
	-- rempli la RAM
	transmiter:process(CLK) is
		variable cursor:integer range 0 to BLOCK_SIZE;
		variable transmit_step:integer range 0 to 4;
		variable leds_mem:std_logic_vector(7 downto 0);
		variable data_mem:std_logic_vector(7 downto 0);
		variable address_mem:std_logic_vector(ram_A'range);
	begin
		if rising_edge(CLK) then
			--leds<=leds_mem;
			--leds<=conv_std_logic_vector(transmit_step,8);
			if transmit_do then
				transmit_done<=false;
				cursor:=0;
				transmit_step:=0;
				if not transmit_done then
					transmit_step:=4;--over run
				end if;
			end if;
			transmit_spi_do<='0';
			transmit_ram_W<='0';gripsou_write<='0';
			if not transmit_done then
				-- read byte
				-- write byte
				transmit_spi_A<=transmit_address_from+cursor;
				leds_mem(1):='1';
				transmit_ram_A<=transmit_address_to(ram_A'range)+cursor;
				case transmit_step is
					when 0=>
						if not(transmit_spi_do='1') and spi_done='1' then
							leds_mem(2):='1';
							transmit_spi_do<='1';
							transmit_step:=1;
						end if;
					when 1=>
						leds_mem(3):='1';
						if not(transmit_spi_do='1') and spi_done='1' then
							leds_mem(4):='1';
							--transmit_ram_D<=conv_std_logic_vector(cursor,8);
							data_mem:=spi_D;
							transmit_ram_D<=data_mem;gripsou_data<=data_mem;
							address_mem:=transmit_address_to(ram_A'range)+cursor;
							gripsou_address<=address_mem;
							--leds<=conv_std_logic_vector(cursor,8);
							transmit_ram_W<='1';gripsou_write<='1';
							transmit_step:=2;
						end if;
					when 2=>
						leds_mem(5):='1';
						transmit_ram_W<='0';gripsou_write<='0';
						transmit_step:=0;
						cursor:=cursor+1;
						if cursor>=transmit_length then
							leds_mem(6):='1';
							leds_mem(7):='1';
							transmit_ram_D<=(others=>'Z');gripsou_data<=(others=>'Z');
							transmit_done<=true;
							transmit_step:=3;
						end if;
					when 3=>NULL; -- transmit SPI to RAM done
					when 4=>NULL; -- over run
				end case;
			end if;
		end if;
	end process;

	tortue_geniale:process (CLK,file_select) is
		variable BPB_FATSz32:STD_LOGIC_VECTOR(31 downto 0);
		variable BPB_TotSec32:STD_LOGIC_VECTOR(31 downto 0);
		variable BPB_BytsPerSec:STD_LOGIC_VECTOR(15 downto 0);
		variable BPB_SecPerClus:STD_LOGIC_VECTOR(7 downto 0);
		variable BPB_RootClus:STD_LOGIC_VECTOR(31 downto 0);
		variable BPB_RsvdSecCnt:STD_LOGIC_VECTOR(15 downto 0);
		variable BPB_NumFATs:STD_LOGIC_VECTOR(7 downto 0);
	
		variable FATSz:integer;
		variable TotSec:integer;
		variable FirstDataSector:integer;
		variable FirstSectorofCluster:integer;
		variable FirstRootDirSecNum:integer;
		
-- le premier param permet juste de checker la taille de la variable � la compilation
procedure get_var1(var_name: in STD_LOGIC_VECTOR(7 downto 0);var_addr:STD_LOGIC_VECTOR(31 downto 0)) is
begin
	data_length<=1;
	data_addr<=var_addr;
	data_do<=true;
	switch_br_compare_transmit<=SWITCH_BR;
end;
procedure get_var2(var_name: in STD_LOGIC_VECTOR(15 downto 0);var_addr:STD_LOGIC_VECTOR(31 downto 0)) is
begin
	data_length<=2;
	data_addr<=var_addr;
	data_do<=true;
	switch_br_compare_transmit<=SWITCH_BR;
end;
procedure get_var4(var_name: in STD_LOGIC_VECTOR(31 downto 0);var_addr:STD_LOGIC_VECTOR(31 downto 0)) is
begin
	data_length<=4;
	data_addr<=var_addr;
	data_do<=true;
	switch_br_compare_transmit<=SWITCH_BR;
end;


function fix_big_endian1(var_name: in STD_LOGIC_VECTOR(7 downto 0)) return STD_LOGIC_VECTOR is
begin
	return var_name;
end;
function fix_big_endian2(var_name: in STD_LOGIC_VECTOR(15 downto 0)) return STD_LOGIC_VECTOR is
	variable cache:STD_LOGIC_VECTOR(15 downto 0); -- frontiere a=f(a)
begin
	cache:=var_name(7 downto 0) & var_name(15 downto 8);
	return cache;
end;
function fix_big_endian4(var_name: in STD_LOGIC_VECTOR(31 downto 0)) return STD_LOGIC_VECTOR is
	variable cache:STD_LOGIC_VECTOR(31 downto 0); -- frontiere a=f(a)
begin
	cache:=var_name(7 downto 0) & var_name(15 downto 8) & var_name(23 downto 16) & var_name(31 downto 24);
	return cache;
end;

procedure compare12(name:std_logic_vector(8*12-1 downto 0);address:std_logic_vector(31 downto 0)) is
	--variable compare_address_mem:std_logic_vector(31 downto 0); -- fronti�re
begin
	--compare_address_mem:=address;
	compare_address<=address;--compare_address_mem;
	compare_to12<=name;
	compare_length<=12;
	compare_do<=true;
	switch_br_compare_transmit<=SWITCH_COMPARE;
end procedure;
procedure compare4(name:std_logic_vector(8*4-1 downto 0);address:std_logic_vector(31 downto 0)) is
begin
	compare_address<=address;
	compare_to12<=name & x"0000000000000000";
	compare_length<=4;
	compare_do<=true;
	switch_br_compare_transmit<=SWITCH_COMPARE;
end procedure;

procedure fillRAM(address_from:std_logic_vector(31 downto 0);address_to:std_logic_vector(31 downto 0);size:integer) is
begin
	transmit_address_from<=address_from;
	transmit_address_to<=address_to;
	transmit_length<=size; -- curseur : peut d�croire.
	transmit_do<=true;
	switch_br_compare_transmit<=SWITCH_TRANSMIT;
end;

-- retourne l'addresse memoire pointant vers le d�but du secteur
subtype address_type is std_logic_vector(31 downto 0);
impure function getSector(cluster:std_logic_vector(31 downto 0)) return address_type is
begin
	--return (conv_std_logic_vector(((conv_integer(cluster)-2)*conv_integer(BPB_SecPerClus))+FirstDataSector,32))*BPB_BytsPerSec+FAT32_SECTOR0_OFFSET;
	return (conv_std_logic_vector((((conv_integer(cluster)-2)*conv_integer(BPB_SecPerClus))+FirstDataSector)*conv_integer(BPB_BytsPerSec),32)+FAT32_SECTOR0_OFFSET);
end function;
-- retourne l'addresse memoire pointant vers le d�but du cluster suivant dans le FAT
impure function getFAT(cluster:std_logic_vector(31 downto 0)) return address_type is
begin
	--chaque cluster 4 bytes
	return conv_std_logic_vector(conv_integer(BPB_RsvdSecCnt)*conv_integer(BPB_BytsPerSec)+conv_integer(cluster)*4,32)+FAT32_SECTOR0_OFFSET;
end function;


-- free cluster
function fc(cluster:std_logic_vector(31 downto 0)) return boolean is
begin
	return cluster = x"00000000";
end function;

-- reserved cluster
function rc(cluster:std_logic_vector(31 downto 0)) return boolean is
begin
	return cluster = x"00000001" or (cluster>=x"0FFFFFF0" and cluster<=x"0FFFFFF7");
end function;

-- end of cluster
function eoc(cluster:std_logic_vector(31 downto 0)) return boolean is
begin
	return cluster >= x"0FFFFFF8" and cluster <= x"0FFFFFFF" ;
end function;

-- out of range cluster
function oc(cluster:std_logic_vector(31 downto 0)) return boolean is
begin
	return cluster > x"0FFFFFFF";
end function;

-- general bad/useless cluster
function bc(cluster:std_logic_vector(31 downto 0)) return boolean is
begin
	return fc(cluster) or rc(cluster) or eoc(cluster) or oc(cluster);
end function;

		variable step_var:integer range 0 to 31:=0;
		variable load_done:std_logic:='0';
		
		variable folder_cluster_pointer:std_logic_vector(31 downto 0); -- number
		--variable folder_cluster_fat:std_logic_vector(31 downto 0); -- address
		variable file_cluster_pointer:std_logic_vector(31 downto 0); -- number
		--variable file_cluster_fat:std_logic_vector(31 downto 0); -- address
		variable file_cluster_pointer_H:std_logic_vector(15 downto 0);
		variable file_cluster_pointer_L:std_logic_vector(15 downto 0);
		variable folder_sector_pointer:std_logic_vector(31 downto 0);
		variable file_sector_pointer:std_logic_vector(31 downto 0);
		
		variable rom_number:integer range 0 to ROM_COUNT:=0;
		variable dsk_number:std_logic_vector(7 downto 0):=(others=>'0');
		
		variable file_address:std_logic_vector(31 downto 0);
		variable folder_DirStruct_number:integer;
		
		variable file_size:std_logic_vector(31 downto 0);
		
		variable leds_mem:std_logic_vector(7 downto 0):=(others=>'0');
		variable locker:std_logic_vector(2 downto 0):=(others=>'0');

		--variable file_select_mem:std_logic_vector(7 downto 0);
	--files_loaded(0) : dsk loaded
	--files_loaded(1:3) : rom 1 2 3 loaded
	variable files_loaded:std_logic_vector((1+ROM_COUNT)-1 downto 0):="0000" & DSK_OFF; -- m�chant doute(DSK_OFF,others=>'0');

		
	begin
		load_init_done<=load_done;
		--leds<=leds_mem;
		
		if rising_edge(CLK) then
			--file_select_mem:=file_select; -- sinon l'optimisateur coupe le fil...
		
			--leds<=conv_std_logic_vector(step_var,8);
			leds<=files_loaded & "111";
			--leds<=dsk_number;
			--leds<=conv_std_logic_vector(folder_DirStruct_number,8);
			--leds<=files_loaded & locker & "0";
			
			if data_done then
				locker(0):='0';
			else
				locker(0):='1';
			end if;
			if transmit_done then
				locker(1):='0';
			else
				locker(1):='1';
			end if;
			if compare_done then
				locker(2):='0';
			else
				locker(2):='1';
			end if;
		
			leds_mem(0):=spi_init_done;
			if load_done='0' and spi_init_done='1' then
			
				data_do<=false;
				compare_do<=false;
				transmit_do<=false;
				
if stop='0' and not(data_do) and data_done and not(transmit_do) and transmit_done and not(compare_do) and compare_done then
				
				case step_var is
					when 0 =>
						get_var4(BPB_FATSz32,BPB_FATSz32_addr+FAT32_SECTOR0_OFFSET);
						step_var:=1;
					when 1 =>
						BPB_FATSz32:=fix_big_endian4(data_reader4);
--						if BPB_FATSz32=x"00003AA9" then --x"000003B0" then -- debug
							get_var4(BPB_TotSec32,BPB_TotSec32_addr+FAT32_SECTOR0_OFFSET);
							step_var:=2;
--						end if;
					when 2=>
						BPB_TotSec32:=fix_big_endian4(data_reader4);
--						if BPB_TotSec32=x"0075D000" then --x"00760000" then --debug
							get_var1(BPB_SecPerClus,BPB_SecPerClus_addr+FAT32_SECTOR0_OFFSET);
							step_var:=3;
--						end if;
					when 3=>
						BPB_SecPerClus:=fix_big_endian1(data_reader1);
--						if BPB_SecPerClus=x"04" then--x"40" then --debug
							get_var4(BPB_RootClus,BPB_RootClus_addr+FAT32_SECTOR0_OFFSET);
							step_var:=4;
--						end if;
					when 4=>
						BPB_RootClus:=fix_big_endian4(data_reader4);
--						if BPB_RootClus=x"00000002" then --x"00000002" then --debug
							get_var2(BPB_RsvdSecCnt,BPB_RsvdSecCnt_addr+FAT32_SECTOR0_OFFSET);
							step_var:=5;
--						end if;
					when 5=>
						BPB_RsvdSecCnt:=fix_big_endian2(data_reader2);
--						if BPB_RsvdSecCnt=x"0AAE" then--x"18A0" then --debug
							get_var1(BPB_NumFATs,BPB_NumFATs_addr+FAT32_SECTOR0_OFFSET);
							step_var:=6;
--						end if;
					when 6=>
						BPB_NumFATs:=fix_big_endian1(data_reader1);
--						if BPB_NumFATs=x"02" then--x"02" then -- debug
							get_var2(BPB_BytsPerSec,BPB_BytsPerSec_addr+FAT32_SECTOR0_OFFSET);
							step_var:=7;
--						end if;
					when 7=>
						--===========================================
						--== FIN DE CHARGEMENT DES VARIABLES DU BR ==
						--===========================================
						BPB_BytsPerSec:=fix_big_endian2(data_reader2);
--						if BPB_BytsPerSec=x"0200" then --x"0200" then -- debug
							FATSz := conv_integer(BPB_FATSz32); -- 15017 --944
							TotSec := conv_integer(BPB_TotSec32); -- 7720960 --7733248 alors que sous HsD j'en ai 7725056, bref l'�trange offset de 2000h
							-- 2734+2*15017=32768
							--FirstDataSector=32768
							-- BPB_RsvdSecCnt<2000h attention 2000h est exprim� en bloc512 (et non en BLOC_SIZE)
							-- BPB_RsvdSecCnt>400h donc comprend peut-�tre les secteurs avant l'offset 2000h (block512)
							FirstDataSector:=conv_integer(BPB_RsvdSecCnt)+(conv_integer(BPB_NumFATs)*FATSz) + 0;
							
							-- sector 0 liste : offset 2000h block512
							-- 0000h
							-- 0C00h bytes
							
							folder_cluster_pointer:=BPB_RootClus; --2
--							folder_sector_pointer:=getSector(folder_cluster_pointer);
							
							--((2-2)*4+32768)*512= 32768 block512
							-- sector 32768 ok : nom="FUCK3"
								--getCluster : 0 -- free cluster
							-- next(2)=2734*512+2*4 "FF FF FF 0F" 	Last cluster in file
							
							--On remarque que le secteur 32768 comprend une suite de DIRStruct de 32bytes �tal� sur 4096 bytes c'est � dire les 4 secteurs 512 du cluster
							
							-- arkanoid getCluster="42 01" 0142h=322
							--((322-2)*4+32768)*512= 34048 block512
								-- on a 4 secteurs � la suite comprenant le d�but hexa d'arkanoid
								-- suivit de 4 autres secteurs � la suite comprenant le d�but hexa d'arkanoid
							-- next 2734*512+322*4 ==> "43 01 00 00" 0143h=323 jackpot
							--filesize(arkanoid)="00 F9 02 00" 02F900=194816 octets : correct :)
							
							--si DIRStruct.name=00h alors il n'y a pas de fichier ici (entr�e vide)
	
--if conv_integer(folder_cluster_pointer)/=2 then
--	step_var:=32;
--elsif FirstDataSector/=32768 then
--	step_var:=33;
--
----return (conv_std_logic_vector(((conv_integer(cluster)-2)*conv_integer(BPB_SecPerClus))+FirstDataSector,32))*BPB_BytsPerSec+FAT32_SECTOR0_OFFSET;
--elsif conv_integer(BPB_SecPerClus)/=4 then
--	step_var:=34;
--elsif conv_integer(BPB_BytsPerSec)/=512 then
--	step_var:=35;
--elsif conv_integer(FAT32_SECTOR0_OFFSET)/512 /=8192 then
--	step_var:=36;
----	return (conv_std_logic_vector(,32)+FAT32_SECTOR0_OFFSET);
--elsif (((conv_integer(folder_cluster_pointer)-2)*conv_integer(BPB_SecPerClus))+FirstDataSector)*conv_integer(BPB_BytsPerSec) /=32768*512 then
--	step_var:=37;
--
--else
							step_var:=25;
--end if;
--						end if;
					when 25=> -- impure variable setted, so impure function are now useable...
						folder_sector_pointer:=getSector(folder_cluster_pointer);
--						if conv_integer(folder_sector_pointer)/=(32768+8192)*512 then
--							step_var:=38;
--						else
							
							if bc(folder_cluster_pointer) then
								step_var:=27;
							else
								step_var:=8;
								folder_DirStruct_number:=0;
							end if;
--						end if;
						
	
					when 8=> -- parcour la liste de DIRStruct
						--========================================================
						--== PARCOUR LISTE DIRSTRUCT D'UN FOLDER_SECTOR_POINTER ==
						--========================================================
						folder_DirStruct_number:=folder_DirStruct_number+1;
						if folder_DirStruct_number=conv_integer(BPB_SecPerClus)*(conv_integer(BPB_BytsPerSec)/32) then
							-- dernier DataStruct de l'ensemble des secteurs du cluster totalement parcouru
							step_var:=9;
						else
							rom_number:=0;
							step_var:=30;--10;
						end if;
					when 9=>
						--=========================
						--== NEXT FOLDER CLUSTER ==
						--=========================
						if bc(folder_cluster_pointer) then
							-- that's all sucks
							load_done:='0';
							switch_transmit_gripsou<=SWITCH_NONE;
						else
							get_var4(folder_cluster_pointer,getFAT(folder_cluster_pointer));
							step_var:=12;
						end if;
					when 30=>
						--================================
						--== DETECTION FIN DE DIRSTRUCT ==
						--================================
						--compare11(x"0000000000000000000000",(conv_std_logic_vector(32768,32)+x"2000")*x"200");
						compare12(x"000000000000000000000000",folder_sector_pointer+(folder_DirStruct_number-1)*32);
						--ok compare11(x"4655434B33202020202020",folder_sector_pointer+(folder_DirStruct_number-1)*32);
						--compare11(x"414D53444F532020524F4D",conv_std_logic_vector((32768+8192)*512+3*32 ,32)); -- 32768 + 3*32
									 --414D53444F532020524F4D
						--compare11(x"464D53444F532020524F4D",conv_std_logic_vector((32768+8192)*512+3*32 ,32)); -- 32768 + 3*32
						
						step_var:=31;
					when 31=>
--						if file_rom_name(0)/=x"414D53444F532020524F4D" then -- debug
--							step_var:=42;
--						else
							if compare_result then
								--step_var:=40;--
								step_var:=9;
							else
								--step_var:=41;--
								step_var:=10;
							end if;
--						end if;
					when 10=>
						--=======================
						--== RECHERCHE DES ROM ==
						--=======================
						switch_transmit_gripsou<=SWITCH_TRANSMIT;
						if rom_number=ROM_COUNT then
							step_var:=11;
						else
							if files_loaded(rom_number+1)='1' then
								rom_number:=rom_number+1;
								step_var:=10;
							else
								file_address:=file_rom_address(rom_number);
								--compare11(file_rom_name(rom_number),(conv_std_logic_vector(32768,32)+x"2000")*x"200");
								compare12(file_rom_name(rom_number) & ATTR_ARCHIVE,folder_sector_pointer+(folder_DirStruct_number-1)*32);
								step_var:=13;
							end if;
						end if;
					when 11=>
						--=======================
						--== RECHERCHE DES DSK ==
						--=======================
						switch_transmit_gripsou<=SWITCH_GRIPSOU;
						if files_loaded(0)='1' then
							if files_loaded="11111" then
								load_done:='1';
								switch_transmit_gripsou<=SWITCH_NONE;
								step_var:=26; -- load done
							else
								step_var:=8; -- next DIRStruct
							end if;
						else
							file_address:=file_dsk_address;
							compare4(file_dsk_extention,folder_sector_pointer+(folder_DirStruct_number-1)*32+8);
							step_var:=21;
						end if;
					when 12=> -- next folder cluster
						folder_cluster_pointer:=fix_big_endian4(data_reader4);
						step_var:=23;
					when 23=>
						folder_sector_pointer:=getSector(folder_cluster_pointer);
						if bc(folder_cluster_pointer) then
							step_var:=28;
						else
							step_var:=8;
							folder_DirStruct_number:=0;
						end if;
					when 13=> -- search ROM
						if compare_result then
							-- nom et extention de fichier identique
							files_loaded(rom_number+1):='1';
							get_var4(file_size,folder_sector_pointer+(folder_DirStruct_number-1)*32+28);
							step_var:=14;
						else
							rom_number:=rom_number+1;
							step_var:=10;
						end if;
					when 14=>
						file_size:=fix_big_endian4(data_reader4);
						--"00 40 00 00"
--						if file_size/=x"00004000" then
--							step_var:=41;
--						else
							get_var2(file_cluster_pointer_H,folder_sector_pointer+(folder_DirStruct_number-1)*32+20);
							step_var:=15;
--						end if;
					when 15=>
						file_cluster_pointer_H:=fix_big_endian2(data_reader2);
						get_var2(file_cluster_pointer_L,folder_sector_pointer+(folder_DirStruct_number-1)*32+26);
						step_var:=16;
					when 16=>
						file_cluster_pointer_L:=fix_big_endian2(data_reader2);
						file_cluster_pointer:=file_cluster_pointer_H & file_cluster_pointer_L;
						step_var:=24;
					when 24=>
						file_sector_pointer:=getSector(file_cluster_pointer);
						if bc(file_cluster_pointer) then
							step_var:=29;
						else
							step_var:=17;
						end if;
						
--						leds_mem:=file_cluster_pointer(31 downto 24);
--						if file_cluster_pointer/=x"0000012A" then
--							step_var:=41;
--						else
--							step_var:=40;
--						end if;
					when 17=>
						-- transmition
						if file_size>conv_std_logic_vector(conv_integer(BPB_SecPerClus)*conv_integer(BPB_BytsPerSec),32) then
							fillRAM(file_sector_pointer,file_address,conv_integer(BPB_SecPerClus)*conv_integer(BPB_BytsPerSec));
							file_size:=file_size-conv_std_logic_vector(conv_integer(BPB_SecPerClus)*conv_integer(BPB_BytsPerSec),32);
							step_var:=19;
						else
							fillRAM(file_sector_pointer,file_address,conv_integer(file_size));
							step_var:=18;
							-- that's all folk
						end if;
					when 18=>
						-- that's all folk
--						step_var:=8; -- next DIRStruct
if files_loaded="11111" then
	load_done:='1';
	switch_transmit_gripsou<=SWITCH_NONE;
	step_var:=26; -- load done
else
	step_var:=8; -- next DIRStruct
end if;


--oui mais si c'�tait la derni�re disquette???
						
						
						
						
					when 19=>
						get_var4(file_cluster_pointer,getFAT(file_cluster_pointer));
						step_var:=20;
					when 20=>
						file_cluster_pointer:=fix_big_endian4(data_reader4);
						step_var:=22;
					when 22=>
						file_sector_pointer:=getSector(file_cluster_pointer);
						file_address:=file_address+conv_std_logic_vector(conv_integer(BPB_SecPerClus)*conv_integer(BPB_BytsPerSec),32);
						if bc(file_cluster_pointer) then
							step_var:=18; -- that's all folk
						else
							step_var:=17; -- transmit next block to RAM
						end if;
					when 21=> -- search DSK
						if compare_result then
							-- nom et extention de fichier identique
							if dsk_number>=file_select then
								files_loaded(0):='1';
								get_var4(file_size,folder_sector_pointer+(folder_DirStruct_number-1)*32+28);
								step_var:=14;
							else
								dsk_number:=dsk_number+1;
								step_var:=8;
							end if;
						else
							step_var:=8;
						end if;
						
						

--when 24=>NULL;
--when 25=>NULL;
--when 22=>
--	file_size:=conv_std_logic_vector(BLOCK_SIZE*2,32);--conv_std_logic_vector(100000,32);
--	file_sector_pointer:=conv_std_logic_vector(0,32);
--	step_var:=23;
--when 23=>
--	-- transmition
--	if file_size>BLOCK_SIZE then
--		fillRAM(file_sector_pointer,file_sector_pointer,BLOCK_SIZE);
--		step_var:=25;
--	else
--		fillRAM(file_sector_pointer,file_sector_pointer,conv_integer(file_size));
--		-- that's all folk
--		step_var:=24;
--	end if;
--when 24=>
--	load_done:='1';
--	switch_transmit_gripsou<=SWITCH_NONE;
--	step_var:=26;
--when 25=>
--	file_size:=file_size-BLOCK_SIZE;
--	file_sector_pointer:=file_sector_pointer+BLOCK_SIZE;
--	step_var:=23;
					when 26=>NULL; -- load done
					when 27=>NULL; -- bad root folder cluster
					when 28=>NULL; -- bad next folder cluster
					when 29=>NULL; -- bad file cluster
					--when 32=>NULL; -- bad root cluster pointer debug
					--when 33=>NULL; -- bad firstaddress debug
					--when 34=>NULL; -- bad 4 debug
					--when 35=>NULL; -- bad 512 debug
					--when 36=>NULL; -- bad offset debug
					--when 37=>NULL; -- bad root address pointer debug
					--when 38=>NULL; -- bad root address pointer debug
					--when 40=>NULL; -- yeah !
					--when 41=>NULL; -- oh no !
					--when 42=>NULL; -- first rom name failed
				end case;
end if;
			end if;
		end if;
	end process tortue_geniale;
	
	gripsou:process(CLK) is
		variable gripsou_step:integer range 0 to 25:=0;
		variable input_A:std_logic_vector(31 downto 0):=(others=>'0');
		variable data_mem:std_logic_vector(7 downto 0);
		variable winape_offs:std_logic_vector(31 downto 0):=(others=>'0');
		variable extended:boolean:=false;
		variable winape:boolean:=false;
		variable nb_tracks:integer range 0 to 63:=0; -- super cauldron has 42 tracks !!!
		variable no_track:integer range 0 to 63:=0; -- force simple face
		variable nb_sides:integer range 0 to 3:=1;
		variable no_side:integer range 0 to 3:=0;
		variable nb_sects:integer range 0 to 14:=9; -- super cauldron has 10 sectors !!
		--variable sectID:std_logic_vector(7 downto 0);
		variable no_sect:integer range 0 to 14;
		--type track_size_type is array(0 to 39) of std_logic_vector(15 downto 0);
		--variable track_size:track_size_type;
		variable track_size:std_logic_vector(15 downto 0);
		--variable ucpm:std_logic:='0';
		type sector_sizes_type is array(0 to 6) of std_logic_vector(15 downto 0);
		--constant SECTOR_SIZE:sector_sizes_type:=(x"0080",x"0100",x"0200",x"0400",x"0800",x"1000",x"1800");
		constant SECTOR_SIZE:std_logic_vector(15 downto 0):=x"0200";
		variable sectSize:std_logic_vector(15 downto 0);
		variable sector_countdown:integer range 0 to 9;
		variable track_countdown:integer range 0 to 40*2;
		variable gripsou_ram_A_mem:std_logic_vector(gripsou_ram_A'range);
		type sector_order_type is array(0 to 8) of integer range 0 to 8;
		variable sector_order:sector_order_type;
	begin
		--is_ucpm<=ucpm;
		--leds<=conv_std_logic_vector(gripsou_step,8);
		if rising_edge(CLK) then
			gripsou_ram_D<=(others=>'Z');
			gripsou_ram_W<='0';
			if gripsou_write='1' and switch_transmit_gripsou=SWITCH_GRIPSOU then
				data_mem:=gripsou_data;
				case gripsou_step is
					when 0=> -- disk ID
						if input_A=x"00000000" then
							if data_mem=x"45" then
								extended:=true;
							elsif data_mem=x"4D" then
								extended:=false;
--								gripsou_step:=25; -- debug
							end if;
						end if;
--						if gripsou_address(15 downto 0)/=input_A(15 downto 0) then
--							gripsou_step:=26;
--							--leds<=input_A(7 downto 0);
--						end if;
						input_A:=input_A+1;
						if input_A>x"00000021" then
							gripsou_step:=1;
						end if;
					when 1=> -- disk creator
						if input_A=x"00000022" then
							if data_mem=x"57" then
								winape:=true;
--								gripsou_step:=26; -- debug
							else
								winape:=false;
								--leds<=data_mem;
								--gripsou_step:=22; -- debug
							end if;
						end if;
						input_A:=input_A+1;
						if input_A>x"0000002f" then
							gripsou_step:=2;
						end if;
					when 2=>
						nb_tracks:=conv_integer(data_mem);
						input_A:=input_A+1;
--						if (nb_tracks/=42) then
--							gripsou_step:=26; --debug
--						else
							gripsou_step:=3;
--						end if;
					when 3=>
						if input_A=x"00000031" then
							nb_sides:=conv_integer(data_mem);
						end if;
						input_A:=input_A+1;
						--if (nb_sides/=1) then
						--	gripsou_step:=24;
						--else
							gripsou_step:=4;
						--end if;
        			when 4=>
						if input_A=x"00000032" then
--							for i in 0 to 39 loop
								--track_size(i)(7 downto 0):=track_size(i)(15 downto 8);
								--track_size(i)(15 downto 8):=data_mem;
								track_size(7 downto 0):=data_mem;
								--track_size(7 downto 0):=track_size(15 downto 8);
							--end loop;
						elsif input_A=x"00000033" then
							track_size(15 downto 8):=data_mem;
						end if;
						input_A:=input_A+1;
						if input_A>x"00000033" then
							if extended then
								gripsou_step:=5;
								no_track:=0;
							else
								gripsou_step:=6;
							end if;
						end if;
					when 5=>
						track_size:=data_mem & x"00";
						no_track:=no_track+1;
						input_A:=input_A+1;
						if no_track>=nb_tracks then
--							if track_size/=x"1500" then
--								gripsou_step:=27;
--							else
								gripsou_step:=6;
--							end if;
						end if;
					when 6=> -- avancer jusqu'au d�but track-info
						input_A:=input_A+1;
						if input_A>x"000000FF" then --==============================================
							gripsou_step:=7;
							no_track:=0;
							input_A:=(others=>'0'); -- rembobine
							winape_offs:=(others=>'0'); -- rembobine
						end if;
					when 7=> -- pour chaque track
						input_A:=input_A+1;
						if input_A>x"0000000F" then
							gripsou_step:=10;
						end if;
					when 8=>NULL;
					when 9=>NULL;
					when 10=>
						input_A:=input_A+1;
						if input_A>x"0000000014" then
							gripsou_step:=11;
						end if;
					when 11=>
						nb_sects:=conv_integer(data_mem);
						input_A:=input_A+1;
--						if nb_sects/=10 then
--							gripsou_step:=28;
--						else
							gripsou_step:=12;
--						end if;
					when 12=>
						input_A:=input_A+1;
						if input_A>x"0000000017" then --===============================================
							gripsou_step:=13;
							--winape_offs:=winape_offs+input_A;
							--input_A:=(others=>'0');
							no_sect:=0;
						end if;
					when 13=> -- first sector info of sector info list
						-- C
						input_A:=input_A+1;
						if conv_integer(data_mem)/=no_track then -- deraillage
							gripsou_step:=25;
						else
							gripsou_step:=14;
						end if;
					when 14=>
						-- H
						no_side:=conv_integer(data_mem);
						input_A:=input_A+1;
						--if no_side/=0 then
						--	gripsou_step:=29;
						--else
							gripsou_step:=15;
						--end if;
					when 15=>
						-- R
						--sectID:=data_mem;
						sector_order(no_sect):=conv_integer(data_mem(3 downto 0))-1;
						input_A:=input_A+1;
						--if no_sect/=0 then
						--	gripsou_step:=30;
						--else
							gripsou_step:=16;
						--end if;
						if data_mem>=x"C1" then
							is_ucpm<='0';
						else
							is_ucpm<='1';
						end if;
					when 16=>
						-- N
						sectSize:=SECTOR_SIZE; --(conv_integer(data_mem)); -- must be 2 then 512
						input_A:=input_A+1;
						
						--if data_mem/=x"02" then
						--	gripsou_step:=31;
						--else
							gripsou_step:=21;	
						--end if;
					when 21=>
						input_A:=input_A+1;
						gripsou_step:=22;
					when 22=>
						input_A:=input_A+1;
						gripsou_step:=23;
					when 23=>
						input_A:=input_A+1;
						gripsou_step:=24;
					when 24=>
						input_A:=input_A+1;
						no_sect:=no_sect+1;
						if no_sect>=nb_sects then
							gripsou_step:=17;
						else
							gripsou_step:=13;
						end if;
						
						
						
					when 17=>
						input_A:=input_A+1;
						if input_A>x"000000FF" then --=============================================
							gripsou_step:=18;
							no_sect:=0;
							no_side:=0;
							--no_track:=0;
							winape_offs:=winape_offs+input_A;
							input_A:=(others=>'0');
						end if;
					when 18=> -- data transmit
						gripsou_ram_A_mem:="00" & "1" & conv_std_logic_vector(no_track,6) & conv_std_logic_vector(no_side,1) & conv_std_logic_vector(sector_order(no_sect),4) & input_A(8 downto 0);
						gripsou_ram_A<=gripsou_ram_A_mem;
						--if no_track<32 then -- 2^5=32 donc de 0 � 31, donc moins de 40 !
							gripsou_ram_W<='1';
						--end if;
						gripsou_ram_D<=data_mem;
						
						--if no_track=0 and no_sect=0 and input_A=1 and data_mem/=x"47" then
						--	gripsou_step:=32;
						--elsif no_track=1 and no_sect=0 and input_A=0 and data_mem/=x"8C" then
						--	gripsou_step:=33;
						--else
							input_A:=input_A+1;
							if input_A>=sectSize then
								no_sect:=no_sect+1;
								winape_offs:=winape_offs+input_A;
								input_A:=(others=>'0');
								if	no_sect=nb_sects then
									no_track:=no_track+1;
									no_sect:=0;
									if	no_track=nb_tracks then
										gripsou_step:=20;
									else
										if winape then
											gripsou_step:=7;
										else
											--if winape_offs=track_size(no_track) then
											if winape_offs=track_size then
												winape_offs:=(others=>'0');
												gripsou_step:=7;
											else
												gripsou_step:=19;
											end if;
										end if;
									end if;
								else
									gripsou_step:=18;
								end if;
							end if;
						--end if;
					when 19=> -- not winape
						winape_offs:=winape_offs+1;
						--if winape_offs=track_size(no_track) then
						if winape_offs=track_size then
							winape_offs:=(others=>'0');
							input_A:=(others=>'0');
							gripsou_step:=7;
						end if;
					when 20=>NULL; -- fin
					when 25=>NULL; -- deraillage : no_track incorrect
				end case;
			end if;
		end if;
	end process gripsou;
end Behavioral;