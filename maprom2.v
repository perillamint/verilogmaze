`ifndef _maprom1_incl
`define _maprom1_incl

/*
 *   Maze rom file #2.
 *   Format: each byte indicates maps row.
 *   Opened cell is marked as True  (1)
 *   Closed cell is marked as False (0)
 */

module maprom(clk, en, addr, data);
	input clk;
	input en;
	input [2:0] addr;
	output reg [8:0] data;

	always @(posedge clk)
	begin
		if(en)
		begin
			case(addr)
				3'b000: data <= 8'b00001111;
				3'b001: data <= 8'b11111100;
				3'b010: data <= 8'b00100111;
				3'b011: data <= 8'b11101010;
				3'b100: data <= 8'b10001110;
				3'b101: data <= 8'b10010010;
				3'b110: data <= 8'b10110110;
				3'b111: data <= 8'b11100100;
			endcase
		end
	end
endmodule
		
`endif
