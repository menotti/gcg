library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity <<ENTITY_NAME>>_tb is
end <<ENTITY_NAME>>_tb;

architecture <<ARCH_TYPE>> of <<ENTITY_NAME>>_tb is
  --  Component declaration.
  component <<ENTITY_NAME>>
	port (<<IN_P>>: in <<type>>; <<OUT_P>>: out <<type>>);
  end component;
  --  Specifies the entity which is linked with the component. (Especifica qual a entidade está vinculada com o componente).
  for <<ENTITY_NAME>>_0: <<ENTITY_NAME>> use entity work.<<ENTITY_NAME>>;
      signal <<s_t_sinais>>: <<type>>;
  begin
    --  Component instantiation.
	--  port map (<<p_in_1>> => <<s_t_in_1>>)
	<<ENTITY_NAME>>_0: <<ENTITY_NAME>> port map (<<port_map_entity_tb>>);

    --  Process that works.
    process
		-- A record is created with the inputs and outputs of the entity.
		-- (<<entrada1>>, <<entradaN>>, <<saida1>>, <<saidaN>>)
		type pattern_type is record
			-- inputs.
			<<record_in_vars>>: <<type>>;
			-- outputs.
			<<record_out_vars>>: <<type>>;
		end record;

		--  The input patterns are applied (injected) to the inputs of the entity under test.
		type pattern_array is array (natural range <>) of pattern_type;
		-- Test cases.
		constant patterns : pattern_array :=
		(
			(test cases with <<case_test_model>> columns, '0'...),
			(...)
		);
		begin
		-- Injects the inputs and check thte outputs.
		for i in patterns'range loop
			-- Injects the inputs.
			<<inputs_signals_injection>>
			-- wait for results.
			wait for 1 ns;
			-- Checks the result with the expected output in the pattern.
			<<asserts_vars>>
		end loop;
		assert false report "End of test." severity note;
		--  Wait forever; Isto finaliza a simulação.
		wait;
	end process;
end <<ARCH_TYPE>>;
