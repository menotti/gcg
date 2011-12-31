-- Projeto gerado via script.
-- Data: Sáb,31/12/2011-01:39:29
-- Autor: rogerio
-- Comentario: Descrição da Entidade: unidadeLogica.
 
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
 
entity unidadeLogica is
	port (A, B, OpAND, OpOR, OpNAND, OpNOR, OpXOR, OpXNOR, OpNOT: in <<type>>; S: out <<type>>);
end unidadeLogica;
 
architecture estrutural of unidadeLogica is
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
end estrutural;

