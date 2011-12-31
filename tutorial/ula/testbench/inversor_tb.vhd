-- Testebench gerado via script.
-- Data: Sex,30/12/2011-23:36:18
-- Autor: rogerio
-- Comentario: Teste da entidade inversor.
 
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity inversor_tb is
end inversor_tb;

architecture logica of inversor_tb is
  --  Declaração do componente.
  component inversor
	port (a: in std_logic; y: out std_logic);
  end component;
  --  Especifica qual a entidade está vinculada com o componente.
  for inversor_0: inversor use entity work.inversor;
      signal s_t_a, s_t_y: std_logic;
  begin
    --  Instanciação do Componente.
	--  port map (<<p_in_1>> => <<s_t_in_1>>)
	inversor_0: inversor port map ( a=>s_t_a, y=>s_t_y);

    --  Processo que faz o trabalho.
    process
		-- Um registro é criado com as entradas e saídas da entidade.
		-- (<<entrada1>>, <<entradaN>>, <<saida1>>, <<saidaN>>)
		type pattern_type is record
			-- entradas.
			 vi_a: std_logic;
			-- saídas.
			 vo_y: std_logic;
		end record;

		--  Os padrões de entrada que são aplicados (injetados) às entradas.
		type pattern_array is array (natural range <>) of pattern_type;
		-- Casos de teste.
		constant patterns : pattern_array :=
		(
			('0', '1'),
			('1', '0'),
			('0', '1'),
			('0', '1'),
			('1', '0'),
			('1', '0')
		);
		begin
		--  Checagem de padrões.
		for i in patterns'range loop
			--  Injeta as entradas.
			s_t_a <= patterns(i).vi_a;
			
			--  Aguarda os resultados.
			wait for 1 ns;
			--  Checa o resultado com a saída esperada no padrão.
			assert s_t_y = patterns(i).vo_y	report "Valor de s_t_y não confere com o resultado esperado." severity error;
			
		end loop;
		assert false report "Fim do teste." severity note;
		--  Wait forever; Isto finaliza a simulação.
		wait;
	end process;
end logica;
