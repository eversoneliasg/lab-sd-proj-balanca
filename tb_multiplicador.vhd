library ieee;
use IEEE.STD_LOGIC_1164.all;
USE ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
use IEEE.MATH_REAL.ALL;

entity tb_multiplicador is
generic
	(
		W_16 : natural := 16
	);

end tb_multiplicador;

architecture teste of tb_multiplicador is

component multiplicador is
    port ( 
				A	    : in unsigned (W_16 - 1 downto 0);
				B	    : in unsigned (W_16 - 1 downto 0);
				Output : out unsigned (2 * W_16 - 1 downto 0)
			); 
end component;

signal X, Y  : unsigned (W_16 - 1 downto 0);
signal S  	 : unsigned (2 * W_16 - 1 downto 0);

begin
instancia_multiplicador: multiplicador port map(A => X, B => Y, Output => S);
X <= "0000000000000000", "0000000000000011" after 20 ns, "0000000000000010" after 40 ns, "0000000000000100" after 60 ns, "0000000000000100" after 70 ns;
Y <= "0000000000000000", "0000000000000011" after 20 ns, "0000000000000010" after 40 ns, "0000000000000100" after 60 ns, "0000000000000100" after 70 ns;

end teste;