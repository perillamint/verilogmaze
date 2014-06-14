COMPILER := iverilog
SIMULATOR := vvp
VIEWER := gtkwave

COMFLAGS := 
SIMFLAGS := -v

SRCS = $(wildcard *.v)
TBSRCS = $(filter %_tb.v, $(SRCS))
MODSRCS = $(filter-out %_tb.v %_incl.v, $(SRCS))
VVPS = $(patsubst %.v,%.vvp,$(TBSRCS))
VCDS = $(patsubst %_tb.v,%_wave.vcd,$(TBSRCS))

all: $(VVPS)

simulate: $(VCDS)

clean:
	rm $(wildcard *.vvp) $(wildcard *.vcd)

$(VVPS): %.vvp : %.v $(MODSRCS)
	$(COMPILER) $(COMFLAGS) $^ -o $@

$(VCDS): %_wave.vcd: %_tb.vvp
	$(SIMULATOR) $(SIMFLAGS) $<
