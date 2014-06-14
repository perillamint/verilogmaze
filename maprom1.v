`ifndef _maprom1_incl
`define _maprom1_incl

/*
 *   Maze rom file #1.
 *   Format: each byte indicates maps row.
 *   Opened cell is marked as True  (1)
 *   Closed cell is marked as False (0)
 */

module maprom1(clk, en, addr, data);
	input clk;
	input en;
	input [2:0] addr;
	output reg [7:0] data;

	always @(posedge clk)
	begin
		if(en)
		begin
			case(addr)
				3'b000: data <= 8'b11111111;
				3'b001: data <= 8'b10000001;
				3'b010: data <= 8'b11101111;
				3'b011: data <= 8'b01100100;
				3'b100: data <= 8'b11110111;
				3'b101: data <= 8'b00010001;
				3'b110: data <= 8'b11110111;
				3'b111: data <= 8'b10001100;
			endcase
		end
	end
endmodule
		
`endif
