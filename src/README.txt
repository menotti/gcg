# O Makefile, bem como os templates foram criados para facilitar a criação e 
# execução de projetos VHDL em GHDL.
# Rogério A. Gonçalves
# rogerio.rag@gmail.com
# http://rag.pro.br

Comandos individuais:

Criar diretórios do projeto e arquivos iniciais.
make new PROJECT=nomeDoProjeto ARCH=tipoArquitetura IN=porta1,porta2,portaN OUT=porta1,porta2,portaN
Onde:
PROJECT: Nome da entidade que está sendo projetada.
ARCH: valores possíveis {logica, estrutural, condicional}, usando "estrutural" a declaração dos 
componentes será feita.

Observação:
As variáveis que são passadas ao make ou devem ser escritas sem espaço (IN=porta1,porta2,portaN) 
ou com espaços e entre aspas (IN="porta1, porta2, portaN"), pois ao encontrar um espaço o make 
irá entender que ali acaba a definição da variável.
Então o comando make new acima pode ser reescrito como:
make new PROJECT="nomeDoProjeto" ARCH="tipoArquitetura" IN="porta1, porta2, portaN" OUT="porta1, porta2, portaN"


Compilar, executar e visualizar.
make compile TESTBENCH=nomeDoProjeto_tb
make run TESTBENCH=nomeDoProjeto_tb
make view TESTBENCH=nomeDoProjeto_tb

Comando faz tudo: compila, executa e visualiza.
make all TESTBENCH=nomeDoProjeto_tb

Comando para apagar diretorio de simulacao.
make clean
