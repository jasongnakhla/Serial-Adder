----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/28/2019 10:05:14 AM
-- Design Name: 
-- Module Name: ca3 - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ca3 is
    Port ( x : in STD_LOGIC;
           y : in STD_LOGIC;
           clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           en: in STD_LOGIC;
           LSB: out STD_LOGIC;
           s : out STD_LOGIC);
end ca3;

architecture Behavioral of ca3 is

component fadder is
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           cin : in STD_LOGIC;
           sum : out STD_LOGIC;
           cout : out STD_LOGIC);
 
 end component;

 component dff is          
     Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           d : in STD_LOGIC;
           q : out STD_LOGIC);
end component;

 component siso is          
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           si : in STD_LOGIC;
           sout : out STD_LOGIC);
end component;

--component counter is
--    Port ( clk : in STD_LOGIC;
--           rst : in STD_LOGIC;
--           ctr : in STD_LOGIC;
--           start : out STD_LOGIC);
--end component;

signal xi, yi, fadder_cout, fadder_cin, fadder_sum: std_logic := '0';

begin

siso_ins_x: siso port map(clk => clk, rst => rst, si => x, sout => xi);
siso_ins_y: siso port map(clk => clk, rst => rst, si => y, sout => yi);
siso_ins_out: siso port map(clk => clk, rst => rst, si => fadder_sum, sout => s);
fadder_in: fadder port map(a => xi, b => yi, cin => fadder_cin, sum => fadder_sum, cout => fadder_cout);
dff_ins: dff port map(clk => clk, rst => rst, d => fadder_cout, q => fadder_cin);
--COUNT: counter port map(clk => clk, rst => rst, ctr => en, start => LSB);

end Behavioral;

