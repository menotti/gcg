-- Projeto gerado via script.
-- Data: Sex,30/12/2011-22:26:46
-- Autor: rogerio
-- Comentario: Descrição da Entidade: or2.
 
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
 
entity or2 is
	port (x, y: in std_logic; z: out std_logic);
end or2;
 
architecture logic of or2 is
  
  
begin
  -- Comandos.
  z <= x or y;
end logic;

