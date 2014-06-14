/*
 *   Maze rom file #2.
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

module maprom2(clk, en, addr, data);
	input clk;
	input en;
	input [3:0] addr;
	output reg [7:0] data;

	always @(posedge clk)
	begin
		if(en)
		begin
			case(addr)
				4'b0000: data <= 8'b00001111;
				4'b0001: data <= 8'b11111100;
				4'b0010: data <= 8'b00100111;
				4'b0011: data <= 8'b11101010;
				4'b0100: data <= 8'b10001110;
				4'b0101: data <= 8'b10010010;
				4'b0110: data <= 8'b10110110;
				4'b0111: data <= 8'b11100100;
				4'b1000: data <= 8'b00011000;
				4'b1001: data <= 8'b00111101;
				default: data <= 0;
			endcase
		end
	end
endmodule
