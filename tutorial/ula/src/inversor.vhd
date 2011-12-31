-- Projeto gerado via script.
-- Data: Sex,30/12/2011-23:36:18
-- Autor: rogerio
-- Comentario: Descrição da Entidade: inversor.
 
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
 
entity inversor is
	port (a: in std_logic; y: out std_logic);
end inversor;
 
architecture logica of inversor is
  
  
begin
  -- Comandos.
  y <= not a;  
end logica;

