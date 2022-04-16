--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : amstrad_switch_z80_vga_sd.vhf
-- /___/   /\     Timestamp : 04/16/2022 13:28:31
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -intstyle ise -family spartan3e -flat -suppress -vhdl /home/skip/pano/working/FPGAmstrad/BuildYourOwnZ80Computer/ise/amstrad_switch_z80_vga_sd.vhf -w /home/skip/pano/working/FPGAmstrad/BuildYourOwnZ80Computer/amstrad_switch_z80_vga_sd.sch
--Design Name: amstrad_switch_z80_vga_sd
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

entity joybuf_MUSER_amstrad_switch_z80_vga_sd is
   port ( JOY_OUT : out   std_logic_vector (7 downto 0); 
          JOY_IN  : inout std_logic_vector (7 downto 0));
end joybuf_MUSER_amstrad_switch_z80_vga_sd;

architecture BEHAVIORAL of joybuf_MUSER_amstrad_switch_z80_vga_sd is
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

entity joykeyb_MUSER_amstrad_switch_z80_vga_sd is
   port ( CLK4MHz   : in    std_logic; 
          joystick1 : in    std_logic_vector (7 downto 0); 
          joystick2 : in    std_logic_vector (7 downto 0); 
          PPI_portC : in    std_logic_vector (3 downto 0); 
          PS2_CLK   : in    std_logic; 
          PS2_DATA  : in    std_logic; 
          reset     : in    std_logic; 
          PPI_portA : out   std_logic_vector (7 downto 0));
end joykeyb_MUSER_amstrad_switch_z80_vga_sd;

architecture BEHAVIORAL of joykeyb_MUSER_amstrad_switch_z80_vga_sd is
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

entity FTCE_MXILINX_amstrad_switch_z80_vga_sd is
   generic( INIT : bit :=  '0');
   port ( C   : in    std_logic; 
          CE  : in    std_logic; 
          CLR : in    std_logic; 
          T   : in    std_logic; 
          Q   : out   std_logic);
end FTCE_MXILINX_amstrad_switch_z80_vga_sd;

architecture BEHAVIORAL of FTCE_MXILINX_amstrad_switch_z80_vga_sd is
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

entity CB4CE_MXILINX_amstrad_switch_z80_vga_sd is
   port ( C   : in    std_logic; 
          CE  : in    std_logic; 
          CLR : in    std_logic; 
          CEO : out   std_logic; 
          Q0  : out   std_logic; 
          Q1  : out   std_logic; 
          Q2  : out   std_logic; 
          Q3  : out   std_logic; 
          TC  : out   std_logic);
end CB4CE_MXILINX_amstrad_switch_z80_vga_sd;

architecture BEHAVIORAL of CB4CE_MXILINX_amstrad_switch_z80_vga_sd is
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
   component FTCE_MXILINX_amstrad_switch_z80_vga_sd
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
   
   attribute HU_SET of I_Q0 : label is "I_Q0_0";
   attribute HU_SET of I_Q1 : label is "I_Q1_1";
   attribute HU_SET of I_Q2 : label is "I_Q2_2";
   attribute HU_SET of I_Q3 : label is "I_Q3_3";
begin
   Q0 <= Q0_DUMMY;
   Q1 <= Q1_DUMMY;
   Q2 <= Q2_DUMMY;
   Q3 <= Q3_DUMMY;
   TC <= TC_DUMMY;
   I_Q0 : FTCE_MXILINX_amstrad_switch_z80_vga_sd
      port map (C=>C,
                CE=>CE,
                CLR=>CLR,
                T=>XLXN_1,
                Q=>Q0_DUMMY);
   
   I_Q1 : FTCE_MXILINX_amstrad_switch_z80_vga_sd
      port map (C=>C,
                CE=>CE,
                CLR=>CLR,
                T=>Q0_DUMMY,
                Q=>Q1_DUMMY);
   
   I_Q2 : FTCE_MXILINX_amstrad_switch_z80_vga_sd
      port map (C=>C,
                CE=>CE,
                CLR=>CLR,
                T=>T2,
                Q=>Q2_DUMMY);
   
   I_Q3 : FTCE_MXILINX_amstrad_switch_z80_vga_sd
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

entity CB2CE_MXILINX_amstrad_switch_z80_vga_sd is
   port ( C   : in    std_logic; 
          CE  : in    std_logic; 
          CLR : in    std_logic; 
          CEO : out   std_logic; 
          Q0  : out   std_logic; 
          Q1  : out   std_logic; 
          TC  : out   std_logic);
end CB2CE_MXILINX_amstrad_switch_z80_vga_sd;

architecture BEHAVIORAL of CB2CE_MXILINX_amstrad_switch_z80_vga_sd is
   attribute HU_SET     : string ;
   attribute BOX_TYPE   : string ;
   signal XLXN_1   : std_logic;
   signal Q0_DUMMY : std_logic;
   signal Q1_DUMMY : std_logic;
   signal TC_DUMMY : std_logic;
   component FTCE_MXILINX_amstrad_switch_z80_vga_sd
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
   
   attribute HU_SET of I_Q0 : label is "I_Q0_4";
   attribute HU_SET of I_Q1 : label is "I_Q1_5";
begin
   Q0 <= Q0_DUMMY;
   Q1 <= Q1_DUMMY;
   TC <= TC_DUMMY;
   I_Q0 : FTCE_MXILINX_amstrad_switch_z80_vga_sd
      port map (C=>C,
                CE=>CE,
                CLR=>CLR,
                T=>XLXN_1,
                Q=>Q0_DUMMY);
   
   I_Q1 : FTCE_MXILINX_amstrad_switch_z80_vga_sd
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

entity amstrad_motherboard_MUSER_amstrad_switch_z80_vga_sd is
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
end amstrad_motherboard_MUSER_amstrad_switch_z80_vga_sd;

architecture BEHAVIORAL of amstrad_motherboard_MUSER_amstrad_switch_z80_vga_sd 
      is
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
   
   component CB2CE_MXILINX_amstrad_switch_z80_vga_sd
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
   
   component CB4CE_MXILINX_amstrad_switch_z80_vga_sd
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
   
   component joykeyb_MUSER_amstrad_switch_z80_vga_sd
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
   
   component joybuf_MUSER_amstrad_switch_z80_vga_sd
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
   
   attribute HU_SET of XLXI_221 : label is "XLXI_221_6";
   attribute HU_SET of XLXI_399 : label is "XLXI_399_7";
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
   
   XLXI_221 : CB2CE_MXILINX_amstrad_switch_z80_vga_sd
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
   
   XLXI_399 : CB4CE_MXILINX_amstrad_switch_z80_vga_sd
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
   
   XLXI_494 : joykeyb_MUSER_amstrad_switch_z80_vga_sd
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
   
   XLXI_566 : joybuf_MUSER_amstrad_switch_z80_vga_sd
      port map (JOY_OUT(7 downto 0)=>XLXN_798(7 downto 0),
                JOY_IN(7 downto 0)=>JOYSTICK1(7 downto 0));
   
   XLXI_567 : joybuf_MUSER_amstrad_switch_z80_vga_sd
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



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity FD8CE_MXILINX_amstrad_switch_z80_vga_sd is
   port ( C   : in    std_logic; 
          CE  : in    std_logic; 
          CLR : in    std_logic; 
          D   : in    std_logic_vector (7 downto 0); 
          Q   : out   std_logic_vector (7 downto 0));
end FD8CE_MXILINX_amstrad_switch_z80_vga_sd;

architecture BEHAVIORAL of FD8CE_MXILINX_amstrad_switch_z80_vga_sd is
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

entity XOR8_MXILINX_amstrad_switch_z80_vga_sd is
   port ( I0 : in    std_logic; 
          I1 : in    std_logic; 
          I2 : in    std_logic; 
          I3 : in    std_logic; 
          I4 : in    std_logic; 
          I5 : in    std_logic; 
          I6 : in    std_logic; 
          I7 : in    std_logic; 
          O  : out   std_logic);
end XOR8_MXILINX_amstrad_switch_z80_vga_sd;

architecture BEHAVIORAL of XOR8_MXILINX_amstrad_switch_z80_vga_sd is
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

entity PALETTE_RAM_MUSER_amstrad_switch_z80_vga_sd is
   port ( AI   : in    std_logic_vector (12 downto 0); 
          AO   : in    std_logic_vector (12 downto 0); 
          CLKI : in    std_logic; 
          CLKO : in    std_logic; 
          DI   : in    std_logic_vector (7 downto 0); 
          WR   : in    std_logic; 
          DO   : out   std_logic_vector (7 downto 0));
end PALETTE_RAM_MUSER_amstrad_switch_z80_vga_sd;

architecture BEHAVIORAL of PALETTE_RAM_MUSER_amstrad_switch_z80_vga_sd is
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
   
   component XOR8_MXILINX_amstrad_switch_z80_vga_sd
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
   
   attribute HU_SET of XLXI_2 : label is "XLXI_2_8";
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
   
   XLXI_2 : XOR8_MXILINX_amstrad_switch_z80_vga_sd
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

entity VRAM_Amstrad_MUSER_amstrad_switch_z80_vga_sd is
   port ( vga_A    : in    std_logic_vector (13 downto 0); 
          vga_CLK  : in    std_logic; 
          vram_A   : in    std_logic_vector (13 downto 0); 
          vram_CLK : in    std_logic; 
          vram_D   : in    std_logic_vector (7 downto 0); 
          vram_W   : in    std_logic; 
          vga_D    : out   std_logic_vector (7 downto 0));
end VRAM_Amstrad_MUSER_amstrad_switch_z80_vga_sd;

architecture BEHAVIORAL of VRAM_Amstrad_MUSER_amstrad_switch_z80_vga_sd is
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

entity VRAM32Ko_Amstrad_MUSER_amstrad_switch_z80_vga_sd is
   port ( vga_A    : in    std_logic_vector (14 downto 0); 
          vga_CLK  : in    std_logic; 
          vram_A   : in    std_logic_vector (14 downto 0); 
          vram_CLK : in    std_logic; 
          vram_D   : in    std_logic_vector (7 downto 0); 
          vram_W   : in    std_logic; 
          vga_D    : out   std_logic_vector (7 downto 0));
end VRAM32Ko_Amstrad_MUSER_amstrad_switch_z80_vga_sd;

architecture BEHAVIORAL of VRAM32Ko_Amstrad_MUSER_amstrad_switch_z80_vga_sd is
   attribute BOX_TYPE   : string ;
   signal XLXN_19  : std_logic;
   signal XLXN_21  : std_logic;
   signal XLXN_23  : std_logic;
   signal XLXN_31  : std_logic;
   signal XLXN_40  : std_logic_vector (7 downto 0);
   signal XLXN_46  : std_logic_vector (7 downto 0);
   component VRAM_Amstrad_MUSER_amstrad_switch_z80_vga_sd
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
   XLXI_1 : VRAM_Amstrad_MUSER_amstrad_switch_z80_vga_sd
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
   
   XLXI_6 : VRAM_Amstrad_MUSER_amstrad_switch_z80_vga_sd
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

entity amstrad_video_MUSER_amstrad_switch_z80_vga_sd is
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
end amstrad_video_MUSER_amstrad_switch_z80_vga_sd;

architecture BEHAVIORAL of amstrad_video_MUSER_amstrad_switch_z80_vga_sd is
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
   
   component FD8CE_MXILINX_amstrad_switch_z80_vga_sd
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
   
   component VRAM32Ko_Amstrad_MUSER_amstrad_switch_z80_vga_sd
      port ( vram_CLK : in    std_logic; 
             vga_CLK  : in    std_logic; 
             vram_A   : in    std_logic_vector (14 downto 0); 
             vga_A    : in    std_logic_vector (14 downto 0); 
             vram_W   : in    std_logic; 
             vram_D   : in    std_logic_vector (7 downto 0); 
             vga_D    : out   std_logic_vector (7 downto 0));
   end component;
   
   component PALETTE_RAM_MUSER_amstrad_switch_z80_vga_sd
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
   
   attribute HU_SET of XLXI_321 : label is "XLXI_321_10";
   attribute HU_SET of XLXI_324 : label is "XLXI_324_9";
begin
   XLXI_320 : INV
      port map (I=>XLXN_627,
                O=>XLXN_337);
   
   XLXI_321 : FD8CE_MXILINX_amstrad_switch_z80_vga_sd
      port map (C=>XLXN_549,
                CE=>XLXN_338,
                CLR=>XLXN_339,
                D(7 downto 0)=>XLXN_340(7 downto 0),
                Q(7 downto 0)=>XLXN_344(7 downto 0));
   
   XLXI_322 : VCC
      port map (P=>XLXN_338);
   
   XLXI_323 : GND
      port map (G=>XLXN_339);
   
   XLXI_324 : FD8CE_MXILINX_amstrad_switch_z80_vga_sd
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
   
   XLXI_474 : VRAM32Ko_Amstrad_MUSER_amstrad_switch_z80_vga_sd
      port map (vga_A(14 downto 0)=>XLXN_693(14 downto 0),
                vga_CLK=>XLXN_627,
                vram_A(14 downto 0)=>crtc_A(14 downto 0),
                vram_CLK=>CLK4MHz,
                vram_D(7 downto 0)=>crtc_D(7 downto 0),
                vram_W=>crtc_W,
                vga_D(7 downto 0)=>XLXN_340(7 downto 0));
   
   XLXI_475 : PALETTE_RAM_MUSER_amstrad_switch_z80_vga_sd
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



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity divideby2_MUSER_amstrad_switch_z80_vga_sd is
   port ( CLKin  : in    std_logic; 
          CLKout : out   std_logic);
end divideby2_MUSER_amstrad_switch_z80_vga_sd;

architecture BEHAVIORAL of divideby2_MUSER_amstrad_switch_z80_vga_sd is
   attribute HU_SET     : string ;
   attribute BOX_TYPE   : string ;
   signal XLXN_34 : std_logic;
   signal XLXN_35 : std_logic;
   component CB2CE_MXILINX_amstrad_switch_z80_vga_sd
      port ( C   : in    std_logic; 
             CE  : in    std_logic; 
             CLR : in    std_logic; 
             CEO : out   std_logic; 
             Q0  : out   std_logic; 
             Q1  : out   std_logic; 
             TC  : out   std_logic);
   end component;
   
   component VCC
      port ( P : out   std_logic);
   end component;
   attribute BOX_TYPE of VCC : component is "BLACK_BOX";
   
   component GND
      port ( G : out   std_logic);
   end component;
   attribute BOX_TYPE of GND : component is "BLACK_BOX";
   
   attribute HU_SET of XLXI_24 : label is "XLXI_24_11";
begin
   XLXI_24 : CB2CE_MXILINX_amstrad_switch_z80_vga_sd
      port map (C=>CLKin,
                CE=>XLXN_34,
                CLR=>XLXN_35,
                CEO=>open,
                Q0=>CLKout,
                Q1=>open,
                TC=>open);
   
   XLXI_25 : VCC
      port map (P=>XLXN_34);
   
   XLXI_26 : GND
      port map (G=>XLXN_35);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity bootloader_sd_MUSER_amstrad_switch_z80_vga_sd is
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
end bootloader_sd_MUSER_amstrad_switch_z80_vga_sd;

architecture BEHAVIORAL of bootloader_sd_MUSER_amstrad_switch_z80_vga_sd is
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



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity divideby3_MUSER_amstrad_switch_z80_vga_sd is
   port ( CLKin  : in    std_logic; 
          CLKout : out   std_logic);
end divideby3_MUSER_amstrad_switch_z80_vga_sd;

architecture BEHAVIORAL of divideby3_MUSER_amstrad_switch_z80_vga_sd is
   attribute BOX_TYPE              : string ;
   attribute CLK_FEEDBACK          : string ;
   attribute CLKDV_DIVIDE          : string ;
   attribute CLKFX_DIVIDE          : string ;
   attribute CLKIN_PERIOD          : string ;
   attribute CLKFX_MULTIPLY        : string ;
   attribute CLKIN_DIVIDE_BY_2     : string ;
   attribute CLKOUT_PHASE_SHIFT    : string ;
   attribute DESKEW_ADJUST         : string ;
   attribute DFS_FREQUENCY_MODE    : string ;
   attribute DLL_FREQUENCY_MODE    : string ;
   attribute DSS_MODE              : string ;
   attribute DUTY_CYCLE_CORRECTION : string ;
   attribute PHASE_SHIFT           : string ;
   attribute STARTUP_WAIT          : string ;
   attribute FACTORY_JF            : string ;
   signal XLXN_24                     : std_logic;
   signal XLXN_25                     : std_logic;
   signal XLXI_23_DSSEN_openSignal    : std_logic;
   signal XLXI_23_PSCLK_openSignal    : std_logic;
   signal XLXI_23_PSEN_openSignal     : std_logic;
   signal XLXI_23_PSINCDEC_openSignal : std_logic;
   signal XLXI_23_RST_openSignal      : std_logic;
   component BUFG
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of BUFG : component is "BLACK_BOX";
   
   component DCM
      -- synopsys translate_off
      generic( CLK_FEEDBACK : string :=  "1X";
               CLKDV_DIVIDE : real :=  2.0;
               CLKFX_DIVIDE : integer :=  1;
               CLKIN_PERIOD : real :=  10.0;
               CLKFX_MULTIPLY : integer :=  4;
               CLKIN_DIVIDE_BY_2 : boolean :=  FALSE;
               CLKOUT_PHASE_SHIFT : string :=  "NONE";
               DESKEW_ADJUST : string :=  "SYSTEM_SYNCHRONOUS";
               DFS_FREQUENCY_MODE : string :=  "LOW";
               DLL_FREQUENCY_MODE : string :=  "LOW";
               DSS_MODE : string :=  "NONE";
               DUTY_CYCLE_CORRECTION : boolean :=  TRUE;
               PHASE_SHIFT : integer :=  0;
               STARTUP_WAIT : boolean :=  FALSE;
               FACTORY_JF : bit_vector :=  x"C080");
      -- synopsys translate_on
      port ( CLKFB    : in    std_logic; 
             CLKIN    : in    std_logic; 
             DSSEN    : in    std_logic; 
             PSCLK    : in    std_logic; 
             PSEN     : in    std_logic; 
             PSINCDEC : in    std_logic; 
             RST      : in    std_logic; 
             CLK0     : out   std_logic; 
             CLK180   : out   std_logic; 
             CLK270   : out   std_logic; 
             CLK2X    : out   std_logic; 
             CLK2X180 : out   std_logic; 
             CLK90    : out   std_logic; 
             CLKDV    : out   std_logic; 
             CLKFX    : out   std_logic; 
             CLKFX180 : out   std_logic; 
             LOCKED   : out   std_logic; 
             PSDONE   : out   std_logic; 
             STATUS   : out   std_logic_vector (7 downto 0));
   end component;
   attribute CLK_FEEDBACK of DCM : component is "1X";
   attribute CLKDV_DIVIDE of DCM : component is "2.0";
   attribute CLKFX_DIVIDE of DCM : component is "1";
   attribute CLKIN_PERIOD of DCM : component is "10.0";
   attribute CLKFX_MULTIPLY of DCM : component is "4";
   attribute CLKIN_DIVIDE_BY_2 of DCM : component is "FALSE";
   attribute CLKOUT_PHASE_SHIFT of DCM : component is "NONE";
   attribute DESKEW_ADJUST of DCM : component is "SYSTEM_SYNCHRONOUS";
   attribute DFS_FREQUENCY_MODE of DCM : component is "LOW";
   attribute DLL_FREQUENCY_MODE of DCM : component is "LOW";
   attribute DSS_MODE of DCM : component is "NONE";
   attribute DUTY_CYCLE_CORRECTION of DCM : component is "TRUE";
   attribute PHASE_SHIFT of DCM : component is "0";
   attribute STARTUP_WAIT of DCM : component is "FALSE";
   attribute FACTORY_JF of DCM : component is "C080";
   attribute BOX_TYPE of DCM : component is "BLACK_BOX";
   
   attribute CLKDV_DIVIDE of XLXI_23 : label is "3.0";
begin
   XLXI_2 : BUFG
      port map (I=>XLXN_24,
                O=>XLXN_25);
   
   XLXI_23 : DCM
   -- synopsys translate_off
   generic map( CLKDV_DIVIDE => 3.0)
   -- synopsys translate_on
      port map (CLKFB=>XLXN_25,
                CLKIN=>CLKin,
                DSSEN=>XLXI_23_DSSEN_openSignal,
                PSCLK=>XLXI_23_PSCLK_openSignal,
                PSEN=>XLXI_23_PSEN_openSignal,
                PSINCDEC=>XLXI_23_PSINCDEC_openSignal,
                RST=>XLXI_23_RST_openSignal,
                CLKDV=>CLKout,
                CLKFX=>open,
                CLKFX180=>open,
                CLK0=>XLXN_24,
                CLK2X=>open,
                CLK2X180=>open,
                CLK90=>open,
                CLK180=>open,
                CLK270=>open,
                LOCKED=>open,
                PSDONE=>open,
                STATUS=>open);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity amstrad_switch_z80_vga_sd is
   port ( CD_n        : in    std_logic; 
          CLK50MHz    : in    std_logic; 
          FILE_SELECT : in    std_logic_vector (7 downto 0); 
          MISO        : in    std_logic; 
          PS2_CLK     : in    std_logic; 
          PS2_DATA    : in    std_logic; 
          ADV1_n      : out   std_logic; 
          AUDIO       : out   std_logic; 
          BLUE2       : out   std_logic_vector (1 downto 0); 
          CE1_n       : out   std_logic; 
          CLK1        : out   std_logic; 
          CRE1        : out   std_logic; 
          GREEN3      : out   std_logic_vector (2 downto 0); 
          HSYNC       : out   std_logic; 
          LB1_n       : out   std_logic; 
          LEDS        : out   std_logic_vector (7 downto 0); 
          MOSI        : out   std_logic; 
          OE1_n       : out   std_logic; 
          ram_A       : out   std_logic_vector (22 downto 0); 
          ram_W_n     : out   std_logic; 
          RED3        : out   std_logic_vector (2 downto 0); 
          SCLK        : out   std_logic; 
          SS_n        : out   std_logic; 
          UB1_n       : out   std_logic; 
          VSYNC       : out   std_logic; 
          JOYSTICK1   : inout std_logic_vector (7 downto 0); 
          JOYSTICK2   : inout std_logic_vector (7 downto 0); 
          ram_D       : inout std_logic_vector (7 downto 0); 
          ram_D_U     : inout std_logic_vector (7 downto 0));
end amstrad_switch_z80_vga_sd;

architecture BEHAVIORAL of amstrad_switch_z80_vga_sd is
   attribute BOX_TYPE   : string ;
   signal CLK8        : std_logic_vector (2 downto 0);
   signal crtc_A      : std_logic_vector (15 downto 0);
   signal RESET_n     : std_logic;
   signal XLXN_646    : std_logic;
   signal XLXN_717    : std_logic;
   signal XLXN_726    : std_logic;
   signal XLXN_731    : std_logic;
   signal XLXN_732    : std_logic_vector (7 downto 0);
   signal XLXN_736    : std_logic;
   signal XLXN_737    : std_logic_vector (22 downto 0);
   signal XLXN_744    : std_logic;
   signal XLXN_745    : std_logic_vector (12 downto 0);
   signal XLXN_746    : std_logic_vector (7 downto 0);
   component GND
      port ( G : out   std_logic);
   end component;
   attribute BOX_TYPE of GND : component is "BLACK_BOX";
   
   component divideby3_MUSER_amstrad_switch_z80_vga_sd
      port ( CLKin  : in    std_logic; 
             CLKout : out   std_logic);
   end component;
   
   component data_off
      port ( off : inout std_logic_vector (7 downto 0));
   end component;
   
   component bootloader_sd_MUSER_amstrad_switch_z80_vga_sd
      port ( CD_n        : in    std_logic; 
             MISO        : in    std_logic; 
             FILE_SELECT : in    std_logic_vector (7 downto 0); 
             CLK50MHz    : in    std_logic; 
             ram_D       : inout std_logic_vector (7 downto 0); 
             MOSI        : out   std_logic; 
             ram_A       : out   std_logic_vector (22 downto 0); 
             SCLK        : out   std_logic; 
             ram_W_n     : out   std_logic; 
             LEDS        : out   std_logic_vector (7 downto 0); 
             SS_n        : out   std_logic; 
             is_ucpm     : out   std_logic; 
             FILE_LOADED : out   std_logic);
   end component;
   
   component divideby2_MUSER_amstrad_switch_z80_vga_sd
      port ( CLKin  : in    std_logic; 
             CLKout : out   std_logic);
   end component;
   
   component amstrad_video_MUSER_amstrad_switch_z80_vga_sd
      port ( crtc_W    : in    std_logic; 
             crtc_D    : in    std_logic_vector (7 downto 0); 
             crtc_A    : in    std_logic_vector (14 downto 0); 
             CLK4MHz   : in    std_logic; 
             CLK25MHz  : in    std_logic; 
             palette_D : in    std_logic_vector (7 downto 0); 
             palette_A : in    std_logic_vector (12 downto 0); 
             palette_W : in    std_logic; 
             HSYNC     : out   std_logic; 
             VSYNC     : out   std_logic; 
             RED3      : out   std_logic_vector (2 downto 0); 
             GREEN3    : out   std_logic_vector (2 downto 0); 
             BLUE2     : out   std_logic_vector (1 downto 0));
   end component;
   
   component amstrad_motherboard_MUSER_amstrad_switch_z80_vga_sd
      port ( init_A    : in    std_logic_vector (22 downto 0); 
             init_W_n  : in    std_logic; 
             CLK16MHz  : in    std_logic; 
             is_ucpm   : in    std_logic; 
             PS2_CLK   : in    std_logic; 
             PS2_DATA  : in    std_logic; 
             RESET_n   : in    std_logic; 
             ram_D     : inout std_logic_vector (7 downto 0); 
             JOYSTICK2 : inout std_logic_vector (7 downto 0); 
             JOYSTICK1 : inout std_logic_vector (7 downto 0); 
             CLK8      : out   std_logic_vector (2 downto 0); 
             OE1_n     : out   std_logic; 
             ram_A     : out   std_logic_vector (22 downto 0); 
             audio     : out   std_logic; 
             crtc_A    : out   std_logic_vector (15 downto 0); 
             crtc_W    : out   std_logic; 
             ram_W_n   : out   std_logic; 
             crtc_D    : out   std_logic_vector (7 downto 0); 
             palette_W : out   std_logic; 
             palette_A : out   std_logic_vector (12 downto 0); 
             palette_D : out   std_logic_vector (7 downto 0));
   end component;
   
begin
   XLXI_163 : GND
      port map (G=>CE1_n);
   
   XLXI_415 : divideby3_MUSER_amstrad_switch_z80_vga_sd
      port map (CLKin=>CLK50MHz,
                CLKout=>XLXN_717);
   
   XLXI_424 : GND
      port map (G=>LB1_n);
   
   XLXI_425 : GND
      port map (G=>UB1_n);
   
   XLXI_446 : GND
      port map (G=>CRE1);
   
   XLXI_457 : GND
      port map (G=>CLK1);
   
   XLXI_458 : GND
      port map (G=>ADV1_n);
   
   XLXI_461 : data_off
      port map (off(7 downto 0)=>ram_D_U(7 downto 0));
   
   XLXI_462 : bootloader_sd_MUSER_amstrad_switch_z80_vga_sd
      port map (CD_n=>CD_n,
                CLK50MHz=>CLK8(2),
                FILE_SELECT(7 downto 0)=>FILE_SELECT(7 downto 0),
                MISO=>MISO,
                FILE_LOADED=>RESET_n,
                is_ucpm=>XLXN_726,
                LEDS(7 downto 0)=>LEDS(7 downto 0),
                MOSI=>MOSI,
                ram_A(22 downto 0)=>XLXN_737(22 downto 0),
                ram_W_n=>XLXN_736,
                SCLK=>SCLK,
                SS_n=>SS_n,
                ram_D(7 downto 0)=>ram_D(7 downto 0));
   
   XLXI_500 : divideby2_MUSER_amstrad_switch_z80_vga_sd
      port map (CLKin=>CLK50MHz,
                CLKout=>XLXN_646);
   
   XLXI_511 : amstrad_video_MUSER_amstrad_switch_z80_vga_sd
      port map (CLK4MHz=>CLK8(2),
                CLK25MHz=>XLXN_646,
                crtc_A(14 downto 0)=>crtc_A(14 downto 0),
                crtc_D(7 downto 0)=>XLXN_732(7 downto 0),
                crtc_W=>XLXN_731,
                palette_A(12 downto 0)=>XLXN_745(12 downto 0),
                palette_D(7 downto 0)=>XLXN_746(7 downto 0),
                palette_W=>XLXN_744,
                BLUE2(1 downto 0)=>BLUE2(1 downto 0),
                GREEN3(2 downto 0)=>GREEN3(2 downto 0),
                HSYNC=>HSYNC,
                RED3(2 downto 0)=>RED3(2 downto 0),
                VSYNC=>VSYNC);
   
   XLXI_512 : amstrad_motherboard_MUSER_amstrad_switch_z80_vga_sd
      port map (CLK16MHz=>XLXN_717,
                init_A(22 downto 0)=>XLXN_737(22 downto 0),
                init_W_n=>XLXN_736,
                is_ucpm=>XLXN_726,
                PS2_CLK=>PS2_CLK,
                PS2_DATA=>PS2_DATA,
                RESET_n=>RESET_n,
                audio=>AUDIO,
                CLK8(2 downto 0)=>CLK8(2 downto 0),
                crtc_A(15 downto 0)=>crtc_A(15 downto 0),
                crtc_D(7 downto 0)=>XLXN_732(7 downto 0),
                crtc_W=>XLXN_731,
                OE1_n=>OE1_n,
                palette_A(12 downto 0)=>XLXN_745(12 downto 0),
                palette_D(7 downto 0)=>XLXN_746(7 downto 0),
                palette_W=>XLXN_744,
                ram_A(22 downto 0)=>ram_A(22 downto 0),
                ram_W_n=>ram_W_n,
                JOYSTICK1(7 downto 0)=>JOYSTICK1(7 downto 0),
                JOYSTICK2(7 downto 0)=>JOYSTICK2(7 downto 0),
                ram_D(7 downto 0)=>ram_D(7 downto 0));
   
end BEHAVIORAL;


