library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
 
entity <<ENTITY_NAME>> is
	port (<<IN_P>>: in <<type>>; <<OUT_P>>: out <<type>>);
end <<ENTITY_NAME>>;
 
architecture <<ARCH_TYPE>> of <<ENTITY_NAME>> is
-- Declaração dos componentes.
  component <<COMPONENT_NAME>>
    port(<<ports_in>>: in <<type>>; <<ports_out>>: out <<type>>);
  end component;
 
-- Declaração dos sinais.
  signal <<s_sinal_1>>, <<s_sinal_2>>, <<s_sinal_N>>: <<type>> <<length>>;
 
begin
-- Comandos.
-- Instanciação dos componentes e o mapeamento de portas.
  <<instance_name>>: <<COMPONENT_NAME>> port map(<<port1>>=><<portX>>, <<port2>>=><<portY>>);
end <<ARCH_TYPE>>;

