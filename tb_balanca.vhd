library IEEE;
use IEEE.STD_LOGIC_1164.all;
USE ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
use IEEE.MATH_REAL.ALL;



entity tb_balanca is

end tb_balanca;

architecture teste of tb_balanca is

component balanca is
port (	
		  CLOCK   : in    std_logic; -- clock input
        S       : in    std_logic; -- control input
        A,B,C,D : in    std_logic; -- data inputs
        Q       : out   std_logic  -- data output
		);
end component;

signal CLK, S, A, B, C, D, Q:  std_logic;

begin
instancia_balanca: balanca port map(CLOCK=>CLK,S=>S,A=>A,B=>B,C=>C,D=>D,Q=>Q);
process
  begin
for i in 1 to 100 loop
      CLK <= '0';
      wait for 5 ns;
      CLK <= '1';
      wait for 5 ns;
    end loop;
	 end process;
S <= '0', '1' after 3 ns, '0' after 23 ns, '1' after 33 ns, '0' after 53 ns, '1' after 83 ns, '0' after 113 ns, '1' after 133 ns, '0' after 163 ns, '1' after 173 ns, '0' after 183 ns, '1' after 188 ns, '0' after 192 ns, '1' after 193 ns;
A <= '1';
B <= '0';
C <= '1';
D <= '0';
end teste;