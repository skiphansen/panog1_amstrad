--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : joybuf.vhf
-- /___/   /\     Timestamp : 04/16/2022 13:28:32
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -intstyle ise -family spartan3e -flat -suppress -vhdl /home/skip/pano/working/FPGAmstrad/BuildYourOwnZ80Computer/ise/joybuf.vhf -w /home/skip/pano/working/FPGAmstrad/BuildYourOwnZ80Computer/joybuf.sch
--Design Name: joybuf
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

entity joybuf is
   port ( JOY_OUT : out   std_logic_vector (7 downto 0); 
          JOY_IN  : inout std_logic_vector (7 downto 0));
end joybuf;

architecture BEHAVIORAL of joybuf is
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


