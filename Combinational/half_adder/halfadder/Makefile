all: half_adder.vcd

GHDL=ghdl
SRC = half_adder
TB = half_adder_tb

# Object file depends on source
%.o: %.vhd
	$(GHDL) -a $<

$(TB).exe: $(TB).o $(SRC).o
	$(GHDL) -e $(TB)

half_adder.vcd:	$(TB).o $(TB).exe
	$(GHDL) -r $(TB) --vcd=$(SRC).vcd
	make clean 


clean:
	@echo "Cleaning up..."
	rm -f *.o *.cf *.exe 