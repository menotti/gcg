library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

-- print messages.
use std.textio.all;
use ieee.std_logic_textio.all;

entity <<ENTITY_NAME>>_tb is
end <<ENTITY_NAME>>_tb;

architecture <<ARCH_TYPE>> of <<ENTITY_NAME>>_tb is
  --  Component declaration.
  component <<ENTITY_NAME>>
		port (<<IN_P>> <<OUT_P>>);
  end component;
  --  Specifies the entity which is linked with the component. (Especifica qual a entidade está vinculada com o componente).
  for <<ENTITY_NAME>>_0: <<ENTITY_NAME>> use entity work.<<ENTITY_NAME>>;
	<<DECL_TEST_SIGNALS>>

  <<PROC_PRINT_MSGS>>

  begin
    --  Component instantiation.
	--  port map (<<p_in_1>> => <<s_t_in_1>>)
	<<ENTITY_NAME>>_0: <<ENTITY_NAME>> port map (<<port_map_entity_tb>>);

    --  Process that works.
    process
        -- line to print.
        variable line_out: line;
        -- A record is created with the inputs and outputs of the entity.
        -- (<<entrada1>>, <<entradaN>>, <<saida1>>, <<saidaN>>)
        <<RECORD_PATTERN_TYPE_DECLARATION>>

        --  The input patterns are applied (injected) to the inputs of the entity under test.
        type pattern_array is array (natural range <>) of pattern_type;
        -- Test cases.
        constant patterns : pattern_array :=
        (
          <<TESTCASES_DECLARATION>>
        );
        begin
          -- Message starting...
          write(line_out, string'("Running testbench: <<ENTITY_NAME>>_tb."));
          writeline(output, line_out);
          write(line_out, string'(" Testing entity: <<ENTITY_NAME>>."));
          writeline(output, line_out);
          -- Injects the inputs and check thte outputs.
          for i in patterns'range loop
            -- Injects the inputs.
            <<input_signals_injection>>
            -- wait for results.
            wait for 1 ns;
            -- Checks the result with the expected output in the pattern.
            <<PRINT_MESSAGE_CALL>>
            <<asserts_vars>>
          end loop;

          write(line_out, string'("Execution of <<ENTITY_NAME>>_tb finished."));
          writeline(output, line_out);
          assert false report "End of test." severity note;
          --  Wait forever; Isto finaliza a simulação.
          wait;
	end process;
end <<ARCH_TYPE>>;
