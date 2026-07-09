module rst_src #(
		parameter ASSERT_HIGH_RESET    = 1,
		parameter INITIAL_RESET_CYCLES = 0
	) (
		output wire  reset, // reset.reset
		input  wire  clk    //   clk.clk
	);
endmodule

