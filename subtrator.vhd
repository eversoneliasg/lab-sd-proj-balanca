-- Quartus Prime VHDL Template
-- Unsigned Adder/Subtractor

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity subtrator is

	generic(
		W_16	: natural := 16
	);

	port(
		A		: in unsigned (W_16 - 1 downto 0);
		B		: in unsigned (W_16 - 1 downto 0);
		add_sub : in std_logic := '0';
		Output	: out unsigned (W_16 - 1 downto 0)
	);

end entity;

architecture rtl of subtrator is
begin

	process(A,B,add_sub)
	begin
		-- 1 para adição, 0 para subtração
		if (add_sub = '1') then
			Output <= A + B;
		else
			Output <= A - B;
		end if;
	end process;

end rtl;
