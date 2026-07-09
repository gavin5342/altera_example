	component rst_src is
		generic (
			ASSERT_HIGH_RESET    : integer := 1;
			INITIAL_RESET_CYCLES : integer := 0
		);
		port (
			reset : out std_logic;        -- reset
			clk   : in  std_logic := 'X'  -- clk
		);
	end component rst_src;

	u0 : component rst_src
		generic map (
			ASSERT_HIGH_RESET    => INTEGER_VALUE_FOR_ASSERT_HIGH_RESET,
			INITIAL_RESET_CYCLES => INTEGER_VALUE_FOR_INITIAL_RESET_CYCLES
		)
		port map (
			reset => CONNECTED_TO_reset, -- reset.reset
			clk   => CONNECTED_TO_clk    --   clk.clk
		);

