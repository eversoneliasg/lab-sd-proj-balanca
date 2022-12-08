library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity subtrator is
port (
      CLK    : in  std_logic; 
      A,B    : in  std_logic_vector(15 downto 0); 
      Output : out std_logic_vector(15 downto 0)
 );
end subtrator;
architecture Behavioral of subtrator is
 begin

 Output <= "0000111100001111";
 
end Behavioral;