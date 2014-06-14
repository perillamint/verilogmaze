module dflipflop (d, e, q, nq);
	input d;
	input e;
	output q;
	output nq;
	
	wire w1;

	not (w1, d);
	rslatch rs1 (w1, d, e, q, nq);
endmodule
