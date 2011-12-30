-- Projeto gerado via script.
-- Data: Qua,20/07/2011-14:52:39
-- Autor: rogerio
-- Comentario: Descrição da Entidade: somador.
 
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
 
entity somador is
	port (A,B,Cin,OpSomador: in std_logic; S,Cout: out std_logic);
end somador;
 
architecture estrutural of somador is
-- Declaração dos componentes.
  component <<COMPONENT_NAME>>
    port(<<ports_in>>: in std_logic; <<ports_out>>: out std_logic);
  end component;
 
-- Declaração dos sinais.
  signal <<s_sinal_1>>, <<s_sinal_2>>, <<s_sinal_N>>: std_logic <<length>>;
 
begin
-- Comandos.
-- Instanciação dos componentes e o mapeamento de portas.
  <<instance_name>>: <<COMPONENT_NAME>> port map(<<port1>>=><<portX>>, <<port2>>=><<portY>>);
end estrutural;

