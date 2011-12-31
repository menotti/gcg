-- Testebench gerado via script.
-- Data: Sáb,31/12/2011-01:39:29
-- Autor: rogerio
-- Comentario: Teste da entidade unidadeLogica.
 
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity unidadeLogica_tb is
end unidadeLogica_tb;

architecture estrutural of unidadeLogica_tb is
  --  Declaração do componente.
  component unidadeLogica
	port (A, B, OpAND, OpOR, OpNAND, OpNOR, OpXOR, OpXNOR, OpNOT: in <<type>>; S: out <<type>>);
  end component;
  --  Especifica qual a entidade está vinculada com o componente.
  for unidadeLogica_0: unidadeLogica use entity work.unidadeLogica;
      signal s_t_A, s_t_B, s_t_OpAND, s_t_OpOR, s_t_OpNAND, s_t_OpNOR, s_t_OpXOR, s_t_OpXNOR, s_t_OpNOT, s_t_S: <<type>>;
  begin
    --  Instanciação do Componente.
	--  port map (<<p_in_1>> => <<s_t_in_1>>)
	unidadeLogica_0: unidadeLogica port map ( A=>s_t_A, B=>s_t_B, OpAND=>s_t_OpAND, OpOR=>s_t_OpOR, OpNAND=>s_t_OpNAND, OpNOR=>s_t_OpNOR, OpXOR=>s_t_OpXOR, OpXNOR=>s_t_OpXNOR, OpNOT=>s_t_OpNOT, S=>s_t_S);

    --  Processo que faz o trabalho.
    process
		-- Um registro é criado com as entradas e saídas da entidade.
		-- (<<entrada1>>, <<entradaN>>, <<saida1>>, <<saidaN>>)
		type pattern_type is record
			-- entradas.
			 vi_A, vi_B, vi_OpAND, vi_OpOR, vi_OpNAND, vi_OpNOR, vi_OpXOR, vi_OpXNOR, vi_OpNOT: <<type>>;
			-- saídas.
			 vo_S: <<type>>;
		end record;

		--  Os padrões de entrada que são aplicados (injetados) às entradas.
		type pattern_array is array (natural range <>) of pattern_type;
		-- Casos de teste.
		constant patterns : pattern_array :=
		(
			(casos de testes com 10 colunas, '0'...),
			(...)
		);
		begin
		--  Checagem de padrões.
		for i in patterns'range loop
			--  Injeta as entradas.
			s_t_A <= patterns(i).vi_A;
			s_t_B <= patterns(i).vi_B;
			s_t_OpAND <= patterns(i).vi_OpAND;
			s_t_OpOR <= patterns(i).vi_OpOR;
			s_t_OpNAND <= patterns(i).vi_OpNAND;
			s_t_OpNOR <= patterns(i).vi_OpNOR;
			s_t_OpXOR <= patterns(i).vi_OpXOR;
			s_t_OpXNOR <= patterns(i).vi_OpXNOR;
			s_t_OpNOT <= patterns(i).vi_OpNOT;
			
			--  Aguarda os resultados.
			wait for 1 ns;
			--  Checa o resultado com a saída esperada no padrão.
			assert s_t_S = patterns(i).vo_S	report "Valor de s_t_S não confere com o resultado esperado." severity error;
			
		end loop;
		assert false report "Fim do teste." severity note;
		--  Wait forever; Isto finaliza a simulação.
		wait;
	end process;
end estrutural;
