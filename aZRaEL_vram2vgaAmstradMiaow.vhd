library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity aZRaEL_vram2vgaAmstradMiaow is
    Generic(
	 HardHZoom : integer:=1; -- divise l'horloge nécessaire par HardHZoom et HZoom HardHZoom fois
	 -- Amstrad
	 -- 
	 --OFFSET:STD_LOGIC_VECTOR(15 downto 0):=x"C000";
	 -- ecran.bas
	 -- CLS
	 -- FOR A=&C000 TO &FFFF
	 -- POKE A,&FF
	 -- NEXT A
	 -- 
	 -- ligne.bas
	 -- CLS
	 -- FOR A=&C000 TO &C050
	 -- POKE A,&FF
	 -- NEXT A
	 -- 
	 -- lignes.bas
	 -- CLS
	 -- FOR A=&C000 TO &C7FF
	 -- POKE A,&FF
	 -- NEXT A
	 -- 
	 -- Organisation d'un octet :
	 -- mode 1 :
	 --   1 octet <=> 4 pixels
	 --   [AAAA][BBBB] : superposition des couleurs de [AAAA] et [BBBB]
	 --   A+B=0+0=bleu foncé (couleur du fond par défaut)
	 --   A+B=0+1=bleu clair
	 --   A+B=1+0=jaune
	 --   A+B=1+1=rouge
	 --  par exemple [1100][0011] donnera 2 pixels jaune suivi de 2 pixels bleu clair &C3
	 -- mode 0 : 
	 --   1 octet <=> 2 pixels
	 --   [AA][BB][CC][DD] : superposition des couleurs de AA, BB, CC, DD
	 --   comme il y a "trop" de combinaisons pour une sortie RGB sans variation de lumière
	 --   ils ont fait clignoter les dernière combinaisons. La variation de lumière a été
	 --   ajouté par la suite, avec PEN/PAPER...
	 -- mode 2 :
	 --   1 octet <=> 8 pixels
	 --   [AAAAAAAA] : on a donc que 2 couleurs xD
	 MODE_MAX:integer:=2;
--	 NB_PIXEL_PER_OCTET:integer:=4;--2**(MODE+1);
	NB_PIXEL_PER_OCTET_MAX:integer:=8;
	NB_PIXEL_PER_OCTET_MIN:integer:=2;
	 -- Lorsqu'on lance lignes.bas on peut ensuite déplacer le curseur pour compter
	 -- mode 1 :
	 --   On a 40 caractères par lignes en mode 1, un caractère fait 8 pixels de large
	 CHAR_WIDTH:integer:=16; -- c'est stupide en fait c'est l'octet, car le crtc pond des adresses et non une sortie RGB normalement xD
	 -- On a 320x200pixels=64000pixels=16000 octets utilisés
	 --  or on scanne &FFFF+1-&C000=16384 octets... donc il y a des trous x)
	 -- 
	 -- trou.bas
	 -- MODE 1
	 -- CLS
	 -- FOR A=0 TO 639
	 -- FOR B=0 to 399
	 -- PLOT a,b
	 -- NEXT b
	 -- NEXT a
	 -- 
	 -- On observe le snapshoot on a des &F0 aux adresses :
	 -- C000 à C7D0-1
	 -- C800 à CFD0-1
	 -- D000 à D7D0-1
	 -- D800 à DFD0-1
	 -- E000 à E7D0-1
	 -- E800 à EFD0-1
	 -- F000 à F7D0-1
	 -- F800 à FFD0-1
	 --
	 -- plus rapide :D
	 --
	 -- trou2.bas
	 -- paper 2
	 -- cls
	 -- 
	 -- si on va en bas de l'écran afin de remonter l'image d'un cran et qu'on refait un snapshoot
	 -- on remarque que c'est le bazard niveau mémoire : les trou ne sont plus au même endroit !
	 -- c'est pourquoi j'ai mis "MODE 1" dans trou.bas x)
	 -- si on remonte l'image en allant en bas de l'écran avec le curseur
	 --  un "poke &C000,&ff" ne vise plus en haut à gauche... parfois il ne marche même plus : il est dans le trou !
	 -- 
--   --modeline label pxcl HDsp HSS HSE HTot VDsp VSS VSE VTot flags
--   --modeline "640x480@60" 25.2 640 656 752 800 480 490 492 525 -vsync -hsync
              label_modeline  :string:="640x480@60";--(ignored  by  svgalib) mainly there to be compatible with XF86Config.   I  use  the  format  "Width  x   Height   @   Vert.Refresh", but that's just personal taste...
              pxcl:string:="25.2"; -- the pixel clock in MHz
              HDsp:integer:=640; -- size of the visible area (horizontal/vertical)
              HSS:integer:=656; -- Sync start (horizontal/vertical)
              HSE:integer:=752; -- Sync end (horizontal/vertical)
              HTot:integer:=800; -- Total width/height (end of back porch)
              VDsp:integer:=480; -- size of the visible area (horizontal/vertical)
              VSS:integer:=490; -- Sync start (horizontal/vertical)
              VSE:integer:=492; -- Sync end (horizontal/vertical)
              VTot:integer:=525; -- Total width/height (end of back porch)
				  nvsync:std_logic:='1';--flags  +vsync -vsync
				  nhsync:std_logic:='1'; --flags  +hsync -hsync
              --flags  interlace interlaced
              --       doublescan Sync polarity, interlace mode
				  SQRT_VRAM_SIZE:integer:=16;

				  HZoom:integer:=1;
				  VZoom:integer:=2;
				  
				  VRAM_HDsp:integer:=800; --suivant les mode, le nombre de pixels affichés est constant !
				  VRAM_VDsp:integer:=300 --600/2
		  );
    Port ( DATA : in  STD_LOGIC_VECTOR (7 downto 0); -- buffer
           ADDRESS : out  STD_LOGIC_VECTOR (14 downto 0);
			  PALETTE_D : in STD_LOGIC_VECTOR (7 downto 0);
			  PALETTE_A : out STD_LOGIC_VECTOR (12 downto 0);
           RED : out  STD_LOGIC_VECTOR(1 downto 0);
           GREEN : out  STD_LOGIC_VECTOR(2 downto 0);
           BLUE : out  STD_LOGIC_VECTOR(1 downto 0);
           VSYNC : out  STD_LOGIC;
           HSYNC : out  STD_LOGIC;
           CLK_25MHz : in  STD_LOGIC
			  );
end aZRaEL_vram2vgaAmstradMiaow;

architecture Behavioral of aZRaEL_vram2vgaAmstradMiaow is
	constant DO_NOTHING_OUT : integer range 0 to 2:=0;
	constant DO_READ : integer range 0 to 2:=1;
	constant DO_BORDER: integer range 0 to 2:=2;
	
	constant DO_NOTHING : STD_LOGIC:='0';
	constant DO_HSYNC : STD_LOGIC:='1';
	constant DO_VSYNC : STD_LOGIC:='1';

	constant VDecal_negatif:integer:=(600/2-480/2)/2;
	constant HDecal_negatif:integer:=(800-640)/2;
	constant HDecal:integer:=0;
	constant VDecal:integer:=0;
	
	type palette_type is array(31 downto 0) of std_logic_vector(5 downto 0); -- RRVVBB
	constant palette:palette_type:=(
		20=>"000000",
		 4=>"000001",
		21=>"000011",
		28=>"010000",
		24=>"010001",
			29=>"010011",
		12=>"110000",
			5=>"110001",
		13=>"110011",
		22=>"000100",
		6=>"000101",
		23=>"000111",
		30=>"010100",
		 0=>"010101",
		31=>"010111",
		14=>"110100",
		 7=>"110101",
		15=>"110111",
		18=>"001100",
		 2=>"001101",
		19=>"001111",
		26=>"011100",
		25=>"011101",
		27=>"011111",
		10=>"111100",
		 3=>"111101",
		11=>"111111",
		
		-- others color >=27
		1=>"010101",
		8=>"110001",
		9=>"111101",
		16=>"000001",
		17=>"001101"
		);
	type pen_type is array(15 downto 0) of std_logic_vector(5 downto 0);
	signal pen:pen_type:=(
		palette(4),palette(12),palette(21),palette(28),
		palette(24),palette(29),palette(12),palette(5),
		palette(13),palette(22),palette(6),palette(23),
		palette(30),palette(0),palette(31),palette(14)
	);
	signal GREEN_FF:std_logic_vector(1 downto 0);
	signal MODE_select:STD_LOGIC_VECTOR (1 downto 0);
begin

GREEN<= GREEN_FF & "1" when GREEN_FF>"00" else "000";

aZRaEL_vram2vgaAmstrad_process : process(CLK_25MHz) is
	variable horizontal_counter : integer range 0 to HTot:=0;
	variable vertical_counter : integer range 0 to VTot:=0;

	constant PALETTE_H_OFFSET:integer:=16+1; --HTot/HardHZoom-16-1;
	constant PALETTE_V_OFFSET:integer:=0; --VTot;
	variable palette_horizontal_counter : integer range 0 to HTot:=PALETTE_H_OFFSET;
	variable palette_vertical_counter : integer range 0 to VTot:=PALETTE_V_OFFSET;
	variable palette_action:integer range 0 to 2:=0;
	constant DO_MODE:integer:=1;
	constant DO_COLOR:integer:=2;
	variable palette_color:integer range 0 to 16-1:=0;
	variable palette_A_mem:std_logic_vector(palette_A'range):=(others=>'0');
	
	variable etat_rgb : integer range 0 to 2:=DO_NOTHING_OUT;
	variable etat_hsync : STD_LOGIC:=DO_NOTHING;
	variable etat_vsync : STD_LOGIC:=DO_NOTHING;
	variable color : STD_LOGIC_VECTOR(2**(MODE_MAX)-1 downto 0);
	variable color_patch : STD_LOGIC_VECTOR(2**(MODE_MAX)-1 downto 0);
	variable cursor_pixel_ref : integer range 0 to NB_PIXEL_PER_OCTET_MAX-1;
	variable cursor_pixel : integer range 0 to NB_PIXEL_PER_OCTET_MAX-1;
	variable v:integer range 0 to 256-1;
	variable h:integer range 0 to CHAR_WIDTH*128*8-1;
	variable new_h:integer range 0 to 128*8-1;
	variable NB_PIXEL_PER_OCTET:integer range NB_PIXEL_PER_OCTET_MIN to NB_PIXEL_PER_OCTET_MAX;
	variable ADRESSE_CONSTANT_mem:integer range 0 to 16*1024-1;
	variable ADRESSE_INC_mem:integer range 0 to 16*1024-1;
	variable ADRESSE_VAR_mem:integer range 0 to 16*1024-1;
	variable MA:STD_LOGIC_VECTOR(13 downto 0);
	variable MA_13_begin:std_logic:='0';
	variable RA:STD_LOGIC_VECTOR(4 downto 0);
	variable CA:STD_LOGIC_VECTOR(0 downto 0); -- sqrt(CHAR_WIDTH/8)-1 ?
	variable no_char:integer range 0 to CHAR_WIDTH/8-1;
begin
	if rising_edge(CLK_25MHz) then
		if MODE_select="00" then
			NB_PIXEL_PER_OCTET:=2;
		elsif MODE_select="01" then
			NB_PIXEL_PER_OCTET:=4;
		elsif MODE_select="10" then
			NB_PIXEL_PER_OCTET:=8;
		else
			NB_PIXEL_PER_OCTET:=2;
		end if;

		if etat_rgb = DO_READ then
			color:=(others=>'0');
			for i in 2**(MODE_MAX)-1 downto 0 loop
				if (MODE_select="00" and i<=3)
				or (MODE_select="01" and i<=1)
				or (MODE_select="10" and i<=0) then
					color(3-i):=DATA(i*NB_PIXEL_PER_OCTET+(NB_PIXEL_PER_OCTET-1-cursor_pixel));
				end if;
			end loop;
			if MODE_select="10" then
				RED<=pen(conv_integer(color(3)))(5 downto 4);
				GREEN_FF<=pen(conv_integer(color(3)))(3 downto 2);
				BLUE<=pen(conv_integer(color(3)))(1 downto 0);
			elsif MODE_select="01" then
				RED<=pen(conv_integer(color(3 downto 2)))(5 downto 4);
				GREEN_FF<=pen(conv_integer(color(3 downto 2)))(3 downto 2);
				BLUE<=pen(conv_integer(color(3 downto 2)))(1 downto 0);
			elsif MODE_select="00" then
				color_patch:=color(3) & color(1) & color(2) & color(0); -- pas relou xD
				RED<=pen(conv_integer(color_patch))(5 downto 4);
				GREEN_FF<=pen(conv_integer(color_patch))(3 downto 2);
				BLUE<=pen(conv_integer(color_patch))(1 downto 0);
			else -- MODE 11
				RED<="01";
				GREEN_FF<="11";
				BLUE<="01";
			end if;
		elsif etat_rgb = DO_BORDER then
			RED<="00";
			GREEN_FF<="00";
			BLUE<="00";
		else
			RED<="00";
			GREEN_FF<="00";
			BLUE<="00";
		end if;
		if etat_hsync = DO_HSYNC then
			hsync<='1' xor nhsync;
		else
			hsync<='0' xor nhsync;
		end if;
		if etat_vsync = DO_VSYNC then
			vsync<='1' xor nvsync;
		else
			vsync<='0' xor nvsync;
		end if;

--puis la palette c'est celle du 800x600... pas du 640x400
-- puis c'est trop petit cet RAM, à peine de quoi afficher 60 lignes en 33o par palette et 100 lignes en 32*5bit+2bit
--donc il faudrai au minimum tripler la mémoire si on la joue serré, ou au maximum multiplier par 5
--Number of RAMB16s: 18 out of      20   90% => on peut triper la mémoire mais pas plus
		if palette_action=DO_MODE then
			MODE_select<=palette_D(1 downto 0);
		elsif palette_action=DO_COLOR then
			pen(palette_color)<=palette(conv_integer(palette_D));
		end if;
		if palette_vertical_counter mod VZoom=0 then -- une ligne sur deux déjà...
			if palette_horizontal_counter<1 then
				-- mode
				palette_A<=palette_A_mem;
				palette_A_mem:=palette_A_mem+1;
				palette_action:=DO_MODE;
			elsif palette_horizontal_counter<1+16 then
				-- color
				palette_A<=palette_A_mem;
				palette_A_mem:=palette_A_mem+1;
				palette_action:=DO_COLOR;
				palette_color:=palette_horizontal_counter-1;
			else
				palette_action:=DO_NOTHING_OUT;
			end if;
		else
			palette_action:=DO_NOTHING_OUT;
		end if;
		
		if horizontal_counter<HDsp/HardHZoom and vertical_counter<VDsp then
			if horizontal_counter+HDecal_negatif<HDecal or vertical_counter+VDecal_negatif<VDecal or horizontal_counter+HDecal_negatif>=HDecal+HZoom*VRAM_HDsp or vertical_counter+VDecal_negatif>=VDecal+VZoom*VRAM_VDsp then
				ADDRESS<= (others=>'0');
				etat_rgb:=DO_BORDER;
			else
				v:=(vertical_counter+VDecal_negatif-VDecal)/(VZoom);
				h:=(horizontal_counter+HDecal_negatif-HDecal)/(HZoom);
				no_char:=(h / 8) mod (CHAR_WIDTH/8);
				-- 640×200 pixels with 2 colours ("Mode 2", 80 text columns) donc bien 8 pixels physique par octets
				if NB_PIXEL_PER_OCTET=2 then
					cursor_pixel_ref:=(((h-1+8) mod 8) / 4) mod 8;
					cursor_pixel:=cursor_pixel_ref;
				elsif NB_PIXEL_PER_OCTET=4 then
					cursor_pixel_ref:=(((h-1+8) mod 8) / 2) mod 8; -- ok
					cursor_pixel:=cursor_pixel_ref; -- correction trajectoire... retard arrivé data par rapport adressage : un temps
				elsif NB_PIXEL_PER_OCTET=8 then
					cursor_pixel_ref:=(((h-1+8) mod 8) / 1) mod 8;
					cursor_pixel:=cursor_pixel_ref; -- cacher un pixel sur deux
				end if;
				new_h:=h/CHAR_WIDTH; -- véritablement un octet représente physique 8 pixels, 
				etat_rgb:=DO_READ;

				MA:=conv_std_logic_vector(v*(VRAM_HDsp/CHAR_WIDTH),14);
				MA:=new_h+MA;
				CA:=conv_std_logic_vector(no_char,1);
				ADDRESS<=MA(13 downto 0) & CA(0);
			end if;
		else
			ADDRESS<= (others=>'0');
			etat_rgb:=DO_NOTHING_OUT;
		end if;
		if horizontal_counter>=HSS/HardHZoom and horizontal_counter<HSE/HardHZoom then
			etat_hsync:=DO_HSYNC;
		else
			etat_hsync:=DO_NOTHING;
		end if;
		if vertical_counter>=VSS and vertical_counter<VSE then
			etat_vsync:=DO_VSYNC;
		else
			etat_vsync:=DO_NOTHING;
		end if;

		horizontal_counter:=horizontal_counter+1;
		if horizontal_counter>=HTot/HardHZoom then
			horizontal_counter:=0;
		end if;
		if horizontal_counter=0 then
			vertical_counter:=vertical_counter+1;
			if vertical_counter>=VTot then
				vertical_counter:=0;
			end if;
		end if;
		
		palette_horizontal_counter:=palette_horizontal_counter+1;
		if palette_horizontal_counter>=HTot/HardHZoom then
			palette_horizontal_counter:=0;
		end if;
		if palette_horizontal_counter=0 then
			palette_vertical_counter:=palette_vertical_counter+1;
			if palette_vertical_counter>=VTot then
				palette_vertical_counter:=0;
				palette_A_mem:=conv_std_logic_vector((VDecal_negatif/VZoom)*(1+16),13);
			end if;
		end if;
		
	end if;
end process aZRaEL_vram2vgaAmstrad_process;

end Behavioral;
