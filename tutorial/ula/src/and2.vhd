-- Projeto gerado via script.
-- Data: Qua,20/07/2011-13:51:40
-- Autor: rogerio
-- Comentario: Descrição da Entidade: and2.

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity and2 is
	port(a,b:in std_logic; y:out std_logic);
end and2;

architecture estrutural of and2 is
begin
	y <= a and b;
end estrutural;
