library IEEE;

use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY tb_comparador IS
generic
	(
		DATA_WIDTH : natural := 16
	);
END tb_comparador;

ARCHITECTURE teste OF tb_comparador IS
    COMPONENT comparador IS
        port(   A:IN STD_LOGIC_VECTOR((DATA_WIDTH-1) DOWNTO 0);
                B:IN STD_LOGIC_VECTOR((DATA_WIDTH-1) DOWNTO 0);
                output:OUT STD_LOGIC
        );
    END COMPONENT;

    SIGNAL a : STD_LOGIC_VECTOR((DATA_WIDTH-1) DOWNTO 0);
    SIGNAL b : STD_LOGIC_VECTOR((DATA_WIDTH-1) DOWNTO 0);
    SIGNAL c : STD_LOGIC;
BEGIN
    uut : comparador PORT MAP(a, b , c);
    a <= "0000000000000001", "0000000000000111" after 20 ns, "0000000000000110" after 40 ns, "0000000000001100" after 60 ns, "0000000000010100" after 70 ns;
	 b <= "0000000000000000", "0000000000000011" after 20 ns, "0000000000000010" after 40 ns, "0000000000000100" after 60 ns, "0000000000000100" after 70 ns;
END teste;