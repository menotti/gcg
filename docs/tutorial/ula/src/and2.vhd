-- Projeto gerado via script.
-- Data: Qua,20/07/2011-14:18:43
-- Autor: rogerio
-- Comentario: Descrição da Entidade: and2.
 
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
 
entity and2 is
	port (a,b: in std_logic; y: out std_logic);
end and2;
 
architecture logica of and2 is
begin
	-- Comandos.
	y <= a and b;	
end logica;

