`ifndef _maprom_def
`define _maprom_def

`include "maprom1.v"
`include "maprom2.v"
`include "maprom3.v"

module maprom (clk, chipsel, addr, data);
	input clk;
	input [1:0] chipsel;
	input [2:0] addr;
	output reg [7:0] data;
	
	wire [7:0] data_in [2:0];

	maprom1 rom1 (clk, 1'b1, addr, data_in[0]);
	maprom2 rom2 (clk, 1'b1, addr, data_in[1]);
	maprom3 rom3 (clk, 1'b1, addr, data_in[2]);

	always @ (posedge clk)
	begin
		data <= data_in[chipsel];
	end

endmodule

`endif
