-- Projeto gerado via script.
-- Data: Sáb,31/12/2011-01:19:07
-- Autor: rogerio
-- Comentario: Descrição da Entidade: nor2.
 
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
 
entity nor2 is
	port (a, b: in std_logic; y: out std_logic);
end nor2;
 
architecture logica of nor2 is
  
  
begin
  -- Comandos.
  y <= a nor b;  
end logica;

