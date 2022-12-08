library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity comparador is
port (
      CLK    : in  std_logic; 
      A,B    : in  std_logic_vector(15 downto 0); 
      Output : out std_logic
 );
end comparador;
architecture Behavioral of comparador is
begin
--  
--  Result <= A(0 ) = '1' and B(0 ) = '0';         
--  Result <= A(1 ) = '1' and B(1 ) = '0'; 
--  Result <= A(2 ) = '1' and B(2 ) = '0'; 
--  Result <= A(3 ) = '1' and B(3 ) = '0'; 
--  Result <= A(4 ) = '1' and B(4 ) = '0'; 
--  Result <= A(5 ) = '1' and B(5 ) = '0'; 
--  Result <= A(6 ) = '1' and B(6 ) = '0'; 
--  Result <= A(7 ) = '1' and B(7 ) = '0'; 
--  Result <= A(8 ) = '1' and B(8 ) = '0'; 
--  Result <= A(9 ) = '1' and B(9 ) = '0'; 
--  Result <= A(10) = '1' and B(10) = '0'; 
--  Result <= A(11) = '1' and B(11) = '0'; 
--  Result <= A(12) = '1' and B(12) = '0'; 
--  Result <= A(13) = '1' and B(13) = '0'; 
--  Result <= A(14) = '1' and B(14) = '0'; 
--  Result <= A(15) = '1' and B(15) = '0'; 
--  Result <= A(16) = '1' and B(16) = '0'; 
--  Result <= A(17) = '1' and B(17) = '0'; 
--  Result <= A(18) = '1' and B(18) = '0'; 
--  Result <= A(19) = '1' and B(19) = '0'; 
--  Result <= A(20) = '1' and B(20) = '0'; 
--  Result <= A(21) = '1' and B(21) = '0'; 
--  Result <= A(22) = '1' and B(22) = '0'; 
--  Result <= A(23) = '1' and B(23) = '0'; 
--  Result <= A(24) = '1' and B(24) = '0'; 
--  Result <= A(25) = '1' and B(25) = '0'; 
--  Result <= A(26) = '1' and B(26) = '0'; 
--  Result <= A(27) = '1' and B(27) = '0'; 
--  Result <= A(28) = '1' and B(28) = '0'; 
--  Result <= A(29) = '1' and B(29) = '0'; 
--  Result <= A(30) = '1' and B(30) = '0'; 
--  Result <= A(31) = '1' and B(31) = '0'; 
--  
--  
--  process(CLK)
--  begin
--  if(rising_edge(CLK))then
--    if(AB = x"FFFFFFFF" and IAB = '0') then         
--             Result <= '0';
--     else
--     Result <= '1';
--     end if;
--  end if;
--  end process;
--  Output <= Result;

	Output <= '1';
end Behavioral;