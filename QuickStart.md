# Individuals Commands #

## Make project directories and initial files ##
```
make new PROJECT=entityName ARCH=ArchitectureType IN=port1,...,portN OUT=port1,...,portN
or
make new PROJECT=entityName ARCH=ArchitectureType IN="port1, ..., portN" OUT="port1, ..., portN"
```

Where:
**PROJECT: Entity Name that will designed.** ARCH: Possible values {logical, structural, conditional}, using "structural"
the components declaration will be made.
**IN: input ports.** OUT: output ports.

Note:
The variables that are passed to make or should be written without space (IN=port1,port2,portN) or with spaces and quotes (IN="port1, porta2,
portaN"), because finding a space to make will understand that there ends the
variable definition.

## Edit the Project Files ##
Use an editor of your choice to modify the files: src/entityName.vhd and testbench/entityName\_tb.vhd

Replacing the `<<type>>` tags with apropriate type (bit, std\_logic and etc).

Create architecture commands in src/entityName.vhd and test cases in testbench/entityName\_tb.vhd.

## Compile, Run and view results ##
```
make compile TESTBENCH=entityName_tb
make run TESTBENCH=entityName_tb
make view TESTBENCH=entityName_tb
```

## Make all command: compile, run and view ##
```
make all TESTBENCH=entityName_tb
```

Cleaning project source code (delete simulation directory)

---

```
make clean
```