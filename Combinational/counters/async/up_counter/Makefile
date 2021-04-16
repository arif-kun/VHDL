GHDL= ghdl
SRC = up_counter
TB = up_counter_tb

all: $(SRC).vcd

DEPS = \
	T_ff.o\
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