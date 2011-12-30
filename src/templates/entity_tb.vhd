library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity <<ENTITY_NAME>>_tb is
end <<ENTITY_NAME>>_tb;

architecture <<ARCH_TYPE>> of <<ENTITY_NAME>>_tb is
  --  Declaração do componente.
  component <<ENTITY_NAME>>
	port (<<IN_P>>: in <<type>>; <<OUT_P>>: out <<type>>);
  end component;
  --  Especifica qual a entidade está vinculada com o componente.
  for <<ENTITY_NAME>>_0: <<ENTITY_NAME>> use entity work.<<ENTITY_NAME>>;
      signal <<s_t_sinais>>: <<type>>;
  begin
    --  Instanciação do Componente.
	--  port map (<<p_in_1>> => <<s_t_in_1>>)
	<<ENTITY_NAME>>_0: <<ENTITY_NAME>> port map (<<port_map_entity_tb>>);

    --  Processo que faz o trabalho.
    process
		-- Um registro é criado com as entradas e saídas da entidade.
		-- (<<entrada1>>, <<entradaN>>, <<saida1>>, <<saidaN>>)
		type pattern_type is record
			-- entradas.
			<<record_in_vars>>: <<type>>;
			-- saídas.
			<<record_out_vars>>: <<type>>;
		end record;

		--  Os padrões de entrada que são aplicados (injetados) às entradas.
		type pattern_array is array (natural range <>) of pattern_type;
		-- Casos de teste.
		constant patterns : pattern_array :=
		(
			(casos de testes com <<case_test_model>> colunas, '0'...),
			(...)
		);
		begin
		--  Checagem de padrões.
		for i in patterns'range loop
			--  Injeta as entradas.
			<<inputs_signals_injection>>
			--  Aguarda os resultados.
			wait for 1 ns;
			--  Checa o resultado com a saída esperada no padrão.
			<<asserts_vars>>
		end loop;
		assert false report "Fim do teste." severity note;
		--  Wait forever; Isto finaliza a simulação.
		wait;
	end process;
end <<ARCH_TYPE>>;
