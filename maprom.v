`ifndef _maprom_def
`define _maprom_def

/*
 *	 Map selector.
 *   Format: each byte indicates maps row.
 *   Opened cell is marked as True  (1)
 *   Closed cell is marked as False (0)
 *
 *   Start / end point format
 *   
 *   +---------+---------+------+------+------+------+------+------+
 *   |Preserved|Preserved|row(2)|row(1)|row(0)|col(2)|col(1)|col(0)|
 *   +---------+---------+------+------+------+------+------+------+
 *
 *   Start point address : 0b1000
 *   End point address   : 0b1001
 *
 */

//`include "maprom1.v"
//`include "maprom2.v"
//`include "maprom3.v"

module maprom (clk, chipsel, addr, data);
	input clk;
	input [1:0] chipsel;
	input [3:0] addr;
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
