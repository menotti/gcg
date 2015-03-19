# AND Gate #



## Description ##

The AND gate implements the function described in truth table, considering inputs (x, y) and output (z):

| **x** | **y** | **z** |
|:------|:------|:------|
|  0  |  0  |  0  |
|  0  |  1  |  0  |
|  1  |  0  |  0  |
|  1  |  1  |  1  |

## Building AND Gate component in gcg ##

Para criar componentes básicos, como neste exemplo uma porta AND, pode ser utilizado o comando _make new_. Note que denominamos o projeto de _and2_ pelo fato do componente ter duas entradas, valor esse passado para o _make_ na variável PROJECT e a arquitetura para esse elemento básico foi definida como lógica, por meio da variável ARCH.

#labels Make command to build AND gate
```make

make new PROJECT=and2 ARCH=logic IN=x,y OUT=z
```

Verificando a estrutura do projeto, pode-se ver que foram criados o arquivo da entidade no diretório src e do teste no diretório testbench.
O Código VHDL gerado para a entidade and2 foi criado, sendo necessário somente colocarmos o tipo das variáveis e a expressão lógica (z <= x and y) que gera o resultado descrito na tabela verdade.

```VHDL

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
```


No diretorio testbench foi criado o arquivo and2\_tb.vhd que é o testbench para a entidade and2, conforme podemos ver no Código~\ref{cod:and2\_tb}, novamente alteramos type para std\_logic e criamos os casos de teste.

```VHDL

-- Testebench gerado via script.
-- Data: Sex,30/12/2011-14:41:09
-- Autor: rogerio
-- Comentario: Teste da entidade and2.

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity and2_tb is
end and2_tb;

architecture logic of and2_tb is
--  Declaração do componente.
component and2
port (x, y: in std_logic; z: out std_logic);
end component;
--  Especifica qual a entidade está vinculada com o componente.
for and2_0: and2 use entity work.and2;
signal s_t_x, s_t_y, s_t_z: std_logic;
begin
--  Instanciação do Componente.
--  port map (<<p_in_1>> => <<s_t_in_1>>)
and2_0: and2 port map ( x=>s_t_x, y=>s_t_y, z=>s_t_z);

--  Processo que faz o trabalho.
process
-- Um registro é criado com as entradas e saídas da entidade.
-- (<<entrada1>>, <<entradaN>>, <<saida1>>, <<saidaN>>)
type pattern_type is record
-- entradas.
vi_x, vi_y: std_logic;
-- saídas.
vo_z: std_logic;
end record;

--  Os padrões de entrada que são aplicados (injetados) às entradas.
type pattern_array is array (natural range <>) of pattern_type;
-- Casos de teste.
constant patterns : pattern_array :=
(
('0', '0', '0'),
('0', '1', '0'),
('1', '0', '0'),
('1', '1', '1')
);
begin
--  Checagem de padrões.
for i in patterns'range loop
--  Injeta as entradas.
s_t_x <= patterns(i).vi_x;
s_t_y <= patterns(i).vi_y;

--  Aguarda os resultados.
wait for 1 ns;
--  Checa o resultado com a saída esperada no padrão.
assert s_t_z = patterns(i).vo_z	report "Valor de s_t_z não confere com o resultado esperado." severity error;

end loop;
assert false report "Fim do teste." severity note;
--  Wait forever; Isto finaliza a simulação.
wait;
end process;
end logic;
```

## Compiling, Running and Viewing results ##

Executando os comandos make apresentado no Código, se tudo estiver correto, a entidade and2 será analisada e compilada e o teste será executado e no final será apresentado a tela do gtkwave com o diagrama de tempo (forma de onda).

#labels Comando para executar o testbench da entidade and2.

```make

make compile TESTBENCH=and2_tb
make run TESTBENCH=and2_tb
make view TESTBENCH=and2_tb
```



```make

make all TESTBENCH=and2_tb
```

O diagrama do resultado pode ser visualizado na Figura:

![http://wiki.gcg.googlecode.com/hg/images/gtw_and2.png](http://wiki.gcg.googlecode.com/hg/images/gtw_and2.png)