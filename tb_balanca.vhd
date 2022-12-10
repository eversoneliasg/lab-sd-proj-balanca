library IEEE;
use IEEE.STD_LOGIC_1164.all;
USE ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
use IEEE.MATH_REAL.ALL;

entity tb_balanca is
 generic (
        W_16 :	integer := 16
    );
end tb_balanca;

architecture teste of tb_balanca is

component balanca is
    port (
        clock         : in  std_logic;
        comando 		 : in  std_logic;
        id   				 : in    std_logic_vector(2 * W_16 - 1 downto 0);
        peso   			 : in    unsigned(W_16 - 1 downto 0);
        peso_permitido   : in    unsigned(W_16 - 1 downto 0);
		  valor_por_kg_excedente  : in unsigned(W_16 - 1 downto 0);
        abertura_fechamento_cancela_1 : in  std_logic;
        abertura_fechamento_cancela_2 : in  std_logic;
        valor_multa      : out unsigned(2 * W_16 - 1 downto 0);
        numero_controle  : out std_logic_vector(4 * W_16 - 1 downto 0);
        semaforo_1 		 : out std_logic;
        semaforo_2 		 : out std_logic;
        cancela_1  		 : out std_logic;
        cancela_2  		 : out std_logic

    );

end component;


signal clk        : std_logic;
signal comando		: std_logic;
signal id   	 	: std_logic_vector(2 * W_16 - 1 downto 0);
signal peso   		: unsigned(W_16 - 1 downto 0);
signal peso_permitido : unsigned(W_16 - 1 downto 0);
signal valor_por_kg_excedente : unsigned(W_16 - 1 downto 0);
signal abertura_fechamento_cancela_1 : std_logic;
signal abertura_fechamento_cancela_2 : std_logic;
signal valor_multa      : unsigned(2 * W_16 - 1 downto 0);
signal numero_controle  : std_logic_vector(4 * W_16 - 1 downto 0);
signal semaforo_1 		: std_logic;
signal semaforo_2 		: std_logic;
signal cancela_1  		: std_logic;
signal cancela_2  		: std_logic;


begin

instancia_balanca: balanca port map(
	clock	  			=> CLK,
   comando 			=> COMANDO,
   id      			=> ID,
   peso    			=> PESO,
   peso_permitido => PESO_PERMITIDO,
	valor_por_kg_excedente 			=> VALOR_POR_KG_EXCEDENTE,
   abertura_fechamento_cancela_1 => ABERTURA_FECHAMENTO_CANCELA_1,
   abertura_fechamento_cancela_2 => ABERTURA_FECHAMENTO_CANCELA_2,
   valor_multa     => VALOR_MULTA,
   numero_controle => NUMERO_CONTROLE,
   semaforo_1 		 => SEMAFORO_1,
   semaforo_2 		 => SEMAFORO_2,
   cancela_1  		 => CANCELA_1,
   cancela_2		 => CANCELA_2
);

process
begin
	for i in 1 to 1000 loop
      CLK <= '0';
      wait for 5 ns;
      CLK <= '1';
      wait for 5 ns;
    end loop;
end process;
process
begin
	for i in 1 to 1000 loop
      COMANDO <= '0';
      wait for 100 ns;
      COMANDO <= '1';
      wait for 20 ns;
    end loop;
end process;

abertura_fechamento_cancela_1 <= '0', '1' after 200 ns;

-- COMANDO <= '0', '1' after 3 ns, '0' after 23 ns, '1' after 33 ns, '0' after 53 ns, '1' after 83 ns, '0' after 113 ns, '1' after 133 ns, '0' after 163 ns, '1' after 173 ns, '0' after 183 ns, '1' after 188 ns, '0' after 192 ns, '1' after 193 ns;



-- A <= '1';
-- B <= '0';
-- C <= '1';
-- D <= '0';
end teste;