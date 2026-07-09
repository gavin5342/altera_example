	rst_src #(
		.ASSERT_HIGH_RESET    (INTEGER_VALUE_FOR_ASSERT_HIGH_RESET),
		.INITIAL_RESET_CYCLES (INTEGER_VALUE_FOR_INITIAL_RESET_CYCLES)
	) u0 (
		.reset (_connected_to_reset_), //  output,  width = 1, reset.reset
		.clk   (_connected_to_clk_)    //   input,  width = 1,   clk.clk
	);

