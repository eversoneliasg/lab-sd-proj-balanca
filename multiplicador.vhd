library ieee;
use IEEE.STD_LOGIC_1164.all;
USE ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
use IEEE.MATH_REAL.ALL;

entity multiplicador is

	generic(
		W_16 : natural := 16
	);

   port( 
		A	    : in unsigned (W_16 - 1 downto 0);
		B	    : in unsigned (W_16 - 1 downto 0);
		Output : out unsigned (2 * W_16 - 1 downto 0)
	); 

end entity;

architecture rtl of multiplicador is
begin

	Output <= A * B;

end rtl;
