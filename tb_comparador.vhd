library IEEE;

use IEEE.std_logic_1164.ALL;
use IEEE.std_logic_ARITH.ALL;
use IEEE.std_logic_UNSIGNED.ALL;

ENTITY tb_comparador IS
generic(
		W_16 : natural := 16
);
END tb_comparador;

ARCHITECTURE teste OF tb_comparador IS
   COMPONENT comparador IS
   port(   
		A : in std_logic_vector((W_16-1) downto 0);
      B : in std_logic_vector((W_16-1) downto 0);
      output : out std_logic
   );
   END COMPONENT;

   SIGNAL a : std_logic_vector((W_16-1) downto 0);
   SIGNAL b : std_logic_vector((W_16-1) downto 0);
   SIGNAL c : std_logic;

BEGIN
    uut : comparador port map(a, b, c);
    a <= "0000000000000001", "0000000000000111" after 20 ns, "0000000000000110" after 40 ns, "0000000000001100" after 60 ns, "0000000000010100" after 70 ns;
	 b <= "0000000000000000", "0000000000000011" after 20 ns, "0000000000000010" after 40 ns, "0000000000000100" after 60 ns, "0000000000000100" after 70 ns;
END teste;