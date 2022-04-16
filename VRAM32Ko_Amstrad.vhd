--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : VRAM32Ko_Amstrad.vhf
-- /___/   /\     Timestamp : 04/16/2022 13:28:32
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -intstyle ise -family spartan3e -flat -suppress -vhdl /home/skip/pano/working/FPGAmstrad/BuildYourOwnZ80Computer/ise/VRAM32Ko_Amstrad.vhf -w /home/skip/pano/working/FPGAmstrad/BuildYourOwnZ80Computer/VRAM32Ko_Amstrad.sch
--Design Name: VRAM32Ko_Amstrad
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

entity VRAM_Amstrad_MUSER_VRAM32Ko_Amstrad is
   port ( vga_A    : in    std_logic_vector (13 downto 0); 
          vga_CLK  : in    std_logic; 
          vram_A   : in    std_logic_vector (13 downto 0); 
          vram_CLK : in    std_logic; 
          vram_D   : in    std_logic_vector (7 downto 0); 
          vram_W   : in    std_logic; 
          vga_D    : out   std_logic_vector (7 downto 0));
end VRAM_Amstrad_MUSER_VRAM32Ko_Amstrad;

architecture BEHAVIORAL of VRAM_Amstrad_MUSER_VRAM32Ko_Amstrad is
   attribute INIT_00             : string ;
   attribute INIT_01             : string ;
   attribute INIT_02             : string ;
   attribute INIT_03             : string ;
   attribute INIT_04             : string ;
   attribute INIT_05             : string ;
   attribute INIT_06             : string ;
   attribute INIT_07             : string ;
   attribute INIT_08             : string ;
   attribute INIT_09             : string ;
   attribute INIT_0A             : string ;
   attribute INIT_0B             : string ;
   attribute INIT_0C             : string ;
   attribute INIT_0D             : string ;
   attribute INIT_0E             : string ;
   attribute INIT_0F             : string ;
   attribute INIT_10             : string ;
   attribute INIT_11             : string ;
   attribute INIT_12             : string ;
   attribute INIT_13             : string ;
   attribute INIT_14             : string ;
   attribute INIT_15             : string ;
   attribute INIT_16             : string ;
   attribute INIT_17             : string ;
   attribute INIT_18             : string ;
   attribute INIT_19             : string ;
   attribute INIT_1A             : string ;
   attribute INIT_1B             : string ;
   attribute INIT_1C             : string ;
   attribute INIT_1D             : string ;
   attribute INIT_1E             : string ;
   attribute INIT_1F             : string ;
   attribute INIT_20             : string ;
   attribute INIT_21             : string ;
   attribute INIT_22             : string ;
   attribute INIT_23             : string ;
   attribute INIT_24             : string ;
   attribute INIT_25             : string ;
   attribute INIT_26             : string ;
   attribute INIT_27             : string ;
   attribute INIT_28             : string ;
   attribute INIT_29             : string ;
   attribute INIT_2A             : string ;
   attribute INIT_2B             : string ;
   attribute INIT_2C             : string ;
   attribute INIT_2D             : string ;
   attribute INIT_2E             : string ;
   attribute INIT_2F             : string ;
   attribute INIT_30             : string ;
   attribute INIT_31             : string ;
   attribute INIT_32             : string ;
   attribute INIT_33             : string ;
   attribute INIT_34             : string ;
   attribute INIT_35             : string ;
   attribute INIT_36             : string ;
   attribute INIT_37             : string ;
   attribute INIT_38             : string ;
   attribute INIT_39             : string ;
   attribute INIT_3A             : string ;
   attribute INIT_3B             : string ;
   attribute INIT_3C             : string ;
   attribute INIT_3D             : string ;
   attribute INIT_3E             : string ;
   attribute INIT_3F             : string ;
   attribute SRVAL_A             : string ;
   attribute SRVAL_B             : string ;
   attribute WRITE_MODE_A        : string ;
   attribute WRITE_MODE_B        : string ;
   attribute INIT_A              : string ;
   attribute INIT_B              : string ;
   attribute SIM_COLLISION_CHECK : string ;
   attribute BOX_TYPE            : string ;
   signal XLXN_1   : std_logic;
   signal XLXN_14  : std_logic;
   signal XLXN_17  : std_logic_vector (0 downto 0);
   signal XLXN_18  : std_logic;
   signal XLXN_22  : std_logic;
   signal XLXN_25  : std_logic_vector (0 downto 0);
   signal XLXN_26  : std_logic;
   signal XLXN_29  : std_logic_vector (0 downto 0);
   signal XLXN_30  : std_logic;
   signal XLXN_34  : std_logic;
   signal XLXN_37  : std_logic_vector (0 downto 0);
   signal XLXN_38  : std_logic;
   signal XLXN_41  : std_logic_vector (0 downto 0);
   signal XLXN_42  : std_logic_vector (0 downto 0);
   signal XLXN_43  : std_logic_vector (0 downto 0);
   signal XLXN_44  : std_logic_vector (0 downto 0);
   component RAMB16_S1_S1
      -- synopsys translate_off
      generic( INIT_00 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_01 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_02 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_03 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_04 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_05 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_06 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_07 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_08 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_09 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_0A : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_0B : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_0C : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_0D : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_0E : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_0F : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_10 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_11 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_12 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_13 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_14 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_15 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_16 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_17 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_18 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_19 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_1A : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_1B : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_1C : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_1D : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_1E : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_1F : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_20 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_21 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_22 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_23 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_24 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_25 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_26 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_27 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_28 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_29 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_2A : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_2B : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_2C : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_2D : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_2E : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_2F : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_30 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_31 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_32 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_33 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_34 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_35 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_36 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_37 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_38 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_39 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_3A : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_3B : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_3C : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_3D : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_3E : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_3F : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               SRVAL_A : bit_vector :=  x"0";
               SRVAL_B : bit_vector :=  x"0";
               WRITE_MODE_A : string :=  "WRITE_FIRST";
               WRITE_MODE_B : string :=  "WRITE_FIRST";
               INIT_A : bit_vector :=  x"0";
               INIT_B : bit_vector :=  x"0";
               SIM_COLLISION_CHECK : string :=  "ALL");
      -- synopsys translate_on
      port ( ADDRA : in    std_logic_vector (13 downto 0); 
             ADDRB : in    std_logic_vector (13 downto 0); 
             CLKA  : in    std_logic; 
             CLKB  : in    std_logic; 
             DIA   : in    std_logic_vector (0 downto 0); 
             DIB   : in    std_logic_vector (0 downto 0); 
             ENA   : in    std_logic; 
             ENB   : in    std_logic; 
             SSRA  : in    std_logic; 
             SSRB  : in    std_logic; 
             WEA   : in    std_logic; 
             WEB   : in    std_logic; 
             DOA   : out   std_logic_vector (0 downto 0); 
             DOB   : out   std_logic_vector (0 downto 0));
   end component;
   attribute INIT_00 of RAMB16_S1_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_01 of RAMB16_S1_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_02 of RAMB16_S1_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_03 of RAMB16_S1_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_04 of RAMB16_S1_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_05 of RAMB16_S1_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_06 of RAMB16_S1_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_07 of RAMB16_S1_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_08 of RAMB16_S1_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_09 of RAMB16_S1_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_0A of RAMB16_S1_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_0B of RAMB16_S1_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_0C of RAMB16_S1_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_0D of RAMB16_S1_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_0E of RAMB16_S1_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_0F of RAMB16_S1_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_10 of RAMB16_S1_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_11 of RAMB16_S1_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_12 of RAMB16_S1_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_13 of RAMB16_S1_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_14 of RAMB16_S1_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_15 of RAMB16_S1_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_16 of RAMB16_S1_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_17 of RAMB16_S1_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_18 of RAMB16_S1_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_19 of RAMB16_S1_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_1A of RAMB16_S1_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_1B of RAMB16_S1_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_1C of RAMB16_S1_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_1D of RAMB16_S1_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_1E of RAMB16_S1_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_1F of RAMB16_S1_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_20 of RAMB16_S1_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_21 of RAMB16_S1_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_22 of RAMB16_S1_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_23 of RAMB16_S1_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_24 of RAMB16_S1_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_25 of RAMB16_S1_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_26 of RAMB16_S1_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_27 of RAMB16_S1_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_28 of RAMB16_S1_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_29 of RAMB16_S1_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_2A of RAMB16_S1_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_2B of RAMB16_S1_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_2C of RAMB16_S1_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_2D of RAMB16_S1_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_2E of RAMB16_S1_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_2F of RAMB16_S1_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_30 of RAMB16_S1_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_31 of RAMB16_S1_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_32 of RAMB16_S1_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_33 of RAMB16_S1_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_34 of RAMB16_S1_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_35 of RAMB16_S1_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_36 of RAMB16_S1_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_37 of RAMB16_S1_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_38 of RAMB16_S1_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_39 of RAMB16_S1_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_3A of RAMB16_S1_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_3B of RAMB16_S1_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_3C of RAMB16_S1_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_3D of RAMB16_S1_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_3E of RAMB16_S1_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_3F of RAMB16_S1_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute SRVAL_A of RAMB16_S1_S1 : component is "0";
   attribute SRVAL_B of RAMB16_S1_S1 : component is "0";
   attribute WRITE_MODE_A of RAMB16_S1_S1 : component is "WRITE_FIRST";
   attribute WRITE_MODE_B of RAMB16_S1_S1 : component is "WRITE_FIRST";
   attribute INIT_A of RAMB16_S1_S1 : component is "0";
   attribute INIT_B of RAMB16_S1_S1 : component is "0";
   attribute SIM_COLLISION_CHECK of RAMB16_S1_S1 : component is "ALL";
   attribute BOX_TYPE of RAMB16_S1_S1 : component is "BLACK_BOX";
   
   component VCC
      port ( P : out   std_logic);
   end component;
   attribute BOX_TYPE of VCC : component is "BLACK_BOX";
   
   component GND
      port ( G : out   std_logic);
   end component;
   attribute BOX_TYPE of GND : component is "BLACK_BOX";
   
begin
   XLXI_1 : RAMB16_S1_S1
   -- synopsys translate_off
   generic map( WRITE_MODE_B => "WRITE_FIRST",
            WRITE_MODE_A => "WRITE_FIRST")
   -- synopsys translate_on
      port map (ADDRA(13 downto 0)=>vram_A(13 downto 0),
                ADDRB(13 downto 0)=>vga_A(13 downto 0),
                CLKA=>vram_CLK,
                CLKB=>vga_CLK,
                DIA(0)=>vram_D(0),
                DIB(0)=>XLXN_42(0),
                ENA=>XLXN_1,
                ENB=>XLXN_1,
                SSRA=>XLXN_1,
                SSRB=>XLXN_42(0),
                WEA=>vram_W,
                WEB=>XLXN_42(0),
                DOA=>open,
                DOB(0)=>vga_D(0));
   
   XLXI_2 : RAMB16_S1_S1
   -- synopsys translate_off
   generic map( WRITE_MODE_B => "WRITE_FIRST",
            WRITE_MODE_A => "WRITE_FIRST")
   -- synopsys translate_on
      port map (ADDRA(13 downto 0)=>vram_A(13 downto 0),
                ADDRB(13 downto 0)=>vga_A(13 downto 0),
                CLKA=>vram_CLK,
                CLKB=>vga_CLK,
                DIA(0)=>vram_D(2),
                DIB(0)=>XLXN_43(0),
                ENA=>XLXN_18,
                ENB=>XLXN_18,
                SSRA=>XLXN_18,
                SSRB=>XLXN_43(0),
                WEA=>vram_W,
                WEB=>XLXN_43(0),
                DOA=>open,
                DOB(0)=>vga_D(2));
   
   XLXI_3 : RAMB16_S1_S1
   -- synopsys translate_off
   generic map( WRITE_MODE_B => "WRITE_FIRST",
            WRITE_MODE_A => "WRITE_FIRST")
   -- synopsys translate_on
      port map (ADDRA(13 downto 0)=>vram_A(13 downto 0),
                ADDRB(13 downto 0)=>vga_A(13 downto 0),
                CLKA=>vram_CLK,
                CLKB=>vga_CLK,
                DIA(0)=>vram_D(3),
                DIB(0)=>XLXN_25(0),
                ENA=>XLXN_22,
                ENB=>XLXN_22,
                SSRA=>XLXN_22,
                SSRB=>XLXN_25(0),
                WEA=>vram_W,
                WEB=>XLXN_25(0),
                DOA=>open,
                DOB(0)=>vga_D(3));
   
   XLXI_4 : RAMB16_S1_S1
   -- synopsys translate_off
   generic map( WRITE_MODE_B => "WRITE_FIRST",
            WRITE_MODE_A => "WRITE_FIRST")
   -- synopsys translate_on
      port map (ADDRA(13 downto 0)=>vram_A(13 downto 0),
                ADDRB(13 downto 0)=>vga_A(13 downto 0),
                CLKA=>vram_CLK,
                CLKB=>vga_CLK,
                DIA(0)=>vram_D(7),
                DIB(0)=>XLXN_41(0),
                ENA=>XLXN_38,
                ENB=>XLXN_38,
                SSRA=>XLXN_38,
                SSRB=>XLXN_41(0),
                WEA=>vram_W,
                WEB=>XLXN_41(0),
                DOA=>open,
                DOB(0)=>vga_D(7));
   
   XLXI_5 : RAMB16_S1_S1
   -- synopsys translate_off
   generic map( WRITE_MODE_B => "WRITE_FIRST",
            WRITE_MODE_A => "WRITE_FIRST")
   -- synopsys translate_on
      port map (ADDRA(13 downto 0)=>vram_A(13 downto 0),
                ADDRB(13 downto 0)=>vga_A(13 downto 0),
                CLKA=>vram_CLK,
                CLKB=>vga_CLK,
                DIA(0)=>vram_D(1),
                DIB(0)=>XLXN_17(0),
                ENA=>XLXN_14,
                ENB=>XLXN_14,
                SSRA=>XLXN_14,
                SSRB=>XLXN_17(0),
                WEA=>vram_W,
                WEB=>XLXN_17(0),
                DOA=>open,
                DOB(0)=>vga_D(1));
   
   XLXI_6 : RAMB16_S1_S1
   -- synopsys translate_off
   generic map( WRITE_MODE_B => "WRITE_FIRST",
            WRITE_MODE_A => "WRITE_FIRST")
   -- synopsys translate_on
      port map (ADDRA(13 downto 0)=>vram_A(13 downto 0),
                ADDRB(13 downto 0)=>vga_A(13 downto 0),
                CLKA=>vram_CLK,
                CLKB=>vga_CLK,
                DIA(0)=>vram_D(6),
                DIB(0)=>XLXN_37(0),
                ENA=>XLXN_34,
                ENB=>XLXN_34,
                SSRA=>XLXN_34,
                SSRB=>XLXN_37(0),
                WEA=>vram_W,
                WEB=>XLXN_37(0),
                DOA=>open,
                DOB(0)=>vga_D(6));
   
   XLXI_7 : RAMB16_S1_S1
   -- synopsys translate_off
   generic map( WRITE_MODE_B => "WRITE_FIRST",
            WRITE_MODE_A => "WRITE_FIRST")
   -- synopsys translate_on
      port map (ADDRA(13 downto 0)=>vram_A(13 downto 0),
                ADDRB(13 downto 0)=>vga_A(13 downto 0),
                CLKA=>vram_CLK,
                CLKB=>vga_CLK,
                DIA(0)=>vram_D(5),
                DIB(0)=>XLXN_44(0),
                ENA=>XLXN_30,
                ENB=>XLXN_30,
                SSRA=>XLXN_30,
                SSRB=>XLXN_44(0),
                WEA=>vram_W,
                WEB=>XLXN_44(0),
                DOA=>open,
                DOB(0)=>vga_D(5));
   
   XLXI_8 : RAMB16_S1_S1
   -- synopsys translate_off
   generic map( WRITE_MODE_B => "WRITE_FIRST",
            WRITE_MODE_A => "WRITE_FIRST")
   -- synopsys translate_on
      port map (ADDRA(13 downto 0)=>vram_A(13 downto 0),
                ADDRB(13 downto 0)=>vga_A(13 downto 0),
                CLKA=>vram_CLK,
                CLKB=>vga_CLK,
                DIA(0)=>vram_D(4),
                DIB(0)=>XLXN_29(0),
                ENA=>XLXN_26,
                ENB=>XLXN_26,
                SSRA=>XLXN_26,
                SSRB=>XLXN_29(0),
                WEA=>vram_W,
                WEB=>XLXN_29(0),
                DOA=>open,
                DOB(0)=>vga_D(4));
   
   XLXI_13 : VCC
      port map (P=>XLXN_1);
   
   XLXI_14 : GND
      port map (G=>XLXN_42(0));
   
   XLXI_15 : VCC
      port map (P=>XLXN_14);
   
   XLXI_16 : VCC
      port map (P=>XLXN_18);
   
   XLXI_17 : VCC
      port map (P=>XLXN_22);
   
   XLXI_18 : VCC
      port map (P=>XLXN_26);
   
   XLXI_19 : VCC
      port map (P=>XLXN_30);
   
   XLXI_20 : VCC
      port map (P=>XLXN_34);
   
   XLXI_21 : VCC
      port map (P=>XLXN_38);
   
   XLXI_22 : GND
      port map (G=>XLXN_17(0));
   
   XLXI_23 : GND
      port map (G=>XLXN_43(0));
   
   XLXI_24 : GND
      port map (G=>XLXN_25(0));
   
   XLXI_25 : GND
      port map (G=>XLXN_29(0));
   
   XLXI_26 : GND
      port map (G=>XLXN_44(0));
   
   XLXI_27 : GND
      port map (G=>XLXN_37(0));
   
   XLXI_28 : GND
      port map (G=>XLXN_41(0));
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity VRAM32Ko_Amstrad is
   port ( vga_A    : in    std_logic_vector (14 downto 0); 
          vga_CLK  : in    std_logic; 
          vram_A   : in    std_logic_vector (14 downto 0); 
          vram_CLK : in    std_logic; 
          vram_D   : in    std_logic_vector (7 downto 0); 
          vram_W   : in    std_logic; 
          vga_D    : out   std_logic_vector (7 downto 0));
end VRAM32Ko_Amstrad;

architecture BEHAVIORAL of VRAM32Ko_Amstrad is
   attribute BOX_TYPE   : string ;
   signal XLXN_19  : std_logic;
   signal XLXN_21  : std_logic;
   signal XLXN_23  : std_logic;
   signal XLXN_31  : std_logic;
   signal XLXN_40  : std_logic_vector (7 downto 0);
   signal XLXN_46  : std_logic_vector (7 downto 0);
   component VRAM_Amstrad_MUSER_VRAM32Ko_Amstrad
      port ( vram_CLK : in    std_logic; 
             vga_CLK  : in    std_logic; 
             vram_A   : in    std_logic_vector (13 downto 0); 
             vga_A    : in    std_logic_vector (13 downto 0); 
             vram_W   : in    std_logic; 
             vram_D   : in    std_logic_vector (7 downto 0); 
             vga_D    : out   std_logic_vector (7 downto 0));
   end component;
   
   component and_then
      port ( A : in    std_logic; 
             B : in    std_logic; 
             C : out   std_logic);
   end component;
   
   component INV
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of INV : component is "BLACK_BOX";
   
   component SELECT8
      port ( s1    : in    std_logic; 
             DATA1 : in    std_logic_vector (7 downto 0); 
             DATA2 : in    std_logic_vector (7 downto 0); 
             DATA0 : out   std_logic_vector (7 downto 0));
   end component;
   
begin
   XLXI_1 : VRAM_Amstrad_MUSER_VRAM32Ko_Amstrad
      port map (vga_A(13 downto 0)=>vga_A(13 downto 0),
                vga_CLK=>vga_CLK,
                vram_A(13 downto 0)=>vram_A(13 downto 0),
                vram_CLK=>vram_CLK,
                vram_D(7 downto 0)=>vram_D(7 downto 0),
                vram_W=>XLXN_19,
                vga_D(7 downto 0)=>XLXN_40(7 downto 0));
   
   XLXI_2 : and_then
      port map (A=>vram_W,
                B=>XLXN_21,
                C=>XLXN_19);
   
   XLXI_3 : INV
      port map (I=>vram_A(14),
                O=>XLXN_21);
   
   XLXI_4 : SELECT8
      port map (DATA1(7 downto 0)=>XLXN_40(7 downto 0),
                DATA2(7 downto 0)=>XLXN_46(7 downto 0),
                s1=>XLXN_23,
                DATA0(7 downto 0)=>vga_D(7 downto 0));
   
   XLXI_5 : INV
      port map (I=>vga_A(14),
                O=>XLXN_23);
   
   XLXI_6 : VRAM_Amstrad_MUSER_VRAM32Ko_Amstrad
      port map (vga_A(13 downto 0)=>vga_A(13 downto 0),
                vga_CLK=>vga_CLK,
                vram_A(13 downto 0)=>vram_A(13 downto 0),
                vram_CLK=>vram_CLK,
                vram_D(7 downto 0)=>vram_D(7 downto 0),
                vram_W=>XLXN_31,
                vga_D(7 downto 0)=>XLXN_46(7 downto 0));
   
   XLXI_7 : and_then
      port map (A=>vram_W,
                B=>vram_A(14),
                C=>XLXN_31);
   
end BEHAVIORAL;


