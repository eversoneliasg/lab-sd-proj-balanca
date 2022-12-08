library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity multiplicador is
port (
      CLK    : in  std_logic; 
      A,B    : in  std_logic_vector(15 downto 0); 
      Output : out std_logic_vector(15 downto 0)
 );
end multiplicador;
architecture Behavioral of multiplicador is
 begin

 output <= "0000111100001111";
 
end Behavioral;