library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_arith .all;

entity balanca is
    generic (
        W_16 :	integer := 16;
        W_32 :	integer := 32;
        W_64 :	integer := 64
    );
    port (
        clock         : in  std_logic;
        comando 		 : in  std_logic;

        id   				 : in    std_logic_vector(W_32 - 1 downto 0);
        peso   			 : in    std_logic_vector(W_16 - 1 downto 0);
        peso_permitido   : in    std_logic_vector(W_16 - 1 downto 0);
		  valor_por_kg_excedente  : in std_logic_vector(W_16 - 1 downto 0);
		  
        abertura_fechamento_cancela_1 : in  std_logic;
        abertura_fechamento_cancela_2 : in  std_logic;

        valor_multa      : out std_logic_vector(W_32 - 1 downto 0);
        numero_controle  : out std_logic_vector(W_64 - 1 downto 0);
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
	
	component comparador is
	port (
      A,B    : in  std_logic_vector(W_16 - 1  downto 0); 
      Output : out std_logic
	);
	end component;
	
	component subtrator is
	port (
      CLK    : in  std_logic; 
      A,B    : in  std_logic_vector(W_16 - 1  downto 0); 
      Output : out std_logic_vector(W_16 - 1  downto 0)
	);
	end component;
	
	component multiplicador is
	port (
      CLK    : in  std_logic; 
      A,B    : in  std_logic_vector(W_16 - 1  downto 0); 
      Output : out std_logic_vector(W_16 - 1  downto 0)
	);
	end component;

	signal state 			: state_type;
	signal new_state		: state_type;
	signal botao 			: boolean;
	signal aplicar_multa : std_logic;
	signal tmp_peso_excedente : std_logic_vector(W_16 - 1  downto 0);
	signal tmp_valor_multa    : std_logic_vector(W_16 - 1  downto 0);
	
	signal p1 : signed(W_16 - 1 downto 0);
   signal p2 : signed(W_16 - 1 downto 0);
   signal m  : signed(W_32 - 1 downto 0);

	
begin
  
instancia_comparador: comparador port map(
			A => peso,
			B => peso_permitido, 
			Output => aplicar_multa
	);
	
-- instancia_subtrator: subtrator port map (
-- 			CLK => CLOCK,
-- 			A   => peso,
-- 			B   => peso_permitido, 
-- 			Output => tmp_peso_excedente
-- 	);
-- 	
-- instancia_multiplicador: multiplicador port map (
-- 			CLK => CLOCK,
-- 			A   => tmp_peso_excedente,
-- 			B   => valor_por_kg_excedente, 
-- 			Output => tmp_valor_multa
-- 	);

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
				if comando = '1' 
					and botao = true 
					and abertura_fechamento_cancela_1 = '1' 
					and abertura_fechamento_cancela_2 = '0' 
				then
					new_state <= POSICIONAMENTO;
				else
					new_state <= ENTRADA;
				end if;

			when POSICIONAMENTO =>
				if comando = '1' 
					and botao = true 
					and abertura_fechamento_cancela_1 = '1' 
					and abertura_fechamento_cancela_2 = '0' 
				then
					new_state <= PESAGEM;
				else
					new_state <= POSICIONAMENTO;
				end if;

			when PESAGEM =>
				if comando = '1' 
					and botao = true 
					and abertura_fechamento_cancela_1 = '0' 
					and abertura_fechamento_cancela_2 = '0' 
				then
					new_state <= CALCULO_NORMATIVO;
				else
					new_state <= PESAGEM;
				end if;

			when CALCULO_NORMATIVO =>
				if comando = '1' 
					and botao = true 
					and abertura_fechamento_cancela_1 = '0' 
					and abertura_fechamento_cancela_2 = '0' 
				then
					if aplicar_multa = '1' then
						new_state <= SAIDA;
					else
						new_state <= CALCULO_MULTA;
					end if;
				else
					new_state <= CALCULO_NORMATIVO;
				end if;

			when CALCULO_MULTA =>
				if comando = '1' 
					and botao = true 
					and abertura_fechamento_cancela_1 = '0' 
					and abertura_fechamento_cancela_2 = '0' 
				then
					new_state <= EMISSAO_DOCUMENTO;
				else
					new_state <= CALCULO_MULTA;
				end if;

			when EMISSAO_DOCUMENTO =>
				if comando = '1' 
					and botao = true 
					and abertura_fechamento_cancela_1 = '0' 
					and abertura_fechamento_cancela_2 = '0' 
				then
					new_state <= SAIDA;
				else
					new_state <= EMISSAO_DOCUMENTO;
				end if;

			when SAIDA =>
				if comando = '1' 
					and botao = true 
					and abertura_fechamento_cancela_1 = '0' 
					and abertura_fechamento_cancela_2 = '1' 
				then
					new_state <= REINICIALIZACAO;
				else
					new_state <= SAIDA;
				end if;

			when REINICIALIZACAO =>
				if comando = '1' 
					and botao = true 
					and abertura_fechamento_cancela_1 = '0' 
					and abertura_fechamento_cancela_2 = '0' 
				then
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
				cancela_1  <= '1';
				semaforo_1 <= '0';
				cancela_2  <= '0';
				semaforo_2 <= '0';
			
			when POSICIONAMENTO =>
				cancela_1  <= '0';
				semaforo_1 <= '1';
				cancela_2  <= '0';
				semaforo_2 <= '0';
				
			when PESAGEM =>
				cancela_1  <= '0';
				semaforo_1 <= '0';
				cancela_2  <= '0';
				semaforo_2 <= '0';

			when CALCULO_NORMATIVO =>
				cancela_1  <= '0';
				semaforo_1 <= '0';
				cancela_2  <= '0';
				semaforo_2 <= '0';

			when CALCULO_MULTA =>
				cancela_1  <= '0';
				semaforo_1 <= '0';
				cancela_2  <= '0';
				semaforo_2 <= '0';
				m <= p1 * p2;

			when EMISSAO_DOCUMENTO =>
				cancela_1  <= '0';
				semaforo_1 <= '0';
				cancela_2  <= '0';
				semaforo_2 <= '0';

			when SAIDA =>
				cancela_1  <= '0';
				semaforo_1 <= '0';
				cancela_2  <= '1';
				semaforo_2 <= '0';

			when REINICIALIZACAO =>
				cancela_1  <= '0';
				semaforo_1 <= '0';
				cancela_2  <= '0';
				semaforo_2 <= '1';

		end case;
		
		valor_multa   <= std_logic_vector(m);

end process;
end arch;
