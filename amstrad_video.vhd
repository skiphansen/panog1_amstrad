--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : amstrad_video.vhf
-- /___/   /\     Timestamp : 04/16/2022 13:28:31
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -intstyle ise -family spartan3e -flat -suppress -vhdl /home/skip/pano/working/FPGAmstrad/BuildYourOwnZ80Computer/ise/amstrad_video.vhf -w /home/skip/pano/working/FPGAmstrad/BuildYourOwnZ80Computer/amstrad_video.sch
--Design Name: amstrad_video
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

entity FD8CE_MXILINX_amstrad_video is
   port ( C   : in    std_logic; 
          CE  : in    std_logic; 
          CLR : in    std_logic; 
          D   : in    std_logic_vector (7 downto 0); 
          Q   : out   std_logic_vector (7 downto 0));
end FD8CE_MXILINX_amstrad_video;

architecture BEHAVIORAL of FD8CE_MXILINX_amstrad_video is
   attribute BOX_TYPE   : string ;
   component FDCE
      generic( INIT : bit :=  '0');
      port ( C   : in    std_logic; 
             CE  : in    std_logic; 
             CLR : in    std_logic; 
             D   : in    std_logic; 
             Q   : out   std_logic);
   end component;
   attribute BOX_TYPE of FDCE : component is "BLACK_BOX";
   
begin
   I_Q0 : FDCE
      port map (C=>C,
                CE=>CE,
                CLR=>CLR,
                D=>D(0),
                Q=>Q(0));
   
   I_Q1 : FDCE
      port map (C=>C,
                CE=>CE,
                CLR=>CLR,
                D=>D(1),
                Q=>Q(1));
   
   I_Q2 : FDCE
      port map (C=>C,
                CE=>CE,
                CLR=>CLR,
                D=>D(2),
                Q=>Q(2));
   
   I_Q3 : FDCE
      port map (C=>C,
                CE=>CE,
                CLR=>CLR,
                D=>D(3),
                Q=>Q(3));
   
   I_Q4 : FDCE
      port map (C=>C,
                CE=>CE,
                CLR=>CLR,
                D=>D(4),
                Q=>Q(4));
   
   I_Q5 : FDCE
      port map (C=>C,
                CE=>CE,
                CLR=>CLR,
                D=>D(5),
                Q=>Q(5));
   
   I_Q6 : FDCE
      port map (C=>C,
                CE=>CE,
                CLR=>CLR,
                D=>D(6),
                Q=>Q(6));
   
   I_Q7 : FDCE
      port map (C=>C,
                CE=>CE,
                CLR=>CLR,
                D=>D(7),
                Q=>Q(7));
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity XOR8_MXILINX_amstrad_video is
   port ( I0 : in    std_logic; 
          I1 : in    std_logic; 
          I2 : in    std_logic; 
          I3 : in    std_logic; 
          I4 : in    std_logic; 
          I5 : in    std_logic; 
          I6 : in    std_logic; 
          I7 : in    std_logic; 
          O  : out   std_logic);
end XOR8_MXILINX_amstrad_video;

architecture BEHAVIORAL of XOR8_MXILINX_amstrad_video is
   attribute BOX_TYPE   : string ;
   attribute RLOC       : string ;
   signal dummy   : std_logic;
   signal S0      : std_logic;
   signal S1      : std_logic;
   signal O_DUMMY : std_logic;
   component FMAP
      port ( I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             I4 : in    std_logic; 
             O  : in    std_logic);
   end component;
   attribute BOX_TYPE of FMAP : component is "BLACK_BOX";
   
   component XOR2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of XOR2 : component is "BLACK_BOX";
   
   component XOR4
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of XOR4 : component is "BLACK_BOX";
   
   attribute RLOC of I_36_90 : label is "X0Y1";
   attribute RLOC of I_36_115 : label is "X0Y0";
   attribute RLOC of I_36_116 : label is "X0Y0";
begin
   O <= O_DUMMY;
   I_36_90 : FMAP
      port map (I1=>S0,
                I2=>S1,
                I3=>dummy,
                I4=>dummy,
                O=>O_DUMMY);
   
   I_36_93 : XOR2
      port map (I0=>S0,
                I1=>S1,
                O=>O_DUMMY);
   
   I_36_94 : XOR4
      port map (I0=>I4,
                I1=>I5,
                I2=>I6,
                I3=>I7,
                O=>S1);
   
   I_36_111 : XOR4
      port map (I0=>I0,
                I1=>I1,
                I2=>I2,
                I3=>I3,
                O=>S0);
   
   I_36_115 : FMAP
      port map (I1=>I0,
                I2=>I1,
                I3=>I2,
                I4=>I3,
                O=>S0);
   
   I_36_116 : FMAP
      port map (I1=>I4,
                I2=>I5,
                I3=>I6,
                I4=>I7,
                O=>S1);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity PALETTE_RAM_MUSER_amstrad_video is
   port ( AI   : in    std_logic_vector (12 downto 0); 
          AO   : in    std_logic_vector (12 downto 0); 
          CLKI : in    std_logic; 
          CLKO : in    std_logic; 
          DI   : in    std_logic_vector (7 downto 0); 
          WR   : in    std_logic; 
          DO   : out   std_logic_vector (7 downto 0));
end PALETTE_RAM_MUSER_amstrad_video;

architecture BEHAVIORAL of PALETTE_RAM_MUSER_amstrad_video is
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
   attribute INITP_00            : string ;
   attribute INITP_01            : string ;
   attribute INITP_02            : string ;
   attribute INITP_03            : string ;
   attribute INITP_04            : string ;
   attribute INITP_05            : string ;
   attribute INITP_06            : string ;
   attribute INITP_07            : string ;
   attribute SRVAL_A             : string ;
   attribute SRVAL_B             : string ;
   attribute WRITE_MODE_A        : string ;
   attribute WRITE_MODE_B        : string ;
   attribute INIT_A              : string ;
   attribute INIT_B              : string ;
   attribute SIM_COLLISION_CHECK : string ;
   attribute BOX_TYPE            : string ;
   attribute HU_SET              : string ;
   signal WR_00   : std_logic;
   signal WR_01   : std_logic;
   signal WR_10   : std_logic;
   signal XLXN_1  : std_logic_vector (0 downto 0);
   signal XLXN_14 : std_logic;
   signal XLXN_17 : std_logic;
   signal XLXN_23 : std_logic_vector (0 downto 0);
   signal XLXN_25 : std_logic_vector (0 downto 0);
   signal XLXN_26 : std_logic;
   signal XLXN_27 : std_logic;
   signal XLXN_28 : std_logic_vector (0 downto 0);
   signal XLXN_29 : std_logic;
   signal XLXN_30 : std_logic;
   signal XLXN_47 : std_logic;
   signal XLXN_53 : std_logic;
   signal XLXN_76 : std_logic_vector (7 downto 0);
   signal XLXN_77 : std_logic_vector (7 downto 0);
   signal XLXN_78 : std_logic_vector (7 downto 0);
   signal XLXN_79 : std_logic_vector (7 downto 0);
   signal zero    : std_logic;
   component RAMB16_S9_S9
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
               INITP_00 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INITP_01 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INITP_02 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INITP_03 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INITP_04 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INITP_05 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INITP_06 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INITP_07 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               SRVAL_A : bit_vector :=  x"000";
               SRVAL_B : bit_vector :=  x"000";
               WRITE_MODE_A : string :=  "WRITE_FIRST";
               WRITE_MODE_B : string :=  "WRITE_FIRST";
               INIT_A : bit_vector :=  x"000";
               INIT_B : bit_vector :=  x"000";
               SIM_COLLISION_CHECK : string :=  "ALL");
      -- synopsys translate_on
      port ( ADDRA : in    std_logic_vector (10 downto 0); 
             ADDRB : in    std_logic_vector (10 downto 0); 
             CLKA  : in    std_logic; 
             CLKB  : in    std_logic; 
             DIA   : in    std_logic_vector (7 downto 0); 
             DIB   : in    std_logic_vector (7 downto 0); 
             DIPA  : in    std_logic_vector (0 downto 0); 
             DIPB  : in    std_logic_vector (0 downto 0); 
             ENA   : in    std_logic; 
             ENB   : in    std_logic; 
             SSRA  : in    std_logic; 
             SSRB  : in    std_logic; 
             WEA   : in    std_logic; 
             WEB   : in    std_logic; 
             DOA   : out   std_logic_vector (7 downto 0); 
             DOB   : out   std_logic_vector (7 downto 0); 
             DOPA  : out   std_logic_vector (0 downto 0); 
             DOPB  : out   std_logic_vector (0 downto 0));
   end component;
   attribute INIT_00 of RAMB16_S9_S9 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_01 of RAMB16_S9_S9 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_02 of RAMB16_S9_S9 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_03 of RAMB16_S9_S9 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_04 of RAMB16_S9_S9 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_05 of RAMB16_S9_S9 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_06 of RAMB16_S9_S9 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_07 of RAMB16_S9_S9 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_08 of RAMB16_S9_S9 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_09 of RAMB16_S9_S9 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_0A of RAMB16_S9_S9 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_0B of RAMB16_S9_S9 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_0C of RAMB16_S9_S9 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_0D of RAMB16_S9_S9 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_0E of RAMB16_S9_S9 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_0F of RAMB16_S9_S9 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_10 of RAMB16_S9_S9 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_11 of RAMB16_S9_S9 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_12 of RAMB16_S9_S9 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_13 of RAMB16_S9_S9 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_14 of RAMB16_S9_S9 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_15 of RAMB16_S9_S9 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_16 of RAMB16_S9_S9 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_17 of RAMB16_S9_S9 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_18 of RAMB16_S9_S9 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_19 of RAMB16_S9_S9 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_1A of RAMB16_S9_S9 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_1B of RAMB16_S9_S9 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_1C of RAMB16_S9_S9 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_1D of RAMB16_S9_S9 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_1E of RAMB16_S9_S9 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_1F of RAMB16_S9_S9 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_20 of RAMB16_S9_S9 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_21 of RAMB16_S9_S9 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_22 of RAMB16_S9_S9 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_23 of RAMB16_S9_S9 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_24 of RAMB16_S9_S9 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_25 of RAMB16_S9_S9 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_26 of RAMB16_S9_S9 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_27 of RAMB16_S9_S9 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_28 of RAMB16_S9_S9 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_29 of RAMB16_S9_S9 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_2A of RAMB16_S9_S9 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_2B of RAMB16_S9_S9 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_2C of RAMB16_S9_S9 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_2D of RAMB16_S9_S9 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_2E of RAMB16_S9_S9 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_2F of RAMB16_S9_S9 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_30 of RAMB16_S9_S9 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_31 of RAMB16_S9_S9 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_32 of RAMB16_S9_S9 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_33 of RAMB16_S9_S9 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_34 of RAMB16_S9_S9 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_35 of RAMB16_S9_S9 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_36 of RAMB16_S9_S9 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_37 of RAMB16_S9_S9 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_38 of RAMB16_S9_S9 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_39 of RAMB16_S9_S9 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_3A of RAMB16_S9_S9 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_3B of RAMB16_S9_S9 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_3C of RAMB16_S9_S9 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_3D of RAMB16_S9_S9 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_3E of RAMB16_S9_S9 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_3F of RAMB16_S9_S9 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INITP_00 of RAMB16_S9_S9 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INITP_01 of RAMB16_S9_S9 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INITP_02 of RAMB16_S9_S9 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INITP_03 of RAMB16_S9_S9 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INITP_04 of RAMB16_S9_S9 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INITP_05 of RAMB16_S9_S9 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INITP_06 of RAMB16_S9_S9 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INITP_07 of RAMB16_S9_S9 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute SRVAL_A of RAMB16_S9_S9 : component is "000";
   attribute SRVAL_B of RAMB16_S9_S9 : component is "000";
   attribute WRITE_MODE_A of RAMB16_S9_S9 : component is "WRITE_FIRST";
   attribute WRITE_MODE_B of RAMB16_S9_S9 : component is "WRITE_FIRST";
   attribute INIT_A of RAMB16_S9_S9 : component is "000";
   attribute INIT_B of RAMB16_S9_S9 : component is "000";
   attribute SIM_COLLISION_CHECK of RAMB16_S9_S9 : component is "ALL";
   attribute BOX_TYPE of RAMB16_S9_S9 : component is "BLACK_BOX";
   
   component XOR8_MXILINX_amstrad_video
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             I4 : in    std_logic; 
             I5 : in    std_logic; 
             I6 : in    std_logic; 
             I7 : in    std_logic; 
             O  : out   std_logic);
   end component;
   
   component GND
      port ( G : out   std_logic);
   end component;
   attribute BOX_TYPE of GND : component is "BLACK_BOX";
   
   component VCC
      port ( P : out   std_logic);
   end component;
   attribute BOX_TYPE of VCC : component is "BLACK_BOX";
   
   component INV
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of INV : component is "BLACK_BOX";
   
   component AND3
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND3 : component is "BLACK_BOX";
   
   component SELECT8
      port ( s1    : in    std_logic; 
             DATA1 : in    std_logic_vector (7 downto 0); 
             DATA2 : in    std_logic_vector (7 downto 0); 
             DATA0 : out   std_logic_vector (7 downto 0));
   end component;
   
   attribute HU_SET of XLXI_2 : label is "XLXI_2_21";
begin
   XLXI_1 : RAMB16_S9_S9
      port map (ADDRA(10 downto 0)=>AO(10 downto 0),
                ADDRB(10 downto 0)=>AI(10 downto 0),
                CLKA=>CLKO,
                CLKB=>CLKI,
                DIA(7)=>zero,
                DIA(6)=>zero,
                DIA(5)=>zero,
                DIA(4)=>zero,
                DIA(3)=>zero,
                DIA(2)=>zero,
                DIA(1)=>zero,
                DIA(0)=>zero,
                DIB(7 downto 0)=>DI(7 downto 0),
                DIPA(0)=>XLXN_23(0),
                DIPB(0)=>XLXN_1(0),
                ENA=>XLXN_17,
                ENB=>XLXN_17,
                SSRA=>XLXN_14,
                SSRB=>XLXN_17,
                WEA=>XLXN_14,
                WEB=>WR_00,
                DOA(7 downto 0)=>XLXN_78(7 downto 0),
                DOB=>open,
                DOPA=>open,
                DOPB=>open);
   
   XLXI_2 : XOR8_MXILINX_amstrad_video
      port map (I0=>DI(7),
                I1=>DI(6),
                I2=>DI(5),
                I3=>DI(4),
                I4=>DI(3),
                I5=>DI(2),
                I6=>DI(1),
                I7=>DI(0),
                O=>XLXN_1(0));
   
   XLXI_3 : GND
      port map (G=>XLXN_14);
   
   XLXI_4 : VCC
      port map (P=>XLXN_17);
   
   XLXI_5 : GND
      port map (G=>XLXN_23(0));
   
   XLXI_6 : GND
      port map (G=>zero);
   
   XLXI_9 : RAMB16_S9_S9
      port map (ADDRA(10 downto 0)=>AO(10 downto 0),
                ADDRB(10 downto 0)=>AI(10 downto 0),
                CLKA=>CLKO,
                CLKB=>CLKI,
                DIA(7)=>zero,
                DIA(6)=>zero,
                DIA(5)=>zero,
                DIA(4)=>zero,
                DIA(3)=>zero,
                DIA(2)=>zero,
                DIA(1)=>zero,
                DIA(0)=>zero,
                DIB(7 downto 0)=>DI(7 downto 0),
                DIPA(0)=>XLXN_25(0),
                DIPB(0)=>XLXN_1(0),
                ENA=>XLXN_27,
                ENB=>XLXN_27,
                SSRA=>XLXN_26,
                SSRB=>XLXN_27,
                WEA=>XLXN_26,
                WEB=>WR_10,
                DOA(7 downto 0)=>XLXN_76(7 downto 0),
                DOB=>open,
                DOPA=>open,
                DOPB=>open);
   
   XLXI_10 : GND
      port map (G=>XLXN_25(0));
   
   XLXI_11 : GND
      port map (G=>XLXN_26);
   
   XLXI_12 : VCC
      port map (P=>XLXN_27);
   
   XLXI_13 : RAMB16_S9_S9
      port map (ADDRA(10 downto 0)=>AO(10 downto 0),
                ADDRB(10 downto 0)=>AI(10 downto 0),
                CLKA=>CLKO,
                CLKB=>CLKI,
                DIA(7)=>zero,
                DIA(6)=>zero,
                DIA(5)=>zero,
                DIA(4)=>zero,
                DIA(3)=>zero,
                DIA(2)=>zero,
                DIA(1)=>zero,
                DIA(0)=>zero,
                DIB(7 downto 0)=>DI(7 downto 0),
                DIPA(0)=>XLXN_28(0),
                DIPB(0)=>XLXN_1(0),
                ENA=>XLXN_30,
                ENB=>XLXN_30,
                SSRA=>XLXN_29,
                SSRB=>XLXN_30,
                WEA=>XLXN_29,
                WEB=>WR_01,
                DOA(7 downto 0)=>XLXN_79(7 downto 0),
                DOB=>open,
                DOPA=>open,
                DOPB=>open);
   
   XLXI_14 : GND
      port map (G=>XLXN_28(0));
   
   XLXI_15 : GND
      port map (G=>XLXN_29);
   
   XLXI_16 : VCC
      port map (P=>XLXN_30);
   
   XLXI_20 : INV
      port map (I=>AI(12),
                O=>XLXN_53);
   
   XLXI_21 : INV
      port map (I=>AI(11),
                O=>XLXN_47);
   
   XLXI_22 : AND3
      port map (I0=>XLXN_47,
                I1=>XLXN_53,
                I2=>WR,
                O=>WR_00);
   
   XLXI_23 : AND3
      port map (I0=>AI(11),
                I1=>XLXN_53,
                I2=>WR,
                O=>WR_01);
   
   XLXI_24 : AND3
      port map (I0=>XLXN_47,
                I1=>AI(12),
                I2=>WR,
                O=>WR_10);
   
   XLXI_25 : SELECT8
      port map (DATA1(7 downto 0)=>XLXN_76(7 downto 0),
                DATA2(7 downto 0)=>XLXN_77(7 downto 0),
                s1=>AO(12),
                DATA0(7 downto 0)=>DO(7 downto 0));
   
   XLXI_26 : SELECT8
      port map (DATA1(7 downto 0)=>XLXN_79(7 downto 0),
                DATA2(7 downto 0)=>XLXN_78(7 downto 0),
                s1=>AO(11),
                DATA0(7 downto 0)=>XLXN_77(7 downto 0));
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity VRAM_Amstrad_MUSER_amstrad_video is
   port ( vga_A    : in    std_logic_vector (13 downto 0); 
          vga_CLK  : in    std_logic; 
          vram_A   : in    std_logic_vector (13 downto 0); 
          vram_CLK : in    std_logic; 
          vram_D   : in    std_logic_vector (7 downto 0); 
          vram_W   : in    std_logic; 
          vga_D    : out   std_logic_vector (7 downto 0));
end VRAM_Amstrad_MUSER_amstrad_video;

architecture BEHAVIORAL of VRAM_Amstrad_MUSER_amstrad_video is
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

entity VRAM32Ko_Amstrad_MUSER_amstrad_video is
   port ( vga_A    : in    std_logic_vector (14 downto 0); 
          vga_CLK  : in    std_logic; 
          vram_A   : in    std_logic_vector (14 downto 0); 
          vram_CLK : in    std_logic; 
          vram_D   : in    std_logic_vector (7 downto 0); 
          vram_W   : in    std_logic; 
          vga_D    : out   std_logic_vector (7 downto 0));
end VRAM32Ko_Amstrad_MUSER_amstrad_video;

architecture BEHAVIORAL of VRAM32Ko_Amstrad_MUSER_amstrad_video is
   attribute BOX_TYPE   : string ;
   signal XLXN_19  : std_logic;
   signal XLXN_21  : std_logic;
   signal XLXN_23  : std_logic;
   signal XLXN_31  : std_logic;
   signal XLXN_40  : std_logic_vector (7 downto 0);
   signal XLXN_46  : std_logic_vector (7 downto 0);
   component VRAM_Amstrad_MUSER_amstrad_video
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
   XLXI_1 : VRAM_Amstrad_MUSER_amstrad_video
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
   
   XLXI_6 : VRAM_Amstrad_MUSER_amstrad_video
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



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity amstrad_video is
   port ( CLK4MHz   : in    std_logic; 
          CLK25MHz  : in    std_logic; 
          crtc_A    : in    std_logic_vector (14 downto 0); 
          crtc_D    : in    std_logic_vector (7 downto 0); 
          crtc_W    : in    std_logic; 
          palette_A : in    std_logic_vector (12 downto 0); 
          palette_D : in    std_logic_vector (7 downto 0); 
          palette_W : in    std_logic; 
          BLUE2     : out   std_logic_vector (1 downto 0); 
          GREEN3    : out   std_logic_vector (2 downto 0); 
          HSYNC     : out   std_logic; 
          RED3      : out   std_logic_vector (2 downto 0); 
          VSYNC     : out   std_logic);
end amstrad_video;

architecture BEHAVIORAL of amstrad_video is
   attribute BOX_TYPE   : string ;
   attribute HU_SET     : string ;
   signal XLXN_337  : std_logic;
   signal XLXN_338  : std_logic;
   signal XLXN_339  : std_logic;
   signal XLXN_340  : std_logic_vector (7 downto 0);
   signal XLXN_342  : std_logic;
   signal XLXN_343  : std_logic;
   signal XLXN_344  : std_logic_vector (7 downto 0);
   signal XLXN_452  : std_logic_vector (7 downto 0);
   signal XLXN_549  : std_logic;
   signal XLXN_550  : std_logic;
   signal XLXN_627  : std_logic;
   signal XLXN_684  : std_logic_vector (7 downto 0);
   signal XLXN_693  : std_logic_vector (14 downto 0);
   signal XLXN_694  : std_logic_vector (12 downto 0);
   signal XLXN_701  : std_logic_vector (1 downto 0);
   signal XLXN_702  : std_logic_vector (2 downto 0);
   signal XLXN_703  : std_logic_vector (1 downto 0);
   component INV
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of INV : component is "BLACK_BOX";
   
   component FD8CE_MXILINX_amstrad_video
      port ( C   : in    std_logic; 
             CE  : in    std_logic; 
             CLR : in    std_logic; 
             D   : in    std_logic_vector (7 downto 0); 
             Q   : out   std_logic_vector (7 downto 0));
   end component;
   
   component VCC
      port ( P : out   std_logic);
   end component;
   attribute BOX_TYPE of VCC : component is "BLACK_BOX";
   
   component GND
      port ( G : out   std_logic);
   end component;
   attribute BOX_TYPE of GND : component is "BLACK_BOX";
   
   component NEXUS_RGB
      port ( RED_FF    : in    std_logic_vector (1 downto 0); 
             RED3      : out   std_logic_vector (2 downto 0); 
             GREEN3    : out   std_logic_vector (2 downto 0); 
             GREEN_FFF : in    std_logic_vector (2 downto 0); 
             BLUE_FF   : in    std_logic_vector (1 downto 0); 
             BLUE2     : out   std_logic_vector (1 downto 0));
   end component;
   
   component VRAM32Ko_Amstrad_MUSER_amstrad_video
      port ( vram_CLK : in    std_logic; 
             vga_CLK  : in    std_logic; 
             vram_A   : in    std_logic_vector (14 downto 0); 
             vga_A    : in    std_logic_vector (14 downto 0); 
             vram_W   : in    std_logic; 
             vram_D   : in    std_logic_vector (7 downto 0); 
             vga_D    : out   std_logic_vector (7 downto 0));
   end component;
   
   component PALETTE_RAM_MUSER_amstrad_video
      port ( DI   : in    std_logic_vector (7 downto 0); 
             CLKI : in    std_logic; 
             CLKO : in    std_logic; 
             WR   : in    std_logic; 
             AI   : in    std_logic_vector (12 downto 0); 
             AO   : in    std_logic_vector (12 downto 0); 
             DO   : out   std_logic_vector (7 downto 0));
   end component;
   
   component aZRaEL_vram2vgaAmstradMiaow
      port ( CLK_25MHz : in    std_logic; 
             DATA      : in    std_logic_vector (7 downto 0); 
             PALETTE_D : in    std_logic_vector (7 downto 0); 
             VSYNC     : out   std_logic; 
             HSYNC     : out   std_logic; 
             ADDRESS   : out   std_logic_vector (14 downto 0); 
             PALETTE_A : out   std_logic_vector (12 downto 0); 
             RED       : out   std_logic_vector (1 downto 0); 
             GREEN     : out   std_logic_vector (2 downto 0); 
             BLUE      : out   std_logic_vector (1 downto 0));
   end component;
   
   attribute HU_SET of XLXI_321 : label is "XLXI_321_23";
   attribute HU_SET of XLXI_324 : label is "XLXI_324_22";
begin
   XLXI_320 : INV
      port map (I=>XLXN_627,
                O=>XLXN_337);
   
   XLXI_321 : FD8CE_MXILINX_amstrad_video
      port map (C=>XLXN_549,
                CE=>XLXN_338,
                CLR=>XLXN_339,
                D(7 downto 0)=>XLXN_340(7 downto 0),
                Q(7 downto 0)=>XLXN_344(7 downto 0));
   
   XLXI_322 : VCC
      port map (P=>XLXN_338);
   
   XLXI_323 : GND
      port map (G=>XLXN_339);
   
   XLXI_324 : FD8CE_MXILINX_amstrad_video
      port map (C=>XLXN_550,
                CE=>XLXN_343,
                CLR=>XLXN_342,
                D(7 downto 0)=>XLXN_344(7 downto 0),
                Q(7 downto 0)=>XLXN_452(7 downto 0));
   
   XLXI_325 : GND
      port map (G=>XLXN_342);
   
   XLXI_326 : VCC
      port map (P=>XLXN_343);
   
   XLXI_418 : NEXUS_RGB
      port map (BLUE_FF(1 downto 0)=>XLXN_703(1 downto 0),
                GREEN_FFF(2 downto 0)=>XLXN_702(2 downto 0),
                RED_FF(1 downto 0)=>XLXN_701(1 downto 0),
                BLUE2(1 downto 0)=>BLUE2(1 downto 0),
                GREEN3(2 downto 0)=>GREEN3(2 downto 0),
                RED3(2 downto 0)=>RED3(2 downto 0));
   
   XLXI_421 : INV
      port map (I=>XLXN_627,
                O=>XLXN_549);
   
   XLXI_422 : INV
      port map (I=>XLXN_549,
                O=>XLXN_550);
   
   XLXI_470 : INV
      port map (I=>CLK25MHz,
                O=>XLXN_627);
   
   XLXI_474 : VRAM32Ko_Amstrad_MUSER_amstrad_video
      port map (vga_A(14 downto 0)=>XLXN_693(14 downto 0),
                vga_CLK=>XLXN_627,
                vram_A(14 downto 0)=>crtc_A(14 downto 0),
                vram_CLK=>CLK4MHz,
                vram_D(7 downto 0)=>crtc_D(7 downto 0),
                vram_W=>crtc_W,
                vga_D(7 downto 0)=>XLXN_340(7 downto 0));
   
   XLXI_475 : PALETTE_RAM_MUSER_amstrad_video
      port map (AI(12 downto 0)=>palette_A(12 downto 0),
                AO(12 downto 0)=>XLXN_694(12 downto 0),
                CLKI=>CLK4MHz,
                CLKO=>XLXN_627,
                DI(7 downto 0)=>palette_D(7 downto 0),
                WR=>palette_W,
                DO(7 downto 0)=>XLXN_684(7 downto 0));
   
   XLXI_476 : aZRaEL_vram2vgaAmstradMiaow
      port map (CLK_25MHz=>XLXN_337,
                DATA(7 downto 0)=>XLXN_452(7 downto 0),
                PALETTE_D(7 downto 0)=>XLXN_684(7 downto 0),
                ADDRESS(14 downto 0)=>XLXN_693(14 downto 0),
                BLUE(1 downto 0)=>XLXN_703(1 downto 0),
                GREEN(2 downto 0)=>XLXN_702(2 downto 0),
                HSYNC=>HSYNC,
                PALETTE_A(12 downto 0)=>XLXN_694(12 downto 0),
                RED(1 downto 0)=>XLXN_701(1 downto 0),
                VSYNC=>VSYNC);
   
end BEHAVIORAL;


