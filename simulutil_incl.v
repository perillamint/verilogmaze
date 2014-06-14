task assert(input condition);
	if(!condition)
	begin
		$display("Assertion failed.\n");
		$finish(1);
	end
endtask
