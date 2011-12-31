-- Testebench gerado via script.
-- Data: Sáb,31/12/2011-00:58:50
-- Autor: rogerio
-- Comentario: Teste da entidade decodificador.
 
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity decodificador_tb is
end decodificador_tb;

architecture estrutural of decodificador_tb is
  --  Declaração do componente.
  component decodificador
	port (F2, F1, F0: in std_logic; Op0, Op1, Op2, Op3, Op4, Op5, Op6, Op7: out std_logic);
  end component;
  --  Especifica qual a entidade está vinculada com o componente.
  for decodificador_0: decodificador use entity work.decodificador;
      signal s_t_F2, s_t_F1, s_t_F0, s_t_Op0, s_t_Op1, s_t_Op2, s_t_Op3, s_t_Op4, s_t_Op5, s_t_Op6, s_t_Op7: std_logic;
  begin
    --  Instanciação do Componente.
	--  port map (<<p_in_1>> => <<s_t_in_1>>)
	decodificador_0: decodificador port map ( F2=>s_t_F2, F1=>s_t_F1, F0=>s_t_F0, Op0=>s_t_Op0, Op1=>s_t_Op1, Op2=>s_t_Op2, Op3=>s_t_Op3, Op4=>s_t_Op4, Op5=>s_t_Op5, Op6=>s_t_Op6, Op7=>s_t_Op7);

    --  Processo que faz o trabalho.
    process
		-- Um registro é criado com as entradas e saídas da entidade.
		-- (<<entrada1>>, <<entradaN>>, <<saida1>>, <<saidaN>>)
		type pattern_type is record
			-- entradas.
			 vi_F2, vi_F1, vi_F0: std_logic;
			-- saídas.
			 vo_Op0, vo_Op1, vo_Op2, vo_Op3, vo_Op4, vo_Op5, vo_Op6, vo_Op7: std_logic;
		end record;

		--  Os padrões de entrada que são aplicados (injetados) às entradas.
		type pattern_array is array (natural range <>) of pattern_type;
		-- Casos de teste.
		constant patterns : pattern_array :=
		(
			('0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
			('0', '0', '1', '0', '1', '0', '0', '0', '0', '0', '0'),
			('0', '1', '0', '0', '0', '1', '0', '0', '0', '0', '0'),
			('0', '1', '1', '0', '0', '0', '1', '0', '0', '0', '0'),
			('1', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0'),
			('1', '0', '1', '0', '0', '0', '0', '0', '1', '0', '0'),
			('1', '1', '0', '0', '0', '0', '0', '0', '0', '1', '0'),
			('1', '1', '1', '0', '0', '0', '0', '0', '0', '0', '1')
		);
		begin
		--  Checagem de padrões.
		for i in patterns'range loop
			--  Injeta as entradas.
			s_t_F2 <= patterns(i).vi_F2;
			s_t_F1 <= patterns(i).vi_F1;
			s_t_F0 <= patterns(i).vi_F0;
			
			--  Aguarda os resultados.
			wait for 1 ns;
			--  Checa o resultado com a saída esperada no padrão.
			assert s_t_Op0 = patterns(i).vo_Op0	report "Valor de s_t_Op0 não confere com o resultado esperado." severity error;
			assert s_t_Op1 = patterns(i).vo_Op1	report "Valor de s_t_Op1 não confere com o resultado esperado." severity error;
			assert s_t_Op2 = patterns(i).vo_Op2	report "Valor de s_t_Op2 não confere com o resultado esperado." severity error;
			assert s_t_Op3 = patterns(i).vo_Op3	report "Valor de s_t_Op3 não confere com o resultado esperado." severity error;
			assert s_t_Op4 = patterns(i).vo_Op4	report "Valor de s_t_Op4 não confere com o resultado esperado." severity error;
			assert s_t_Op5 = patterns(i).vo_Op5	report "Valor de s_t_Op5 não confere com o resultado esperado." severity error;
			assert s_t_Op6 = patterns(i).vo_Op6	report "Valor de s_t_Op6 não confere com o resultado esperado." severity error;
			assert s_t_Op7 = patterns(i).vo_Op7	report "Valor de s_t_Op7 não confere com o resultado esperado." severity error;
			
		end loop;
		assert false report "Fim do teste." severity note;
		--  Wait forever; Isto finaliza a simulação.
		wait;
	end process;
end estrutural;
