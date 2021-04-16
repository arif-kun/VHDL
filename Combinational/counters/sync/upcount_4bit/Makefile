GHDL= ghdl
SRC = sync_upcount
TB = sync_upcount_tb

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