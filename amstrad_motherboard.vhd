--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : amstrad_motherboard.vhf
-- /___/   /\     Timestamp : 04/16/2022 13:28:31
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -intstyle ise -family spartan3e -flat -suppress -vhdl /home/skip/pano/working/FPGAmstrad/BuildYourOwnZ80Computer/ise/amstrad_motherboard.vhf -w /home/skip/pano/working/FPGAmstrad/BuildYourOwnZ80Computer/amstrad_motherboard.sch
--Design Name: amstrad_motherboard
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

entity joybuf_MUSER_amstrad_motherboard is
   port ( JOY_OUT : out   std_logic_vector (7 downto 0); 
          JOY_IN  : inout std_logic_vector (7 downto 0));
end joybuf_MUSER_amstrad_motherboard;

architecture BEHAVIORAL of joybuf_MUSER_amstrad_motherboard is
   attribute BOX_TYPE   : string ;
   component BUF
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of BUF : component is "BLACK_BOX";
   
   component PULLDOWN
      port ( O : out   std_logic);
   end component;
   attribute BOX_TYPE of PULLDOWN : component is "BLACK_BOX";
   
begin
   XLXI_1 : BUF
      port map (I=>JOY_IN(0),
                O=>JOY_OUT(0));
   
   XLXI_2 : PULLDOWN
      port map (O=>JOY_IN(0));
   
   XLXI_5 : BUF
      port map (I=>JOY_IN(1),
                O=>JOY_OUT(1));
   
   XLXI_6 : PULLDOWN
      port map (O=>JOY_IN(1));
   
   XLXI_7 : BUF
      port map (I=>JOY_IN(2),
                O=>JOY_OUT(2));
   
   XLXI_8 : PULLDOWN
      port map (O=>JOY_IN(2));
   
   XLXI_9 : BUF
      port map (I=>JOY_IN(3),
                O=>JOY_OUT(3));
   
   XLXI_10 : PULLDOWN
      port map (O=>JOY_IN(3));
   
   XLXI_11 : BUF
      port map (I=>JOY_IN(4),
                O=>JOY_OUT(4));
   
   XLXI_12 : PULLDOWN
      port map (O=>JOY_IN(4));
   
   XLXI_13 : BUF
      port map (I=>JOY_IN(5),
                O=>JOY_OUT(5));
   
   XLXI_14 : PULLDOWN
      port map (O=>JOY_IN(5));
   
   XLXI_15 : BUF
      port map (I=>JOY_IN(6),
                O=>JOY_OUT(6));
   
   XLXI_16 : PULLDOWN
      port map (O=>JOY_IN(6));
   
   XLXI_17 : BUF
      port map (I=>JOY_IN(7),
                O=>JOY_OUT(7));
   
   XLXI_18 : PULLDOWN
      port map (O=>JOY_IN(7));
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity joykeyb_MUSER_amstrad_motherboard is
   port ( CLK4MHz   : in    std_logic; 
          joystick1 : in    std_logic_vector (7 downto 0); 
          joystick2 : in    std_logic_vector (7 downto 0); 
          PPI_portC : in    std_logic_vector (3 downto 0); 
          PS2_CLK   : in    std_logic; 
          PS2_DATA  : in    std_logic; 
          reset     : in    std_logic; 
          PPI_portA : out   std_logic_vector (7 downto 0));
end joykeyb_MUSER_amstrad_motherboard;

architecture BEHAVIORAL of joykeyb_MUSER_amstrad_motherboard is
   attribute BOX_TYPE   : string ;
   signal PPI_enable : std_logic;
   signal XLXN_27    : std_logic_vector (9 downto 0);
   signal XLXN_28    : std_logic;
   signal XLXN_29    : std_logic_vector (7 downto 0);
   signal XLXN_30    : std_logic;
   signal XLXN_31    : std_logic;
   component Keyboard
      port ( datain   : in    std_logic; 
             clkin    : in    std_logic; 
             fclk     : in    std_logic; 
             rst      : in    std_logic; 
             fok      : out   std_logic; 
             scancode : out   std_logic_vector (7 downto 0));
   end component;
   
   component KEYBOARD_driver
      port ( CLK       : in    std_logic; 
             enable    : in    std_logic; 
             press     : in    std_logic; 
             unpress   : in    std_logic; 
             portC     : in    std_logic_vector (3 downto 0); 
             joystick1 : in    std_logic_vector (7 downto 0); 
             joystick2 : in    std_logic_vector (7 downto 0); 
             keycode   : in    std_logic_vector (9 downto 0); 
             portA     : out   std_logic_vector (7 downto 0));
   end component;
   
   component KEYBOARD_controller
      port ( CLK         : in    std_logic; 
             fok         : in    std_logic; 
             scancode_in : in    std_logic_vector (7 downto 0); 
             press       : out   std_logic; 
             unpress     : out   std_logic; 
             keycode     : out   std_logic_vector (9 downto 0));
   end component;
   
   component VCC
      port ( P : out   std_logic);
   end component;
   attribute BOX_TYPE of VCC : component is "BLACK_BOX";
   
begin
   XLXI_1 : Keyboard
      port map (clkin=>PS2_CLK,
                datain=>PS2_DATA,
                fclk=>CLK4MHz,
                rst=>reset,
                fok=>XLXN_28,
                scancode(7 downto 0)=>XLXN_29(7 downto 0));
   
   XLXI_2 : KEYBOARD_driver
      port map (CLK=>CLK4MHz,
                enable=>PPI_enable,
                joystick1(7 downto 0)=>joystick1(7 downto 0),
                joystick2(7 downto 0)=>joystick2(7 downto 0),
                keycode(9 downto 0)=>XLXN_27(9 downto 0),
                portC(3 downto 0)=>PPI_portC(3 downto 0),
                press=>XLXN_30,
                unpress=>XLXN_31,
                portA(7 downto 0)=>PPI_portA(7 downto 0));
   
   XLXI_3 : KEYBOARD_controller
      port map (CLK=>CLK4MHz,
                fok=>XLXN_28,
                scancode_in(7 downto 0)=>XLXN_29(7 downto 0),
                keycode(9 downto 0)=>XLXN_27(9 downto 0),
                press=>XLXN_30,
                unpress=>XLXN_31);
   
   XLXI_4 : VCC
      port map (P=>PPI_enable);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity FTCE_MXILINX_amstrad_motherboard is
   generic( INIT : bit :=  '0');
   port ( C   : in    std_logic; 
          CE  : in    std_logic; 
          CLR : in    std_logic; 
          T   : in    std_logic; 
          Q   : out   std_logic);
end FTCE_MXILINX_amstrad_motherboard;

architecture BEHAVIORAL of FTCE_MXILINX_amstrad_motherboard is
   attribute BOX_TYPE   : string ;
   attribute RLOC       : string ;
   signal TQ      : std_logic;
   signal Q_DUMMY : std_logic;
   component XOR2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of XOR2 : component is "BLACK_BOX";
   
   component FDCE
      generic( INIT : bit :=  '0');
      port ( C   : in    std_logic; 
             CE  : in    std_logic; 
             CLR : in    std_logic; 
             D   : in    std_logic; 
             Q   : out   std_logic);
   end component;
   attribute BOX_TYPE of FDCE : component is "BLACK_BOX";
   
   attribute RLOC of I_36_35 : label is "X0Y0";
begin
   Q <= Q_DUMMY;
   I_36_32 : XOR2
      port map (I0=>T,
                I1=>Q_DUMMY,
                O=>TQ);
   
   I_36_35 : FDCE
   generic map( INIT => INIT)
      port map (C=>C,
                CE=>CE,
                CLR=>CLR,
                D=>TQ,
                Q=>Q_DUMMY);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity CB4CE_MXILINX_amstrad_motherboard is
   port ( C   : in    std_logic; 
          CE  : in    std_logic; 
          CLR : in    std_logic; 
          CEO : out   std_logic; 
          Q0  : out   std_logic; 
          Q1  : out   std_logic; 
          Q2  : out   std_logic; 
          Q3  : out   std_logic; 
          TC  : out   std_logic);
end CB4CE_MXILINX_amstrad_motherboard;

architecture BEHAVIORAL of CB4CE_MXILINX_amstrad_motherboard is
   attribute HU_SET     : string ;
   attribute BOX_TYPE   : string ;
   signal T2       : std_logic;
   signal T3       : std_logic;
   signal XLXN_1   : std_logic;
   signal Q0_DUMMY : std_logic;
   signal Q1_DUMMY : std_logic;
   signal Q2_DUMMY : std_logic;
   signal Q3_DUMMY : std_logic;
   signal TC_DUMMY : std_logic;
   component FTCE_MXILINX_amstrad_motherboard
      generic( INIT : bit :=  '0');
      port ( C   : in    std_logic; 
             CE  : in    std_logic; 
             CLR : in    std_logic; 
             T   : in    std_logic; 
             Q   : out   std_logic);
   end component;
   
   component AND4
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND4 : component is "BLACK_BOX";
   
   component AND3
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND3 : component is "BLACK_BOX";
   
   component AND2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2 : component is "BLACK_BOX";
   
   component VCC
      port ( P : out   std_logic);
   end component;
   attribute BOX_TYPE of VCC : component is "BLACK_BOX";
   
   attribute HU_SET of I_Q0 : label is "I_Q0_13";
   attribute HU_SET of I_Q1 : label is "I_Q1_14";
   attribute HU_SET of I_Q2 : label is "I_Q2_15";
   attribute HU_SET of I_Q3 : label is "I_Q3_16";
begin
   Q0 <= Q0_DUMMY;
   Q1 <= Q1_DUMMY;
   Q2 <= Q2_DUMMY;
   Q3 <= Q3_DUMMY;
   TC <= TC_DUMMY;
   I_Q0 : FTCE_MXILINX_amstrad_motherboard
      port map (C=>C,
                CE=>CE,
                CLR=>CLR,
                T=>XLXN_1,
                Q=>Q0_DUMMY);
   
   I_Q1 : FTCE_MXILINX_amstrad_motherboard
      port map (C=>C,
                CE=>CE,
                CLR=>CLR,
                T=>Q0_DUMMY,
                Q=>Q1_DUMMY);
   
   I_Q2 : FTCE_MXILINX_amstrad_motherboard
      port map (C=>C,
                CE=>CE,
                CLR=>CLR,
                T=>T2,
                Q=>Q2_DUMMY);
   
   I_Q3 : FTCE_MXILINX_amstrad_motherboard
      port map (C=>C,
                CE=>CE,
                CLR=>CLR,
                T=>T3,
                Q=>Q3_DUMMY);
   
   I_36_31 : AND4
      port map (I0=>Q3_DUMMY,
                I1=>Q2_DUMMY,
                I2=>Q1_DUMMY,
                I3=>Q0_DUMMY,
                O=>TC_DUMMY);
   
   I_36_32 : AND3
      port map (I0=>Q2_DUMMY,
                I1=>Q1_DUMMY,
                I2=>Q0_DUMMY,
                O=>T3);
   
   I_36_33 : AND2
      port map (I0=>Q1_DUMMY,
                I1=>Q0_DUMMY,
                O=>T2);
   
   I_36_58 : VCC
      port map (P=>XLXN_1);
   
   I_36_67 : AND2
      port map (I0=>CE,
                I1=>TC_DUMMY,
                O=>CEO);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity CB2CE_MXILINX_amstrad_motherboard is
   port ( C   : in    std_logic; 
          CE  : in    std_logic; 
          CLR : in    std_logic; 
          CEO : out   std_logic; 
          Q0  : out   std_logic; 
          Q1  : out   std_logic; 
          TC  : out   std_logic);
end CB2CE_MXILINX_amstrad_motherboard;

architecture BEHAVIORAL of CB2CE_MXILINX_amstrad_motherboard is
   attribute HU_SET     : string ;
   attribute BOX_TYPE   : string ;
   signal XLXN_1   : std_logic;
   signal Q0_DUMMY : std_logic;
   signal Q1_DUMMY : std_logic;
   signal TC_DUMMY : std_logic;
   component FTCE_MXILINX_amstrad_motherboard
      generic( INIT : bit :=  '0');
      port ( C   : in    std_logic; 
             CE  : in    std_logic; 
             CLR : in    std_logic; 
             T   : in    std_logic; 
             Q   : out   std_logic);
   end component;
   
   component AND2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2 : component is "BLACK_BOX";
   
   component VCC
      port ( P : out   std_logic);
   end component;
   attribute BOX_TYPE of VCC : component is "BLACK_BOX";
   
   attribute HU_SET of I_Q0 : label is "I_Q0_17";
   attribute HU_SET of I_Q1 : label is "I_Q1_18";
begin
   Q0 <= Q0_DUMMY;
   Q1 <= Q1_DUMMY;
   TC <= TC_DUMMY;
   I_Q0 : FTCE_MXILINX_amstrad_motherboard
      port map (C=>C,
                CE=>CE,
                CLR=>CLR,
                T=>XLXN_1,
                Q=>Q0_DUMMY);
   
   I_Q1 : FTCE_MXILINX_amstrad_motherboard
      port map (C=>C,
                CE=>CE,
                CLR=>CLR,
                T=>Q0_DUMMY,
                Q=>Q1_DUMMY);
   
   I_36_37 : AND2
      port map (I0=>Q1_DUMMY,
                I1=>Q0_DUMMY,
                O=>TC_DUMMY);
   
   I_36_47 : VCC
      port map (P=>XLXN_1);
   
   I_36_52 : AND2
      port map (I0=>CE,
                I1=>TC_DUMMY,
                O=>CEO);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity amstrad_motherboard is
   port ( CLK16MHz  : in    std_logic; 
          init_A    : in    std_logic_vector (22 downto 0); 
          init_W_n  : in    std_logic; 
          is_ucpm   : in    std_logic; 
          PS2_CLK   : in    std_logic; 
          PS2_DATA  : in    std_logic; 
          RESET_n   : in    std_logic; 
          audio     : out   std_logic; 
          CLK8      : out   std_logic_vector (2 downto 0); 
          crtc_A    : out   std_logic_vector (15 downto 0); 
          crtc_D    : out   std_logic_vector (7 downto 0); 
          crtc_W    : out   std_logic; 
          OE1_n     : out   std_logic; 
          palette_A : out   std_logic_vector (12 downto 0); 
          palette_D : out   std_logic_vector (7 downto 0); 
          palette_W : out   std_logic; 
          ram_A     : out   std_logic_vector (22 downto 0); 
          ram_W_n   : out   std_logic; 
          JOYSTICK1 : inout std_logic_vector (7 downto 0); 
          JOYSTICK2 : inout std_logic_vector (7 downto 0); 
          ram_D     : inout std_logic_vector (7 downto 0));
end amstrad_motherboard;

architecture BEHAVIORAL of amstrad_motherboard is
   attribute BOX_TYPE   : string ;
   attribute HU_SET     : string ;
   signal A            : std_logic_vector (15 downto 0);
   signal D            : std_logic_vector (7 downto 0);
   signal IO_RD        : std_logic;
   signal IO_REQ       : std_logic;
   signal IO_WR        : std_logic;
   signal LED1         : std_logic;
   signal LED2         : std_logic;
   signal MEM_RD       : std_logic;
   signal MEM_WR       : std_logic;
   signal n_crtc_vsync : std_logic;
   signal portC        : std_logic_vector (7 downto 0);
   signal RAMBank      : std_logic_vector (2 downto 0);
   signal ROMbank      : std_logic_vector (3 downto 0);
   signal un           : std_logic;
   signal vram_A       : std_logic_vector (17 downto 0);
   signal XLXN_16      : std_logic;
   signal XLXN_38      : std_logic;
   signal XLXN_58      : std_logic;
   signal XLXN_75      : std_logic;
   signal XLXN_86      : std_logic;
   signal XLXN_118     : std_logic;
   signal XLXN_180     : std_logic;
   signal XLXN_283     : std_logic_vector (7 downto 0);
   signal XLXN_301     : std_logic;
   signal XLXN_303     : std_logic;
   signal XLXN_427     : std_logic_vector (19 downto 0);
   signal XLXN_435     : std_logic;
   signal XLXN_451     : std_logic;
   signal XLXN_462     : std_logic_vector (7 downto 0);
   signal XLXN_464     : std_logic;
   signal XLXN_470     : std_logic;
   signal XLXN_473     : std_logic;
   signal XLXN_474     : std_logic;
   signal XLXN_475     : std_logic;
   signal XLXN_486     : std_logic_vector (7 downto 0);
   signal XLXN_498     : std_logic;
   signal XLXN_499     : std_logic;
   signal XLXN_518     : std_logic_vector (7 downto 0);
   signal XLXN_519     : std_logic_vector (7 downto 0);
   signal XLXN_542     : std_logic;
   signal XLXN_551     : std_logic;
   signal XLXN_555     : std_logic;
   signal XLXN_556     : std_logic;
   signal XLXN_621     : std_logic;
   signal XLXN_633     : std_logic;
   signal XLXN_735     : std_logic;
   signal XLXN_785     : std_logic;
   signal XLXN_786     : std_logic;
   signal XLXN_787     : std_logic;
   signal XLXN_798     : std_logic_vector (7 downto 0);
   signal XLXN_799     : std_logic_vector (7 downto 0);
   signal XLXN_802     : std_logic;
   signal XLXN_806     : std_logic;
   signal XLXN_807     : std_logic;
   signal XLXN_814     : std_logic;
   signal XLXN_824     : std_logic;
   signal XLXN_826     : std_logic;
   signal XLXN_830     : std_logic;
   signal XLXN_832     : std_logic;
   signal XLXN_835     : std_logic;
   signal XLXN_845     : std_logic;
   signal XLXN_848     : std_logic;
   signal XLXN_849     : std_logic;
   signal XLXN_852     : std_logic;
   signal XLXN_854     : std_logic;
   signal XLXN_855     : std_logic;
   signal XLXN_856     : std_logic;
   signal XLXN_857     : std_logic_vector (1 downto 0);
   signal XLXN_858     : std_logic;
   signal zero         : std_logic;
   signal CLK8_DUMMY   : std_logic_vector (2 downto 0);
   signal crtc_A_DUMMY : std_logic_vector (15 downto 0);
   component T80se
      port ( RESET_n : in    std_logic; 
             CLK_n   : in    std_logic; 
             CLKEN   : in    std_logic; 
             WAIT_n  : in    std_logic; 
             INT_n   : in    std_logic; 
             NMI_n   : in    std_logic; 
             BUSRQ_n : in    std_logic; 
             DI      : in    std_logic_vector (7 downto 0); 
             M1_n    : out   std_logic; 
             MREQ_n  : out   std_logic; 
             IORQ_n  : out   std_logic; 
             RD_n    : out   std_logic; 
             WR_n    : out   std_logic; 
             RFSH_n  : out   std_logic; 
             HALT_n  : out   std_logic; 
             BUSAK_n : out   std_logic; 
             A       : out   std_logic_vector (15 downto 0); 
             DO      : out   std_logic_vector (7 downto 0));
   end component;
   
   component simple_GateArray
      port ( CLK        : in    std_logic; 
             IO_REQ_W   : in    std_logic; 
             A15_A14    : in    std_logic_vector (1 downto 0); 
             D          : in    std_logic_vector (7 downto 0); 
             lowerROMen : out   std_logic; 
             upperROMen : out   std_logic; 
             MODE       : out   std_logic_vector (1 downto 0); 
             RAMbank    : out   std_logic_vector (2 downto 0));
   end component;
   
   component simple_GateArrayInterrupt
      port ( IO_REQ_W      : in    std_logic; 
             IO_REQ_R      : in    std_logic; 
             IO_ACK        : in    std_logic; 
             M1_n          : in    std_logic; 
             MEM_WR        : in    std_logic; 
             reset         : in    std_logic; 
             CLK8          : in    std_logic_vector (2 downto 0); 
             A15_A14_A9_A8 : in    std_logic_vector (3 downto 0); 
             MODE_select   : in    std_logic_vector (1 downto 0); 
             D             : in    std_logic_vector (7 downto 0); 
             Dout          : inout std_logic_vector (7 downto 0); 
             ram_D         : inout std_logic_vector (7 downto 0); 
             crtc_VSYNC    : out   std_logic; 
             crtc_W        : out   std_logic; 
             crtc_transmit : out   std_logic; 
             int           : out   std_logic; 
             WAIT_MEM_n    : out   std_logic; 
             WAIT_n        : out   std_logic; 
             ram_R         : out   std_logic; 
             palette_W     : out   std_logic; 
             crtc_A        : out   std_logic_vector (15 downto 0); 
             crtc_D        : out   std_logic_vector (7 downto 0); 
             palette_A     : out   std_logic_vector (12 downto 0); 
             palette_D     : out   std_logic_vector (7 downto 0));
   end component;
   
   component I82C55
      port ( I_CS_L    : in    std_logic; 
             I_RD_L    : in    std_logic; 
             I_WR_L    : in    std_logic; 
             RESET     : in    std_logic; 
             ENA       : in    std_logic; 
             CLK       : in    std_logic; 
             I_ADDR    : in    std_logic_vector (1 downto 0); 
             I_DATA    : in    std_logic_vector (7 downto 0); 
             I_PA      : in    std_logic_vector (7 downto 0); 
             I_PB      : in    std_logic_vector (7 downto 0); 
             I_PC      : in    std_logic_vector (7 downto 0); 
             IO_DATA   : inout std_logic_vector (7 downto 0); 
             O_PA      : out   std_logic_vector (7 downto 0); 
             O_PA_OE_L : out   std_logic_vector (7 downto 0); 
             O_PB      : out   std_logic_vector (7 downto 0); 
             O_PB_OE_L : out   std_logic_vector (7 downto 0); 
             O_PC      : out   std_logic_vector (7 downto 0); 
             O_PC_OE_L : out   std_logic_vector (7 downto 0));
   end component;
   
   component VCC
      port ( P : out   std_logic);
   end component;
   attribute BOX_TYPE of VCC : component is "BLACK_BOX";
   
   component AND2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2 : component is "BLACK_BOX";
   
   component AmstradRAMROM
      port ( wr_z80     : in    std_logic; 
             wr_io_z80  : in    std_logic; 
             lowerROMen : in    std_logic; 
             upperROMen : in    std_logic; 
             A          : in    std_logic_vector (15 downto 0); 
             RAMbank    : in    std_logic_vector (2 downto 0); 
             ROMbank    : in    std_logic_vector (3 downto 0); 
             ram_A      : out   std_logic_vector (17 downto 0));
   end component;
   
   component INV
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of INV : component is "BLACK_BOX";
   
   component CB2CE_MXILINX_amstrad_motherboard
      port ( C   : in    std_logic; 
             CE  : in    std_logic; 
             CLR : in    std_logic; 
             CEO : out   std_logic; 
             Q0  : out   std_logic; 
             Q1  : out   std_logic; 
             TC  : out   std_logic);
   end component;
   
   component GND
      port ( G : out   std_logic);
   end component;
   attribute BOX_TYPE of GND : component is "BLACK_BOX";
   
   component RAM_driver
      port ( rd    : in    std_logic; 
             wr    : in    std_logic; 
             reset : in    std_logic; 
             CLK8  : in    std_logic_vector (2 downto 0); 
             Din   : in    std_logic_vector (7 downto 0); 
             Dout  : inout std_logic_vector (7 downto 0); 
             ram_D : inout std_logic_vector (7 downto 0); 
             ram_W : out   std_logic; 
             ram_R : out   std_logic);
   end component;
   
   component simple_DSK
      port ( CLK_bourin : in    std_logic; 
             reset      : in    std_logic; 
             A0         : in    std_logic; 
             IO_RD      : in    std_logic; 
             IO_WR      : in    std_logic; 
             M1_n       : in    std_logic; 
             is_ucpm    : in    std_logic; 
             CLK8       : in    std_logic_vector (2 downto 0); 
             A10_A8_A7  : in    std_logic_vector (2 downto 0); 
             D_command  : in    std_logic_vector (7 downto 0); 
             D_result   : inout std_logic_vector (7 downto 0); 
             dsk_info_D : inout std_logic_vector (7 downto 0); 
             dsk_W      : out   std_logic; 
             dsk_R      : out   std_logic; 
             transmit   : out   std_logic; 
             dsk_A      : out   std_logic_vector (19 downto 0));
   end component;
   
   component ROMselect
      port ( CLK     : in    std_logic; 
             A13     : in    std_logic; 
             IO_WR   : in    std_logic; 
             D       : in    std_logic_vector (7 downto 0); 
             ROMbank : out   std_logic_vector (3 downto 0));
   end component;
   
   component OR2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR2 : component is "BLACK_BOX";
   
   component AmstradRAMDSK
      port ( transmit      : in    std_logic; 
             crtc_transmit : in    std_logic; 
             init_done     : in    std_logic; 
             A             : in    std_logic_vector (17 downto 0); 
             dsk_A         : in    std_logic_vector (19 downto 0); 
             init_A        : in    std_logic_vector (22 downto 0); 
             crtc_A        : in    std_logic_vector (15 downto 0); 
             ram_A         : out   std_logic_vector (22 downto 0));
   end component;
   
   component YM2149
      port ( I_A9_L    : in    std_logic; 
             I_A8      : in    std_logic; 
             I_BDIR    : in    std_logic; 
             I_BC2     : in    std_logic; 
             I_BC1     : in    std_logic; 
             I_SEL_L   : in    std_logic; 
             ENA       : in    std_logic; 
             RESET_L   : in    std_logic; 
             CLK       : in    std_logic; 
             I_DA      : in    std_logic_vector (7 downto 0); 
             I_IOA     : in    std_logic_vector (7 downto 0); 
             O_DA_OE_L : out   std_logic; 
             O_DA      : out   std_logic_vector (7 downto 0); 
             O_AUDIO   : out   std_logic_vector (7 downto 0));
   end component;
   
   component PWM
      port ( clk     : in    std_logic; 
             PWM_in  : in    std_logic_vector (7 downto 0); 
             PWM_out : out   std_logic);
   end component;
   
   component CB4CE_MXILINX_amstrad_motherboard
      port ( C   : in    std_logic; 
             CE  : in    std_logic; 
             CLR : in    std_logic; 
             CEO : out   std_logic; 
             Q0  : out   std_logic; 
             Q1  : out   std_logic; 
             Q2  : out   std_logic; 
             Q3  : out   std_logic; 
             TC  : out   std_logic);
   end component;
   
   component joykeyb_MUSER_amstrad_motherboard
      port ( reset     : in    std_logic; 
             PS2_CLK   : in    std_logic; 
             PS2_DATA  : in    std_logic; 
             CLK4MHz   : in    std_logic; 
             PPI_portC : in    std_logic_vector (3 downto 0); 
             joystick1 : in    std_logic_vector (7 downto 0); 
             joystick2 : in    std_logic_vector (7 downto 0); 
             PPI_portA : out   std_logic_vector (7 downto 0));
   end component;
   
   component BUF
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of BUF : component is "BLACK_BOX";
   
   component joybuf_MUSER_amstrad_motherboard
      port ( JOY_OUT : out   std_logic_vector (7 downto 0); 
             JOY_IN  : inout std_logic_vector (7 downto 0));
   end component;
   
   component please_wait
      port ( CLK_n      : in    std_logic; 
             WAIT_n     : in    std_logic; 
             CLK_WAIT_n : out   std_logic; 
             CLK8       : in    std_logic_vector (2 downto 0));
   end component;
   
   component AND3
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND3 : component is "BLACK_BOX";
   
   attribute HU_SET of XLXI_221 : label is "XLXI_221_19";
   attribute HU_SET of XLXI_399 : label is "XLXI_399_20";
begin
   CLK8(2 downto 0) <= CLK8_DUMMY(2 downto 0);
   crtc_A(15 downto 0) <= crtc_A_DUMMY(15 downto 0);
   AmstradT80 : T80se
      port map (BUSRQ_n=>XLXN_16,
                CLKEN=>XLXN_16,
                CLK_n=>XLXN_802,
                DI(7 downto 0)=>XLXN_283(7 downto 0),
                INT_n=>XLXN_814,
                NMI_n=>XLXN_16,
                RESET_n=>RESET_n,
                WAIT_n=>XLXN_16,
                A(15 downto 0)=>A(15 downto 0),
                BUSAK_n=>open,
                DO(7 downto 0)=>D(7 downto 0),
                HALT_n=>open,
                IORQ_n=>XLXN_75,
                MREQ_n=>XLXN_58,
                M1_n=>XLXN_845,
                RD_n=>XLXN_86,
                RFSH_n=>open,
                WR_n=>XLXN_38);
   
   GA : simple_GateArray
      port map (A15_A14(1 downto 0)=>A(15 downto 14),
                CLK=>XLXN_435,
                D(7 downto 0)=>D(7 downto 0),
                IO_REQ_W=>IO_WR,
                lowerROMen=>LED1,
                MODE(1 downto 0)=>XLXN_857(1 downto 0),
                RAMbank(2 downto 0)=>RAMBank(2 downto 0),
                upperROMen=>LED2);
   
   GA_interrupt : simple_GateArrayInterrupt
      port map (A15_A14_A9_A8(3)=>A(15),
                A15_A14_A9_A8(2)=>A(14),
                A15_A14_A9_A8(1)=>A(9),
                A15_A14_A9_A8(0)=>A(8),
                CLK8(2 downto 0)=>CLK8_DUMMY(2 downto 0),
                D(7 downto 0)=>D(7 downto 0),
                IO_ACK=>XLXN_826,
                IO_REQ_R=>IO_RD,
                IO_REQ_W=>IO_WR,
                MEM_WR=>MEM_WR,
                MODE_select(1 downto 0)=>XLXN_857(1 downto 0),
                M1_n=>XLXN_845,
                reset=>XLXN_858,
                crtc_A(15 downto 0)=>crtc_A_DUMMY(15 downto 0),
                crtc_D(7 downto 0)=>crtc_D(7 downto 0),
                crtc_transmit=>XLXN_852,
                crtc_VSYNC=>n_crtc_vsync,
                crtc_W=>crtc_W,
                int=>XLXN_835,
                palette_A(12 downto 0)=>palette_A(12 downto 0),
                palette_D(7 downto 0)=>palette_D(7 downto 0),
                palette_W=>palette_W,
                ram_R=>XLXN_854,
                WAIT_MEM_n=>XLXN_807,
                WAIT_n=>XLXN_806,
                Dout(7 downto 0)=>XLXN_283(7 downto 0),
                ram_D(7 downto 0)=>ram_D(7 downto 0));
   
   PPI : I82C55
      port map (CLK=>XLXN_832,
                ENA=>XLXN_303,
                I_ADDR(1 downto 0)=>A(9 downto 8),
                I_CS_L=>A(11),
                I_DATA(7 downto 0)=>D(7 downto 0),
                I_PA(7 downto 0)=>XLXN_519(7 downto 0),
                I_PB(7)=>zero,
                I_PB(6)=>zero,
                I_PB(5)=>zero,
                I_PB(4)=>un,
                I_PB(3)=>un,
                I_PB(2)=>un,
                I_PB(1)=>zero,
                I_PB(0)=>n_crtc_vsync,
                I_PC(7)=>zero,
                I_PC(6)=>zero,
                I_PC(5)=>zero,
                I_PC(4)=>zero,
                I_PC(3)=>zero,
                I_PC(2)=>zero,
                I_PC(1)=>zero,
                I_PC(0)=>zero,
                I_RD_L=>XLXN_301,
                I_WR_L=>XLXN_180,
                RESET=>XLXN_858,
                O_PA(7 downto 0)=>XLXN_462(7 downto 0),
                O_PA_OE_L=>open,
                O_PB=>open,
                O_PB_OE_L=>open,
                O_PC(7 downto 0)=>portC(7 downto 0),
                O_PC_OE_L=>open,
                IO_DATA(7 downto 0)=>XLXN_283(7 downto 0));
   
   XLXI_168 : VCC
      port map (P=>XLXN_16);
   
   XLXI_170 : AND2
      port map (I0=>XLXN_785,
                I1=>XLXN_786,
                O=>MEM_WR);
   
   XLXI_173 : AmstradRAMROM
      port map (A(15 downto 0)=>A(15 downto 0),
                lowerROMen=>LED1,
                RAMbank(2 downto 0)=>RAMBank(2 downto 0),
                ROMbank(3 downto 0)=>ROMbank(3 downto 0),
                upperROMen=>LED2,
                wr_io_z80=>IO_WR,
                wr_z80=>MEM_WR,
                ram_A(17 downto 0)=>vram_A(17 downto 0));
   
   XLXI_181 : INV
      port map (I=>XLXN_58,
                O=>XLXN_786);
   
   XLXI_183 : INV
      port map (I=>XLXN_75,
                O=>IO_REQ);
   
   XLXI_184 : AND2
      port map (I0=>IO_REQ,
                I1=>XLXN_785,
                O=>IO_WR);
   
   XLXI_186 : INV
      port map (I=>XLXN_86,
                O=>XLXN_787);
   
   XLXI_187 : AND2
      port map (I0=>XLXN_787,
                I1=>XLXN_786,
                O=>MEM_RD);
   
   XLXI_199 : INV
      port map (I=>XLXN_451,
                O=>OE1_n);
   
   XLXI_219 : AND2
      port map (I0=>XLXN_787,
                I1=>IO_REQ,
                O=>IO_RD);
   
   XLXI_221 : CB2CE_MXILINX_amstrad_motherboard
      port map (C=>CLK16MHz,
                CE=>XLXN_542,
                CLR=>XLXN_118,
                CEO=>open,
                Q0=>CLK8_DUMMY(1),
                Q1=>CLK8_DUMMY(2),
                TC=>open);
   
   XLXI_223 : GND
      port map (G=>XLXN_118);
   
   XLXI_224 : RAM_driver
      port map (CLK8(2 downto 0)=>CLK8_DUMMY(2 downto 0),
                Din(7 downto 0)=>D(7 downto 0),
                rd=>MEM_RD,
                reset=>XLXN_858,
                wr=>MEM_WR,
                ram_R=>XLXN_855,
                ram_W=>XLXN_555,
                Dout(7 downto 0)=>XLXN_283(7 downto 0),
                ram_D(7 downto 0)=>ram_D(7 downto 0));
   
   XLXI_226 : INV
      port map (I=>XLXN_555,
                O=>XLXN_556);
   
   XLXI_243 : INV
      port map (I=>CLK8_DUMMY(2),
                O=>XLXN_435);
   
   XLXI_253 : GND
      port map (G=>zero);
   
   XLXI_256 : VCC
      port map (P=>un);
   
   XLXI_257 : INV
      port map (I=>IO_RD,
                O=>XLXN_301);
   
   XLXI_258 : INV
      port map (I=>IO_WR,
                O=>XLXN_180);
   
   XLXI_297 : INV
      port map (I=>CLK8_DUMMY(2),
                O=>XLXN_832);
   
   XLXI_306 : VCC
      port map (P=>XLXN_303);
   
   XLXI_307 : INV
      port map (I=>RESET_n,
                O=>XLXN_858);
   
   XLXI_332 : INV
      port map (I=>XLXN_835,
                O=>XLXN_814);
   
   XLXI_344 : simple_DSK
      port map (A0=>A(0),
                A10_A8_A7(2)=>A(10),
                A10_A8_A7(1)=>A(8),
                A10_A8_A7(0)=>A(7),
                CLK_bourin=>XLXN_832,
                CLK8(2 downto 0)=>CLK8_DUMMY(2 downto 0),
                D_command(7 downto 0)=>D(7 downto 0),
                IO_RD=>IO_RD,
                IO_WR=>IO_WR,
                is_ucpm=>is_ucpm,
                M1_n=>XLXN_845,
                reset=>XLXN_858,
                dsk_A(19 downto 0)=>XLXN_427(19 downto 0),
                dsk_R=>XLXN_735,
                dsk_W=>XLXN_849,
                transmit=>XLXN_621,
                dsk_info_D(7 downto 0)=>ram_D(7 downto 0),
                D_result(7 downto 0)=>XLXN_283(7 downto 0));
   
   XLXI_345 : ROMselect
      port map (A13=>A(13),
                CLK=>XLXN_435,
                D(7 downto 0)=>D(7 downto 0),
                IO_WR=>IO_WR,
                ROMbank(3 downto 0)=>ROMbank(3 downto 0));
   
   XLXI_347 : OR2
      port map (I0=>XLXN_856,
                I1=>XLXN_735,
                O=>XLXN_451);
   
   XLXI_348 : AmstradRAMDSK
      port map (A(17 downto 0)=>vram_A(17 downto 0),
                crtc_A(15 downto 0)=>crtc_A_DUMMY(15 downto 0),
                crtc_transmit=>XLXN_852,
                dsk_A(19 downto 0)=>XLXN_427(19 downto 0),
                init_A(22 downto 0)=>init_A(22 downto 0),
                init_done=>RESET_n,
                transmit=>XLXN_621,
                ram_A(22 downto 0)=>ram_A(22 downto 0));
   
   XLXI_349 : YM2149
      port map (CLK=>XLXN_551,
                ENA=>XLXN_473,
                I_A8=>XLXN_464,
                I_A9_L=>XLXN_475,
                I_BC1=>portC(6),
                I_BC2=>XLXN_470,
                I_BDIR=>portC(7),
                I_DA(7 downto 0)=>XLXN_462(7 downto 0),
                I_IOA(7 downto 0)=>XLXN_518(7 downto 0),
                I_SEL_L=>XLXN_474,
                RESET_L=>RESET_n,
                O_AUDIO(7 downto 0)=>XLXN_486(7 downto 0),
                O_DA(7 downto 0)=>XLXN_519(7 downto 0),
                O_DA_OE_L=>open);
   
   XLXI_350 : VCC
      port map (P=>XLXN_464);
   
   XLXI_351 : VCC
      port map (P=>XLXN_470);
   
   XLXI_355 : GND
      port map (G=>XLXN_475);
   
   XLXI_367 : PWM
      port map (clk=>XLXN_551,
                PWM_in(7 downto 0)=>XLXN_486(7 downto 0),
                PWM_out=>audio);
   
   XLXI_377 : VCC
      port map (P=>XLXN_473);
   
   XLXI_383 : VCC
      port map (P=>XLXN_498);
   
   XLXI_384 : GND
      port map (G=>XLXN_499);
   
   XLXI_385 : VCC
      port map (P=>XLXN_474);
   
   XLXI_399 : CB4CE_MXILINX_amstrad_motherboard
      port map (C=>XLXN_832,
                CE=>XLXN_498,
                CLR=>XLXN_499,
                CEO=>open,
                Q0=>open,
                Q1=>XLXN_551,
                Q2=>open,
                Q3=>open,
                TC=>open);
   
   XLXI_414 : VCC
      port map (P=>XLXN_542);
   
   XLXI_417 : INV
      port map (I=>CLK16MHz,
                O=>CLK8_DUMMY(0));
   
   XLXI_475 : AND2
      port map (I0=>XLXN_824,
                I1=>IO_REQ,
                O=>XLXN_826);
   
   XLXI_476 : INV
      port map (I=>XLXN_845,
                O=>XLXN_824);
   
   XLXI_494 : joykeyb_MUSER_amstrad_motherboard
      port map (CLK4MHz=>XLXN_633,
                joystick1(7 downto 0)=>XLXN_798(7 downto 0),
                joystick2(7 downto 0)=>XLXN_799(7 downto 0),
                PPI_portC(3 downto 0)=>portC(3 downto 0),
                PS2_CLK=>PS2_CLK,
                PS2_DATA=>PS2_DATA,
                reset=>XLXN_858,
                PPI_portA(7 downto 0)=>XLXN_518(7 downto 0));
   
   XLXI_495 : BUF
      port map (I=>XLXN_832,
                O=>XLXN_633);
   
   XLXI_549 : INV
      port map (I=>XLXN_38,
                O=>XLXN_785);
   
   XLXI_566 : joybuf_MUSER_amstrad_motherboard
      port map (JOY_OUT(7 downto 0)=>XLXN_798(7 downto 0),
                JOY_IN(7 downto 0)=>JOYSTICK1(7 downto 0));
   
   XLXI_567 : joybuf_MUSER_amstrad_motherboard
      port map (JOY_OUT(7 downto 0)=>XLXN_799(7 downto 0),
                JOY_IN(7 downto 0)=>JOYSTICK2(7 downto 0));
   
   XLXI_568 : please_wait
      port map (CLK_n=>CLK8_DUMMY(2),
                CLK8(2 downto 0)=>CLK8_DUMMY(2 downto 0),
                WAIT_n=>XLXN_830,
                CLK_WAIT_n=>XLXN_802);
   
   XLXI_570 : AND2
      port map (I0=>XLXN_807,
                I1=>XLXN_806,
                O=>XLXN_830);
   
   XLXI_575 : AND3
      port map (I0=>XLXN_556,
                I1=>init_W_n,
                I2=>XLXN_848,
                O=>ram_W_n);
   
   XLXI_576 : INV
      port map (I=>XLXN_849,
                O=>XLXN_848);
   
   XLXI_577 : OR2
      port map (I0=>XLXN_855,
                I1=>XLXN_854,
                O=>XLXN_856);
   
end BEHAVIORAL;


