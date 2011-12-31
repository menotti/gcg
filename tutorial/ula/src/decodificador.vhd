-- Projeto gerado via script.
-- Data: Sáb,31/12/2011-00:58:50
-- Autor: rogerio
-- Comentario: Descrição da Entidade: decodificador.
 
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
 
entity decodificador is
	port (F2, F1, F0: in std_logic; Op0, Op1, Op2, Op3, Op4, Op5, Op6, Op7: out std_logic);
end decodificador;
 
architecture estrutural of decodificador is
  -- Declaração dos componentes.
 component and3
 	port (a,b,c: in std_logic; y: out std_logic);
 end component;
 
 component inversor is
	port (a: in std_logic; y: out std_logic);
 end component;
 
  -- Declaração dos sinais.
 signal s_I1_n, s_I2_n, s_I3_n: std_logic;

begin
  -- Comandos.
  -- Instanciação dos componentes e o mapeamento de portas.
 I1: inversor port map(a=>F2, y=>s_I1_n);
 I2: inversor port map(a=>F1, y=>s_I2_n);
 I3: inversor port map(a=>F0, y=>s_I3_n);
 
 A1: and3 port map(a=>s_I1_n, b=>s_I2_n, c=>s_I3_n, y=>Op0);
 A2: and3 port map(a=>s_I1_n, b=>s_I2_n, c=>F0, y=>Op1);
 A3: and3 port map(a=>s_I1_n, b=>F1, c=>s_I3_n, y=>Op2);
 A4: and3 port map(a=>s_I1_n, b=>F1, c=>F0, y=>Op3);
 A5: and3 port map(a=>F2, b=>s_I2_n, c=>s_I3_n, y=>Op4);
 A6: and3 port map(a=>F2, b=>s_I2_n, c=>F0, y=>Op5);
 A7: and3 port map(a=>F2, b=>F1, c=>s_I3_n, y=>Op6);
 A8: and3 port map(a=>F2, b=>F1, c=>F0, y=>Op7); 
end estrutural;

