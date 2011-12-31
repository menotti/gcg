-- Testebench gerado via script.
-- Data: Qua,20/07/2011-13:51:40
-- Autor: rogerio
-- Comentario: Descrição da Entidade: somador.

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
 
entity somador_tb is
end somador_tb;

architecture estrutural of somador_tb is
  --  Declaração do componente.
  component somador
    port(a, b, cin, opSomador:in std_logic; s, cout: out std_logic);
  end component;
  --  Especifica qual a entidade está vinculada com o componente.
  for somador_0: somador use entity work.somador;
      signal t_a, t_b, t_cin, t_opSomador, t_s, t_cout: std_logic;
  begin
    --  Instanciação do Componente.
    somador_0: somador port map (a=>t_a, b=>t_b, cin=>t_cin, opSomador=>t_opSomador, s=>t_s, cout=>t_cout);

    --  Processo que faz o trabalho.
    process
				-- Um registro é criado com as entradas e saídas da entidade.
				type pattern_type is record
					-- entradas.
					vi_a, vi_b, vi_cin, vi_opSomador: std_logic;
					--  saídas.
					vo_s, vo_cout : std_logic;
				end record;

				--  Os padrões de entrada são aplicados (injetados) às entradas.
				type pattern_array is array (natural range <>) of pattern_type;
				constant patterns : pattern_array :=
					(('0', '0', '0', '1', '0', '0'),
					 ('0', '0', '1', '1', '1', '0'),
					 ('0', '1', '0', '1', '1', '0'),
					 ('0', '1', '1', '1', '0', '1'),
					 ('1', '0', '0', '1', '1', '0'),
 					 ('1', '0', '1', '1', '0', '1'),
					 ('1', '1', '0', '1', '0', '1'),
					 ('1', '1', '1', '1', '1', '1'),
					 ('1', '1', '1', '0', '0', '0')
					);
					begin
						--  Checagem de padrões.
						for i in patterns'range loop
							--  Injeta as entradas.
							t_a <= patterns(i).vi_a;
							t_b <= patterns(i).vi_b;
							t_cin <= patterns(i).vi_cin;
							t_opSomador <= patterns(i).vi_opSomador;
							--  Aguarda os resultados.
							wait for 1 ns;
							--  Checa o resultado com a saída esperada no padrão.
							assert t_s = patterns(i).vo_s
								report "Valor de t_s não confere com o resultado esperado." severity error;
							assert t_cout = patterns(i).vo_cout
								report "Valor de t_cout não confere com o resultado esperado."severity error;
						end loop;
						assert false report "Fim do teste." severity note;
						--  Wait forever; Isto finaliza a simulação.
						wait;
		end process;
end estrutural;
