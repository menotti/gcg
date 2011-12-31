-- Projeto gerado via script.
-- Data: Sáb,31/12/2011-01:19:07
-- Autor: rogerio
-- Comentario: Descrição da Entidade: nand2.
 
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
 
entity nand2 is
	port (a, b: in std_logic; y: out std_logic);
end nand2;
 
architecture logica of nand2 is
  
  
begin
  -- Comandos.
  y <= a nand b;  
end logica;

