# VHDL

VHDL is a hardware description language.

## Installation

To simulate a VHDL project get [GHDL](https://github.com/ghdl/ghdl).
After simulating you can view the simulation with [GTKWave](https://github.com/gtkwave/gtkwave).

## Makefile for basic project

Easiest way to analyse and simulate your project is a `Makefile`:

```make
FILES = *.vhd

ENITITY = <name for entity file>

GHDL_CMD      = ghdl
#GHDL_FLAGS    = --std=93c
GHDL_FLAGS    = --ieee=synopsys -fexplicit
GHDL_STOPTIME = <set according to simulation>ms
GHDL_WAVEFILE = wave.ghw
GTKWAVE_CMD   = gtkwave

all: syntax analysis elaborate run wave clean

syntax:
        @echo Syntax-check
        $(GHDL_CMD) -s $(GHDL_FLAGS) $(FILES)

analysis:
        @echo Analysis
        $(GHDL_CMD) -a $(GHDL_FLAGS) $(FILES)

elaborate:
        @echo Elaboration
        $(GHDL_CMD) -e $(GHDL_FLAGS) $(ENITITY)

run:
        @echo Run the simulation
        $(GHDL_CMD) -r $(GHDL_FLAGS) $(ENITITY) --stop-time=$(GHDL_STOPTIME) --wave=$(GHDL_WAVEFILE)

wave:
        @echo Show the simulation
        $(GTKWAVE_CMD) $(GHDL_WAVEFILE)

clean:
        @echo Remove generated files
        $(GHDL_CMD) --remove
```

You can then for example do all steps by running `make all` in the according folder.

## IDE

### Vim

The steps to make Vim VHDL-ready are described in [the vim section of this wiki](../linux/vim/vhdl.md).
