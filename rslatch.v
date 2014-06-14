`ifndef _rslatch_incl
`define _rslatch_incl

module rslatch (r, s, c, q, nq);
	input r;
	input s;
	input c;
	output q;
	output nq;

	wire w1, w2;

	nand (w1, s, c);
	nand (w2, r, c);

	nand (nq, q, w2);
	nand (q, nq, w1);
endmodule

`endif
