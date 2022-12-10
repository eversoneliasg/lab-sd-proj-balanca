library IEEE;

use IEEE.STD_LOGIC_1164.all;
USE ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
use IEEE.MATH_REAL.ALL;

ENTITY tb_comparador IS
generic(
		W_16 : natural := 16
);
END tb_comparador;

ARCHITECTURE teste OF tb_comparador IS
   COMPONENT comparador IS
   port(   
		A : in unsigned((W_16-1) downto 0);
      B : in unsigned((W_16-1) downto 0);
      output : out std_logic
   );
   END COMPONENT;

   SIGNAL a : unsigned((W_16-1) downto 0);
   SIGNAL b : unsigned((W_16-1) downto 0);
   SIGNAL c : std_logic;

BEGIN
    uut : comparador port map(a, b, c);
    a <= "0000000000000001", "0000000000000111" after 20 ns, "0000000000000110" after 40 ns, "0000000000001100" after 60 ns, "0000000000010100" after 70 ns;
	 b <= "0000000000000000", "0000000000000011" after 20 ns, "0000000000000010" after 40 ns, "0000000000000100" after 60 ns, "0000000000000100" after 70 ns;
END teste;