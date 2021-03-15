GHDL= ghdl
SRC = T_ff
TB = T_ff_tb

all: $(SRC).vcd

DEPS = \
	$(TB).o\
	$(SRC).o

# Object file depends on source
%.o: %.vhd
	$(GHDL) -a $<

$(TB).exe: $(DEPS)
	$(GHDL) -e $(TB)

$(SRC).vcd:	$(DEPS) $(TB).exe
	$(GHDL) -r $(TB) --vcd=$(SRC).vcd
	rm -f *.o *.cf *.exe 
	 
.PHONY: clean

clean:
	@echo "Cleaning up..."
	rm -f *.o *.cf *.exe *.vcd