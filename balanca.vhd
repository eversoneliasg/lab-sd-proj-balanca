-- balanca - A Finite State Machine that mimics the behavior of mux
-- Copyright (C) 2018  Digital Systems Group - UFMG
-- 
-- This program is free software; you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation; either version 3 of the License, or
-- (at your option) any later version.
-- 
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
-- 
-- You should have received a copy of the GNU General Public License
-- along with this program; if not, see <https://www.gnu.org/licenses/>.
--

library ieee;
use ieee.std_logic_1164.all;


entity balanca is
    port (
        CLOCK   : in    std_logic; -- clock input
        S       : in    std_logic; -- control input
        A,B,C,D : in    std_logic; -- data inputs
        Q       : out   std_logic  -- data output
    );
end balanca;

architecture arch of balanca is


	type state_type is (s0, s1, s2, s3);


	signal state : state_type;
	signal new_state: state_type;
	signal botao : boolean;
begin

process(CLOCK,S)
	begin
	if (state /= new_state) then
		botao <= false;
	end if;
	if (CLOCK'EVENT and CLOCK = '1') then
		state <= new_state;
	end if;
	if (S = '0') then 
	 botao <= true;
	end if;
end process;
  
  process(S,state)
  begin

			case state is
				when s0=>
					if S = '1' and botao = true then
						new_state <= s1;
					else
						new_state <= s0;
					end if;

				when s1=>
					if S= '1' and botao = true then
						new_state <= s2;
					else
						new_state <= s1;
					end if;

				when s2=>
					if S= '1' and botao = true then
						new_state <= s3;
					else
						new_state <= s2;
					end if;

				when s3=>
					if S= '1' and botao = true then
						new_state <= s0;
					else

						new_state <= s3;
					end if;

			end case;
		
  end process;
  
  
  process(state, A,B,C,D)
  begin
			case state is
				when s0=>
						Q <= A;
				when s1=>
						Q <= B;
				when s2=>
						Q <= C;
				when s3=>
						Q <= D;
			end case;
  end process;
end arch;
