-- Projeto gerado via script.
-- Data: Sex,30/12/2011-14:41:09
-- Autor: rogerio
-- Comentario: Descrição da Entidade: and2.
 
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
 
entity and2 is
	port (x, y: in std_logic; z: out std_logic);
end and2;
 
architecture logic of and2 is
  
begin
  -- Comandos.
  z <= x and y;
end logic;
