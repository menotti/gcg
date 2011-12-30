# O Makefile, bem como os templates foram criados para facilitar a criação e execução de projetos VHDL em GHDL.
# Rogério A. Gonçalves
# rogerio.rag@gmail.com
# http://rag.pro.br

Comandos individuais:

Criar diretórios do projeto e arquivos iniciais.
make new PROJECT=nomeDoProjeto ARCH=tipoArquitetura IN=porta1,porta2,portaN OUT=porta1,porta2,portaN

Compilar, executar e visualizar.
make compile TESTBENCH=nomeDoProjeto_tb
make run TESTBENCH=nomeDoProjeto_tb
make view TESTBENCH=nomeDoProjeto_tb

Comando faz tudo: compila, executa e visualiza.
make all TESTBENCH=nomeDoProjeto_tb

Comando para apagar diretorio de simulacao.
make clean
