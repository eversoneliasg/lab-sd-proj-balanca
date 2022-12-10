library ieee;
use IEEE.STD_LOGIC_1164.all;
USE ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
use IEEE.MATH_REAL.ALL;

entity tb_subtrator is
generic
	(
		W_16 : natural := 16
	);

end tb_subtrator;

architecture teste of tb_subtrator is

component subtrator is
    port ( A		: in unsigned (W_16 - 1 downto 0);
			  B		: in unsigned (W_16 - 1 downto 0);
			  Output	: out unsigned (W_16 - 1 downto 0));
end component;

signal X, Y  : unsigned (W_16 - 1 downto 0);
signal S     : unsigned (W_16 - 1 downto 0);

begin
instancia_subtrator: subtrator port map(A => X, B => Y, Output => S);
X <= "0000000000000001", "0000000000000111" after 20 ns, "0000000000000110" after 40 ns, "0000000000001100" after 60 ns, "0000000000010100" after 70 ns;
Y <= "0000000000000000", "0000000000000011" after 20 ns, "0000000000000010" after 40 ns, "0000000000000100" after 60 ns, "0000000000000100" after 70 ns;


end teste;