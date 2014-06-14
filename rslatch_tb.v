`ifndef _rslatch_tb_incl
`define _rslatch_tb_incl

`include "simulargs.v"
`include "rslatch.v"

module testbench;
`include "simulutil.v"
	reg r;
	reg s;
	wire q;
	wire nq;
	
	integer i;

	rslatch rsl1 (r, s, 1, q, nq);

	initial begin
		$dumpfile("rslatch_wave.vcd");
		$dumpvars(0, testbench);

		r <= 1;
		s <= 0;

		#250;

		for(i = 0; i < 5; i = i + 1)
		begin
			s <= 0;
			r <= 0;

			#250;
			$display("r = %b, s = %b, q = %b, nq = %b", r, s, q, nq);
			assert (q == 0 && nq != 0);
	
			s <= 1;
			r <= 0;

			#250;
			$display("r = %b, s = %b, q = %b, nq = %b", r, s, q, nq);
			assert (q == 1 && nq != 1);

			s <= 0;
			r <= 0;
	
			#250;
			$display("r = %b, s = %b, q = %b, nq = %b", r, s, q, nq);
			assert (q == 1 && nq != 1);
	
			s <= 0;
			r <= 1;
	
			#250;
			$display("r = %b, s = %b, q = %b, nq = %b", r, s, q, nq);
			assert (q == 0 && nq != 0);
		end
	end
endmodule

`endif
