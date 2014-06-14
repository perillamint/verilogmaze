`ifndef _maprom3_incl
`define _maprom3_incl

/*
 *   Maze rom file #3.
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

module maprom3(clk, en, addr, data);
	input clk;
	input en;
	input [3:0] addr;
	output reg [7:0] data;

	always @(posedge clk)
	begin
		if(en)
		begin
			case(addr)
				4'b0000: data <= 8'b00111111;
				4'b0001: data <= 8'b01100001;
				4'b0010: data <= 8'b01001101;
				4'b0011: data <= 8'b11100101;
				4'b0100: data <= 8'b10110111;
				4'b0101: data <= 8'b00010001;
				4'b0110: data <= 8'b11110111;
				4'b0111: data <= 8'b10001100;
				4'b1000: data <= 8'b00111000;
				4'b1001: data <= 8'b00000111;
			endcase
		end
	end
endmodule
		
`endif
