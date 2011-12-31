-- Projeto gerado via script.
-- Data: Qua,20/07/2011-13:51:40
-- Autor: rogerio
-- Comentario: Descrição da Entidade: somador.
 
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
 
entity somador is
	port(a, b, cin, opSomador:in std_logic; s, cout: out std_logic);
end somador;
 
architecture estrutural of somador is
	component and2
		port(a, b: in std_logic; y: out std_logic);
	end component;
	
	component xor2
		port(a, b: in std_logic; y: out std_logic);
	end component;

	component and3
		port(a, b, c: in std_logic; y: out std_logic);
	end component;

	component or3
		 port(a, b, c: in std_logic; y: out std_logic);
	end component;

	signal s_X1_X2, s_X2_A1, s_A1_O1, s_A2_O1, s_A3_O1, s_A4_O1: std_logic;
begin
	X1: xor2 port map(a=>a, b=>b, y=>s_X1_X2);
	X2: xor2 port map(a=>s_X1_X2, b=>cin, y=>s_X2_A1);
	A1: and2 port map(a=>s_X2_A1, b=>opSomador, y=>s);
	A2: and3 port map(a=>a, b=>b, c=>opSomador, y=>s_A2_O1);
	A3: and3 port map(a=>a, b=>cin, c=>opSomador, y=>s_A3_O1);
	A4: and3 port map(a=>b, b=>cin, c=>opSomador, y=>s_A4_O1);
	O1: or3 port map(a=>s_A2_O1, b=>s_A3_O1, c=>s_A4_O1, y=>cout);
end estrutural;
