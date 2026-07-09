	component clk_src1 is
		generic (
			CLOCK_RATE : positive := 1000;
			CLOCK_UNIT : positive := 1000000
		);
		port (
			clk : out std_logic   -- clk
		);
	end component clk_src1;

	u0 : component clk_src1
		generic map (
			CLOCK_RATE => POSITIVE_VALUE_FOR_CLOCK_RATE,
			CLOCK_UNIT => POSITIVE_VALUE_FOR_CLOCK_UNIT
		)
		port map (
			clk => CONNECTED_TO_clk  -- clk.clk
		);

