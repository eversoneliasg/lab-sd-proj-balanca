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
        clock         : in  std_logic;
        comando 		 : in  std_logic;
		  aplicar_multa : in  std_logic;
        A,B,C,D       : in  std_logic;
        Q             : out std_logic 
    );
end balanca;

architecture arch of balanca is

	type state_type is (
		ENTRADA, 
		POSICIONAMENTO, 
		PESAGEM, 
		CALCULO_NORMATIVO, 
		CALCULO_MULTA, 
		EMISSAO_DOCUMENTO, 
		SAIDA,
		REINICIALIZACAO
	);

	signal state 			: state_type;
	signal new_state		: state_type;
	signal botao 			: boolean;

begin

process(clock,comando)
	begin
	if (state /= new_state) then
		botao <= false;
	end if;
	if (clock'EVENT and clock = '1') then
		state <= new_state;
	end if;
	if (comando = '0') then 
	 botao <= true;
	end if;
end process;
  
process(comando,state)
  begin

		case state is
			when ENTRADA =>
				if comando = '1' and botao = true then
					new_state <= POSICIONAMENTO;
				else
					new_state <= ENTRADA;
				end if;

			when POSICIONAMENTO =>
				if comando = '1' and botao = true then
					new_state <= PESAGEM;
				else
					new_state <= POSICIONAMENTO;
				end if;

			when PESAGEM =>
				if comando = '1' and botao = true then
					new_state <= CALCULO_NORMATIVO;
				else
					new_state <= PESAGEM;
				end if;

			when CALCULO_NORMATIVO =>
				if comando = '1' and botao = true then
					if aplicar_multa = '0' then
						new_state <= SAIDA;
					else
						new_state <= CALCULO_MULTA;
					end if;
				else
					new_state <= CALCULO_NORMATIVO;
				end if;

			when CALCULO_MULTA =>
				if comando = '1' and botao = true then
					new_state <= EMISSAO_DOCUMENTO;
				else
					new_state <= CALCULO_MULTA;
				end if;

			when EMISSAO_DOCUMENTO =>
				if comando = '1' and botao = true then
					new_state <= SAIDA;
				else
					new_state <= EMISSAO_DOCUMENTO;
				end if;

			when SAIDA =>
				if comando = '1' and botao = true then
					new_state <= REINICIALIZACAO;
				else
					new_state <= SAIDA;
				end if;

			when REINICIALIZACAO =>
				if comando = '1' and botao = true then
					new_state <= ENTRADA;
				else
					new_state <= REINICIALIZACAO;
				end if;

		end case;
	
end process;
  
  
process(state, A,B,C,D)
  begin
		case state is
		
			when ENTRADA =>
				-- Processo ENTRADA

			when POSICIONAMENTO =>
				-- Processo POSICIONAMENTO

			when PESAGEM =>
				-- Processo PESAGEM

			when CALCULO_NORMATIVO =>
				-- Processo CALCULO_NORMATIVO

			when CALCULO_MULTA =>
				-- Processo CALCULO_MULTA

			when EMISSAO_DOCUMENTO =>
				-- Processo EMISSAO_DOCUMENTO

			when SAIDA =>
				-- Processo SAIDA

			when REINICIALIZACAO =>
				-- Processo REINICIALIZACAO

		end case;
end process;

end arch;
