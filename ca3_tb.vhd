----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/30/2019 09:12:37 AM
-- Design Name: 
-- Module Name: ca3_tb - Behavioral
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

entity ca3_tb is
--  Port ( );
end ca3_tb;

architecture Behavioral of ca3_tb is

component ca3 is
    Port ( x : in STD_LOGIC;
           y : in STD_LOGIC;
           clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           en: in STD_LOGIC;
           LSB: out STD_LOGIC;
           s : out STD_LOGIC);
end component;

signal x_int, y_int, clk_int, rst_int, s_int, en_int, LSB: STD_LOGIC;
constant cp: time := 10ns;

begin

uut: ca3 port map (x => x_int, y => y_int, clk => clk_int, rst => rst_int, en=>en_int, LSB=> LSB, s => s_int);

-- clock
process
begin
clk_int <= '1';
wait for cp/2;
clk_int <= '0';
wait for cp/2;
end process;

-- reset
process
begin
rst_int <= '1';
wait for cp;
rst_int <= '0';
wait;
end process;

-- x siso
process
begin
wait for 0.5*cp;
x_int <= '1';
wait for 2*cp;
x_int <= '0';
wait for cp;
x_int <= '1';
wait for cp;
x_int <= '0';
wait for 3*cp;
x_int <= '1';
wait for 5*cp;
x_int <= '0';
wait for 8*cp;
wait;
end process;

-- y siso
process
begin
wait for 0.5*cp;
y_int <= '1';
wait for 3*cp;
y_int <= '0';
wait for cp;
y_int <= '1';
wait for 2*cp;
y_int <= '0';
wait for cp;
y_int <= '1';
wait for 7*cp;
y_int <= '0';
wait for 3*cp;
wait;
end process;

process
begin
en_int <= '1'
after 17*cp;
wait;
end process;

end Behavioral;

