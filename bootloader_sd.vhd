--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : bootloader_sd.vhf
-- /___/   /\     Timestamp : 04/16/2022 13:28:31
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -intstyle ise -family spartan3e -flat -suppress -vhdl /home/skip/pano/working/FPGAmstrad/BuildYourOwnZ80Computer/ise/bootloader_sd.vhf -w /home/skip/pano/working/FPGAmstrad/BuildYourOwnZ80Computer/bootloader_sd.sch
--Design Name: bootloader_sd
--Device: spartan3e
--Purpose:
--    This vhdl netlist is translated from an ECS schematic. It can be 
--    synthesized and simulated, but it should not be modified. 
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity bootloader_sd is
   port ( CD_n        : in    std_logic; 
          CLK50MHz    : in    std_logic; 
          FILE_SELECT : in    std_logic_vector (7 downto 0); 
          MISO        : in    std_logic; 
          FILE_LOADED : out   std_logic; 
          is_ucpm     : out   std_logic; 
          LEDS        : out   std_logic_vector (7 downto 0); 
          MOSI        : out   std_logic; 
          ram_A       : out   std_logic_vector (22 downto 0); 
          ram_W_n     : out   std_logic; 
          SCLK        : out   std_logic; 
          SS_n        : out   std_logic; 
          ram_D       : inout std_logic_vector (7 downto 0));
end bootloader_sd;

architecture BEHAVIORAL of bootloader_sd is
   attribute BOX_TYPE   : string ;
   signal CD_LED      : std_logic;
   signal DO_STOP     : std_logic;
   signal INIT_DONE   : std_logic;
   signal INV_PHA     : std_logic;
   signal ram_W       : std_logic;
   signal SCLK_pha    : std_logic;
   signal SPI_ON      : std_logic;
   signal XLXN_45     : std_logic;
   signal XLXN_49     : std_logic;
   signal XLXN_52     : std_logic_vector (7 downto 0);
   signal XLXN_55     : std_logic_vector (31 downto 0);
   signal XLXN_57     : std_logic;
   signal XLXN_61     : std_logic;
   signal XLXN_76     : std_logic;
   signal XLXN_80     : std_logic;
   signal XLXN_86     : std_logic;
   signal XLXN_89     : std_logic;
   signal XLXN_90     : std_logic;
   signal XLXN_91     : std_logic;
   signal zero        : std_logic;
   signal SCLK_DUMMY  : std_logic;
   component SDRAM_SPIMASTER
      port ( SCLK          : in    std_logic; 
             MISO          : in    std_logic; 
             address       : in    std_logic_vector (31 downto 0); 
             MOSI          : out   std_logic; 
             spi_init_done : out   std_logic; 
             leds          : out   std_logic_vector (7 downto 0); 
             spi_R         : in    std_logic; 
             data_out      : out   std_logic_vector (7 downto 0); 
             spi_Rdone     : out   std_logic; 
             spi_Wdone     : out   std_logic; 
             SS_n          : out   std_logic; 
             data_in       : in    std_logic_vector (7 downto 0); 
             CD_n          : in    std_logic; 
             spi_W         : in    std_logic; 
             special_W     : in    std_logic);
   end component;
   
   component AND2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2 : component is "BLACK_BOX";
   
   component INV
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of INV : component is "BLACK_BOX";
   
   component XOR2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of XOR2 : component is "BLACK_BOX";
   
   component SDRAM_FAT32_LOADER
      port ( CLK            : in    std_logic; 
             spi_done       : in    std_logic; 
             spi_init_done  : in    std_logic; 
             stop           : in    std_logic; 
             file_select    : in    std_logic_vector (7 downto 0); 
             spi_D          : in    std_logic_vector (7 downto 0); 
             ram_D          : inout std_logic_vector (7 downto 0); 
             ram_W          : out   std_logic; 
             spi_do         : out   std_logic; 
             load_init_done : out   std_logic; 
             is_ucpm        : out   std_logic; 
             ram_A          : out   std_logic_vector (22 downto 0); 
             spi_A          : out   std_logic_vector (31 downto 0); 
             leds           : out   std_logic_vector (7 downto 0));
   end component;
   
   component VCC
      port ( P : out   std_logic);
   end component;
   attribute BOX_TYPE of VCC : component is "BLACK_BOX";
   
   component GND
      port ( G : out   std_logic);
   end component;
   attribute BOX_TYPE of GND : component is "BLACK_BOX";
   
   component BUF
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of BUF : component is "BLACK_BOX";
   
begin
   SCLK <= SCLK_DUMMY;
   XLXI_1 : SDRAM_SPIMASTER
      port map (address(31 downto 0)=>XLXN_55(31 downto 0),
                CD_n=>XLXN_89,
                data_in(7)=>zero,
                data_in(6)=>zero,
                data_in(5)=>zero,
                data_in(4)=>zero,
                data_in(3)=>zero,
                data_in(2)=>zero,
                data_in(1)=>zero,
                data_in(0)=>zero,
                MISO=>XLXN_45,
                SCLK=>SCLK_pha,
                special_W=>XLXN_91,
                spi_R=>XLXN_61,
                spi_W=>XLXN_90,
                data_out(7 downto 0)=>XLXN_52(7 downto 0),
                leds=>open,
                MOSI=>XLXN_49,
                spi_init_done=>INIT_DONE,
                spi_Rdone=>XLXN_57,
                spi_Wdone=>open,
                SS_n=>open);
   
   XLXI_3 : AND2
      port map (I0=>SPI_ON,
                I1=>CD_LED,
                O=>XLXN_80);
   
   XLXI_4 : INV
      port map (I=>CD_n,
                O=>CD_LED);
   
   XLXI_5 : XOR2
      port map (I0=>MISO,
                I1=>XLXN_86,
                O=>XLXN_45);
   
   XLXI_6 : XOR2
      port map (I0=>XLXN_49,
                I1=>XLXN_86,
                O=>MOSI);
   
   XLXI_7 : SDRAM_FAT32_LOADER
      port map (CLK=>SCLK_pha,
                file_select(7 downto 0)=>FILE_SELECT(7 downto 0),
                spi_D(7 downto 0)=>XLXN_52(7 downto 0),
                spi_done=>XLXN_57,
                spi_init_done=>INIT_DONE,
                stop=>DO_STOP,
                is_ucpm=>is_ucpm,
                leds(7 downto 0)=>LEDS(7 downto 0),
                load_init_done=>FILE_LOADED,
                ram_A(22 downto 0)=>ram_A(22 downto 0),
                ram_W=>ram_W,
                spi_A(31 downto 0)=>XLXN_55(31 downto 0),
                spi_do=>XLXN_61,
                ram_D(7 downto 0)=>ram_D(7 downto 0));
   
   XLXI_8 : XOR2
      port map (I0=>SCLK_DUMMY,
                I1=>INV_PHA,
                O=>SCLK_pha);
   
   XLXI_26 : INV
      port map (I=>ram_W,
                O=>ram_W_n);
   
   XLXI_40 : INV
      port map (I=>XLXN_76,
                O=>SS_n);
   
   XLXI_41 : VCC
      port map (P=>XLXN_76);
   
   XLXI_42 : VCC
      port map (P=>SPI_ON);
   
   XLXI_43 : GND
      port map (G=>DO_STOP);
   
   XLXI_44 : VCC
      port map (P=>INV_PHA);
   
   XLXI_45 : GND
      port map (G=>XLXN_86);
   
   XLXI_46 : BUF
      port map (I=>CLK50MHz,
                O=>SCLK_DUMMY);
   
   XLXI_52 : GND
      port map (G=>XLXN_89);
   
   XLXI_53 : GND
      port map (G=>XLXN_90);
   
   XLXI_54 : GND
      port map (G=>XLXN_91);
   
   XLXI_55 : GND
      port map (G=>zero);
   
end BEHAVIORAL;


