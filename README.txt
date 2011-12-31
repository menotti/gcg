Step by Step
------------------------------------------------------------------------
Download the source of gcg, copy src directory and rename to main entity name of new project.
Access the directory and execute commands:

# Create te project to entity.
make new PROJECT=entityName ARCH=ArchitectureType IN="port1, ..., portN" OUT="port1, ..., portN"

Edit the files: src/entityName.vhd and testbench/entityName_tb.vhd
Replacing the <<type>> tags with apropriate type (bit, std_logic and etc).

Create architecture commands in src/entityName.vhd and test cases in testbench/entityName_tb.vhd.

# Compile, Run and view results.
make compile TESTBENCH=entityName_tb
make run TESTBENCH=entityName_tb
make view TESTBENCH=entityName_tb

# Make all command: compile, run and view.
make all TESTBENCH=entityName_tb
