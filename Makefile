COMPILER := iverilog
SIMULATOR := vvp
VIEWER := gtkwave

COMFLAGS := 
SIMFLAGS := -v

SRCS = $(wildcard *.v)
TBSRCS = $(filter %_tb.v, $(SRCS))
MODSRCS = $(filter-out %_tb.v %_incl.v, $(SRCS))
VVPS = $(patsubst %.v,%.vvp,$(TBSRCS))
VCDS = $(patsubst %.v,%.vcd,$(TBSRCS))

all: $(VVPS)

simulate: $(VCDS)

clean:
	rm $(wildcard *.vvp) $(wildcard *.vcd)

$(VVPS): $(MODSRCS)
	$(COMPILER) $(COMFLAGS) $^ -o $@

$(VCDS): %.vcd: %.vvp
	$(SIMULATOR) $(SIMFLAGS) $<
