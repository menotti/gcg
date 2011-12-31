# Makefile criado para facilitar a criação e execução de projetos VHDL em GHDL.
# Rogério A. Gonçalves
# rogerio.rag@gmail.com
# http://rag.pro.br

# diretorio de fontes.
SRCDIR = src
# diretorio de testes.
TBDIR = testbench
# diretorio de simulacao.
SIMDIR = simulation

# arquivos vhdl.
FILES = src/*
VHDLEX = .vhd
 
# testbench (arquivo de teste).
TESTBENCHPATH = $(TBDIR)/${TESTBENCH}$(VHDLEX)
 
# Configuracao do GHDL
GHDL_CMD = ghdl
GHDL_FLAGS  = --std=02 --ieee=synopsys --warn-no-vital-generic

# Parâmetros para as Simulacoes do GHDL.
GHDL_SIM_OPT = --assert-level=error --trace-signals --disp-tree --stats --stop-time=1000ns

# Visualizador de forma de onda (diagrama de tempo).
WAVEFORM_VIEWER = gtkwave

# Comandos auxiliares.
RM_CMD = rm -rf
MKDIR_CMD = mkdir
CAT_CMD = cat
USE_INF="Use make new PROJECT=nomeDoProjeto ARCH=tipoArquitetura IN=porta1,porta2,portaN OUT=porta1,porta2,portaN IN=porta1,porta2,portaN OUT=porta1,porta2,portaN para defini-la."

# Tipo que declara componentes.
TYPE_WITH_COMPONENTS=estrutural

# Functions.
# Cria o cabecalho dos arquivos.
define criarcabecalho
	@echo " Criando arquivo: $2"
	@echo "-- $1 gerado via script." > $2
	@echo "-- Data: `date +%a,%d/%m/%Y-%H:%M:%S`" >> $2
	@echo "-- Autor: $(USERNAME)" >> $2
	@echo "-- Comentario: $3." >> $2
	@echo " " >> $2
endef

# Targets do make.
all: compile run view

checktb :
ifeq ($(strip $(TESTBENCH)),)
		@echo " Variável TESTBENCH não definida. Use make compile TESTBENCH=nomeentidade_tb para defini-lo."
		@exit 2
endif

checkvars :
ifeq ($(strip $(PROJECT)),)
	@echo " Variavel PROJECT não definida. $(USE_INF)"
	@exit 2
endif
ifeq ($(strip $(ARCH)),)
	@echo " Variavel ARCH não definida. $(USE_INF)"
	@exit 2
endif
ifeq ($(strip $(IN)),)
	@echo " Variavel IN não definida. $(USE_INF)"
	@exit 2
endif
ifeq ($(strip $(OUT)),)
	@echo " Variavel OUT não definida. $(USE_INF)"
	@exit 2
endif

checkdirs :
# Verifica se os diretorios existem, caso contrário cria os diretorios.
	@echo "Criando diretorios do projeto: $(SRCDIR) $(TBDIR) $(SIMDIR)"
ifeq (,$(findstring $(SRCDIR),$(wildcard $(SRCDIR) )))
	$(MKDIR_CMD) $(SRCDIR)
endif	
ifeq (,$(findstring $(TBDIR),$(wildcard $(TBDIR) )))
	$(MKDIR_CMD) $(TBDIR)
endif
ifeq (,$(findstring $(SIMDIR),$(wildcard $(SIMDIR) )))
	$(MKDIR_CMD) $(SIMDIR)
endif	

compile : checktb
	mkdir -p $(SIMDIR)
	$(GHDL_CMD) -i $(GHDL_FLAGS) --workdir=$(SIMDIR) --work=work $(TESTBENCHPATH) $(FILES)
	$(GHDL_CMD) -m  $(GHDL_FLAGS) --workdir=$(SIMDIR) --work=work $(TESTBENCH)
	@mv $(TESTBENCH) $(SIMDIR)/$(TESTBENCH)                                                                                
 
run : checktb
	@$(SIMDIR)/$(TESTBENCH) $(GHDL_SIM_OPT) --vcdgz=$(SIMDIR)/$(TESTBENCH).vcdgz                                      
 
view : checktb 
	gunzip --stdout $(SIMDIR)/$(TESTBENCH).vcdgz | $(WAVEFORM_VIEWER) --vcd                                               
 
clean :
	$(GHDL_CMD) --clean --workdir=$(SIMDIR)
	$(RM_CMD) $(SIMDIR)

new : checkvars checkdirs
	@echo "Construindo o projeto ${PROJECT}"

# Cria os arquivos da entidade e do testebench.
	$(call criarcabecalho,"Projeto","$(SRCDIR)/$(PROJECT)$(VHDLEX)","Descrição da Entidade: $(PROJECT)")
	@sed -e 's/<<ENTITY_NAME>>/$(PROJECT)/g' templates/entity.vhd | sed -e 's/<<IN_P>>/$(shell echo "$(IN)" | sed 's/ //g' | sed -e 's/[a-zA-Z_$$][a-zA-Z0-9_$$]*/&/g' | sed 's/,/, /g')/g' | sed -e 's/<<OUT_P>>/$(shell echo "$(OUT)" | sed 's/ //g' | sed -e 's/[a-zA-Z_$$][a-zA-Z0-9_$$]*/&/g' | sed 's/,/, /g')/g' | sed -e 's/<<ARCH_TYPE>>/$(ARCH)/g' >> $(SRCDIR)/$(PROJECT)$(VHDLEX)

# Se o tipo é Estrutural que precisa da declaração de componentes.
ifeq ($(strip $(ARCH)),$(TYPE_WITH_COMPONENTS))
	@echo " Detectado ARCH=$(ARCH)."
	@echo "  Declarando componentes."
	@sed -i 's/<<DECL_COMPONENTS>>/$(shell cat templates/decl_components.vhd)/g' $(SRCDIR)/$(PROJECT)$(VHDLEX)
	@sed -i 's/<<DECL_SIGNALS>>/$(shell cat templates/decl_signals.vhd)/g' $(SRCDIR)/$(PROJECT)$(VHDLEX)
	@sed -i 's/<<DECL_COMP_INSTANCES>>/$(shell cat templates/decl_components_instances.vhd)/g' $(SRCDIR)/$(PROJECT)$(VHDLEX)
else
	@sed -i 's/<<DECL_COMPONENTS>>//g' $(SRCDIR)/$(PROJECT)$(VHDLEX)
	@sed -i 's/<<DECL_SIGNALS>>//g' $(SRCDIR)/$(PROJECT)$(VHDLEX)
	@sed -i 's/<<DECL_COMP_INSTANCES>>//g' $(SRCDIR)/$(PROJECT)$(VHDLEX)
endif

	$(call criarcabecalho,"Testebench","$(TBDIR)/$(PROJECT)_tb$(VHDLEX)","Teste da entidade $(PROJECT)")
	@sed -e 's/<<ENTITY_NAME>>/$(PROJECT)/g' templates/entity_tb.vhd | sed -e 's/<<IN_P>>/$(shell echo "$(IN)" | sed 's/ //g' | sed -e 's/[a-zA-Z_$$][a-zA-Z0-9_$$]*/&/g' | sed 's/,/, /g')/g' | sed -e 's/<<OUT_P>>/$(shell echo "$(OUT)" | sed 's/ //g' | sed -e 's/[a-zA-Z_$$][a-zA-Z0-9_$$]*/&/g' | sed 's/,/, /g')/g' | sed -e 's/<<ARCH_TYPE>>/$(ARCH)/g' | sed -e 's/<<s_t_sinais>>/$(shell echo "$(IN),$(OUT)" | sed 's/ //g' | sed 's/^/s_t_/' | sed 's/,/, s_t_/g')/g' >> $(TBDIR)/$(PROJECT)_tb$(VHDLEX)
	@sed -i 's/<<port_map_entity_tb>>/$(shell echo "$(IN),$(OUT)" | sed 's/ //g' | sed -e 's/[a-zA-Z_$$][a-zA-Z0-9_$$]*/ &=>s_t_&/g')/g' $(TBDIR)/$(PROJECT)_tb$(VHDLEX) 
	@sed -i 's/<<record_in_vars>>/$(shell echo "$(IN)" | sed 's/ //g' | sed -e 's/[a-zA-Z_$$][a-zA-Z0-9_$$]*/ vi_&/g')/g' $(TBDIR)/$(PROJECT)_tb$(VHDLEX) 
	@sed -i 's/<<record_out_vars>>/$(shell echo "$(OUT)" | sed 's/ //g' | sed -e 's/[a-zA-Z_$$][a-zA-Z0-9_$$]*/ vo_&/g')/g' $(TBDIR)/$(PROJECT)_tb$(VHDLEX)
	@sed -i 's/<<case_test_model>>/$(shell echo "$(IN),$(OUT)" | sed 's/ //g' | sed 's/,/, /g' | wc -w)/g' $(TBDIR)/$(PROJECT)_tb$(VHDLEX)
	@sed -i 's/<<inputs_signals_injection>>/$(shell echo "$(IN)" | sed 's/ //g' | sed -e 's/[a-zA-Z_$$][a-zA-Z0-9_$$]*/s_t_& <= patterns(i).vi_&;\\n\\t\\t\\t/g' | sed 's/,//g')/g' $(TBDIR)/$(PROJECT)_tb$(VHDLEX)
	@sed -i 's/<<asserts_vars>>/$(shell echo "$(OUT)" | sed 's/ //g' | sed -e 's/[a-zA-Z_$$][a-zA-Z0-9_$$]*/assert s_t_& = patterns(i).vo_&\\treport "Valor de s_t_& não confere com o resultado esperado." severity error;\\n\\t\\t\\t/g' | sed 's/,//g')/g' $(TBDIR)/$(PROJECT)_tb$(VHDLEX)
	
	@echo "Projeto $(PROJECT) criado com sucesso."
	@echo "Done."
