-- Testebench gerado via script.
-- Data: Qua,20/07/2011-13:51:42
-- Autor: rogerio
-- Comentario: Teste da entidade xor2.

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity xor2_tb is
end xor2_tb;

architecture logica of xor2_tb is
  --  Declaração do componente.
  component xor2
    	port (a,b: in std_logic; y: out std_logic);
  end component;
  --  Especifica qual a entidade está vinculada com o componente.
  for xor2_0: xor2 use entity work.xor2;
      signal s_t_a, s_t_b, s_t_y: std_logic;
  begin
    --  Instanciação do Componente.
		--  port map (<<p_in_1>> => <<s_t_in_1>>)
	  xor2_0: xor2 port map (a=>s_t_a,b=>s_t_b,y=>s_t_y);

    --  Processo que faz o trabalho.
    process
				-- Um registro é criado com as entradas e saídas da entidade.
				-- (<<entrada1>>, <<entradaN>>, <<saida1>>, <<saidaN>>)
				type pattern_type is record
					-- entradas.
					vi_a, vi_b: std_logic;
					-- saídas.
					vo_y: std_logic;
				end record;

				--  Os padrões de entrada são aplicados (injetados) às entradas.
				type pattern_array is array (natural range <>) of pattern_type;
				constant patterns : pattern_array :=
					(
						('0', '0', '0'),
						('0', '1', '1'),
						('1', '0', '1'),
						('1', '1', '0')
					);
				begin
					--  Checagem de padrões.
					for i in patterns'range loop
						--  Injeta as entradas.
						s_t_a <= patterns(i).vi_a;
						s_t_b <= patterns(i).vi_b;
						
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
