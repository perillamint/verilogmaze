`ifndef _main_incl
`define _main_incl

`include "maprom.v"

//Use tremux algorithm to solve maze.
//


module module_2013210101 (clk, reset, curpos, finish);
	input clk;
	input reset;
	output [5:0] curpos;
	output finish;

	//TODO: pathfinding routine;

	always @ (posedge clk)
	begin
	end

endmodule


`endif
