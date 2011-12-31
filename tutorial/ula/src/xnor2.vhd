-- Projeto gerado via script.
-- Data: Sáb,31/12/2011-01:19:09
-- Autor: rogerio
-- Comentario: Descrição da Entidade: xnor2.
 
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
 
entity xnor2 is
	port (a, b: in std_logic; y: out std_logic);
end xnor2;
 
architecture logica of xnor2 is
  
  
begin
  -- Comandos.
  y<= a xnor b;  
end logica;

