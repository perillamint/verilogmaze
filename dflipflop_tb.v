`include "simulargs_incl.v"

module testbench;
`include "simulutil_incl.v"
	reg d;
	reg e;
	wire q;
	wire nq;
	
	integer i;

	dflipflop ff1 (d, e, q, nq);

	initial begin
		$dumpfile("dflipflop_wave.vcd");
		$dumpvars(0, testbench);

		d <= 0;
		e <= 1;

		#250;

		for(i = 0; i < 5; i = i + 1)
		begin
			d <= 0;
			e <= 1;

			#250;
			$display("d = %b, e = %b, q = %b, nq = %b", d, e, q, nq);
			assert (q == 0 && nq != 0);
	
			d <= 1;
			e <= 0;

			#250;
			$display("d = %b, e = %b, q = %b, nq = %b", d, e, q, nq);
			assert (q == 0 && nq != 0);

			d <= 1;
			e <= 1;
	
			#250;
			$display("d = %b, e = %b, q = %b, nq = %b", d, e, q, nq);
			assert (q == 1 && nq != 1);
	
			d <= 0;
			e <= 0;
	
			#250;
			$display("d = %b, e = %b, q = %b, nq = %b", d, e, q, nq);
			assert (q == 1 && nq != 1);
		end
	end
endmodule
