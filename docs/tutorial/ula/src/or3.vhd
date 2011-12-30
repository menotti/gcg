-- Projeto gerado via script.
-- Data: Qua,20/07/2011-13:51:40
-- Autor: rogerio
-- Comentario: Descrição da Entidade: or3.
 
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
 
entity or3 is
	port (a,b,c: in std_logic; y: out std_logic);
end or3;
 
architecture logica of or3 is
begin
-- Comandos.
	y <= a or b or c;
end logica;

