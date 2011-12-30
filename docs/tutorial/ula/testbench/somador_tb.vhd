-- Testebench gerado via script.
-- Data: Qua,20/07/2011-14:52:39
-- Autor: rogerio
-- Comentario: Teste da entidade somador.
 

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity somador_tb is
end somador_tb;

architecture estrutural of somador_tb is
  --  Declaração do componente.
  component somador
    	port (A,B,Cin,OpSomador: in <<type>>; S,Cout: out <<type>>);
  end component;
  --  Especifica qual a entidade está vinculada com o componente.
  for somador_0: somador use entity work.somador;
      signal s_t_A, s_t_B, s_t_Cin, s_t_OpSomador, s_t_S, s_t_Cout: <<type>>;
  begin
    --  Instanciação do Componente.
		--  port map (<<p_in_1>> => <<s_t_in_1>>)
	  somador_0: somador port map (A=>s_t_A,B=>s_t_B,Cin=>s_t_Cin,OpSomador=>s_t_OpSomador,S=>s_t_S,Cout=>s_t_Cout);

    --  Processo que faz o trabalho.
    process
				-- Um registro é criado com as entradas e saídas da entidade.
				-- (<<entrada1>>, <<entradaN>>, <<saida1>>, <<saidaN>>)
				type pattern_type is record
					-- entradas.
					vi_A,vi_B,vi_Cin,vi_OpSomador: <<type>>;
					-- saídas.
					vo_S,vo_Cout: <<type>>;
				end record;

				--  Os padrões de entrada são aplicados (injetados) às entradas.
				type pattern_array is array (natural range <>) of pattern_type;
				constant patterns : pattern_array :=
					(
						('0', '0', '0', '0'),
						('0', '0', '1', '0')
					);
				begin
					--  Checagem de padrões.
					for i in patterns'range loop
						--  Injeta as entradas.
						s_t_A <= patterns(i).vi_A;
						s_t_B <= patterns(i).vi_B;
						s_t_Cin <= patterns(i).vi_Cin;
						s_t_OpSomador <= patterns(i).vi_OpSomador;
						
						--  Aguarda os resultados.
						wait for 1 ns;
						--  Checa o resultado com a saída esperada no padrão.
						assert s_t_S = patterns(i).vo_S	report "Valor de s_t_S não confere com o resultado esperado." severity error;
						assert s_t_Cout = patterns(i).vo_Cout	report "Valor de s_t_Cout não confere com o resultado esperado." severity error;
						
					end loop;
					assert false report "Fim do teste." severity note;
					--  Wait forever; Isto finaliza a simulação.
					wait;
		end process;
end estrutural;
