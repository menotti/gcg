-- Projeto gerado via script.
-- Data: Qua,20/07/2011-13:51:40
-- Autor: rogerio
-- Comentario: Descrição da Entidade: and3.
 
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
 
entity and3 is
	port (a,b,c: in std_logic; y: out std_logic);
end and3;
 
architecture logica of and3 is
begin
-- Comandos.
	y <= a and b and c;
end logica;

