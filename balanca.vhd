library ieee;
use ieee.std_logic_1164.all;


entity balanca is
    generic (
        W_16 :	integer := 16;
        W_32 :	integer := 32;
        W_64 :	integer := 64
    );
    port (
        clock         : in  std_logic;
        comando 		 : in  std_logic;
		  aplicar_multa : in  std_logic;

        id   				 : in    std_logic_vector(W_32 - 1 downto 0);
        peso   			 : in    std_logic_vector(W_16 - 1 downto 0);
        peso_permitido   : in    std_logic_vector(W_16 - 1 downto 0);
        abertura_fechamento_cancela_1 : in  std_logic;
        abertura_fechamento_cancela_2 : in  std_logic;

        valor_multa      : out   std_logic_vector(W_32 - 1 downto 0);
        numero_controle  : out   std_logic_vector(W_64 - 1 downto 0);
        semaforo_1 		 : out std_logic;
        semaforo_2 		 : out std_logic;
        cancela_1  		 : out std_logic;
        cancela_2  		 : out std_logic

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
  
  
process(state)
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
