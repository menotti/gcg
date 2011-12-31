-- Testebench gerado via script.
-- Data: Sex,30/12/2011-22:26:46
-- Autor: rogerio
-- Comentario: Teste da entidade or2.
 
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity or2_tb is
end or2_tb;

architecture logic of or2_tb is
  --  Declaração do componente.
  component or2
	port (x, y: in std_logic; z: out std_logic);
  end component;
  --  Especifica qual a entidade está vinculada com o componente.
  for or2_0: or2 use entity work.or2;
      signal s_t_x, s_t_y, s_t_z: std_logic;
  begin
    --  Instanciação do Componente.
	--  port map (<<p_in_1>> => <<s_t_in_1>>)
	or2_0: or2 port map ( x=>s_t_x, y=>s_t_y, z=>s_t_z);

    --  Processo que faz o trabalho.
    process
		-- Um registro é criado com as entradas e saídas da entidade.
		-- (<<entrada1>>, <<entradaN>>, <<saida1>>, <<saidaN>>)
		type pattern_type is record
			-- entradas.
			 vi_x, vi_y: std_logic;
			-- saídas.
			 vo_z: std_logic;
		end record;

		--  Os padrões de entrada que são aplicados (injetados) às entradas.
		type pattern_array is array (natural range <>) of pattern_type;
		-- Casos de teste.
		constant patterns : pattern_array :=
		(
			('0','0','0'),
			('0','1','1'),
			('1','0','1'),
			('1','1','1')
		);
		begin
		--  Checagem de padrões.
		for i in patterns'range loop
			--  Injeta as entradas.
			s_t_x <= patterns(i).vi_x;
			s_t_y <= patterns(i).vi_y;
			
			--  Aguarda os resultados.
			wait for 1 ns;
			--  Checa o resultado com a saída esperada no padrão.
			assert s_t_z = patterns(i).vo_z	report "Valor de s_t_z não confere com o resultado esperado." severity error;
			
		end loop;
		assert false report "Fim do teste." severity note;
		--  Wait forever; Isto finaliza a simulação.
		wait;
	end process;
end logic;
