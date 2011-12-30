-- Testebench gerado via script.
-- Data: Qua,20/07/2011-13:51:40
-- Autor: rogerio
-- Comentario: Teste da entidade and3.
 
entity and3_tb is
end and3_tb;

architecture logica of and3_tb is
  --  Declaração do componente.
  component and3
    	port (a,b,c: in <<type>>; y: out <<type>>);
  end component;
  --  Especifica qual a entidade está vinculada com o componente.
  for and3_0: and3 use entity work.and3;
      signal s_t_a, s_t_b, s_t_c, s_t_y: <<type>>;
  begin
    --  Instanciação do Componente.
		--  port map (<<p_in_1>> => <<s_t_in_1>>)
	  and3_0: and3 port map (a=>s_t_a,b=>s_t_b,c=>s_t_c,y=>s_t_y);

    --  Processo que faz o trabalho.
    process
				-- Um registro é criado com as entradas e saídas da entidade.
				-- (<<entrada1>>, <<entradaN>>, <<saida1>>, <<saidaN>>)
				type pattern_type is record
					-- entradas.
					vi_a,vi_b,vi_c: <<type>>;
					-- saídas.
					vo_y: <<type>>;
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
						s_t_a <= patterns(i).vi_a;
						s_t_b <= patterns(i).vi_b;
						s_t_c <= patterns(i).vi_c;
						
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
