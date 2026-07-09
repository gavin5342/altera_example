	component axi4_sub_wide is
		generic (
			ADDR_WIDTH                     : integer := 20;
			DATA_WIDTH                     : integer := 256;
			ID_WIDTH                       : integer := 5;
			USER_WIDTH                     : integer := 32;
			RD_ACCEPTANCE_CAPABILITY       : integer := 16;
			WR_ACCEPTANCE_CAPABILITY       : integer := 16;
			COMBINED_ACCEPTANCE_CAPABILITY : integer := 16;
			USE_AWREGION                   : integer := 1;
			USE_AWLOCK                     : integer := 1;
			USE_AWCACHE                    : integer := 1;
			USE_AWQOS                      : integer := 1;
			USE_AWPROT                     : integer := 1;
			USE_WLAST                      : integer := 1;
			USE_BRESP                      : integer := 1;
			USE_ARREGION                   : integer := 1;
			USE_ARLOCK                     : integer := 1;
			USE_ARCACHE                    : integer := 1;
			USE_ARQOS                      : integer := 1;
			USE_ARPROT                     : integer := 1;
			USE_RRESP                      : integer := 1;
			USE_AWUSER                     : integer := 1;
			USE_ARUSER                     : integer := 1;
			USE_WUSER                      : integer := 1;
			USE_RUSER                      : integer := 1;
			USE_BUSER                      : integer := 1
		);
		port (
			awlen    : in  std_logic_vector(7 downto 0)   := (others => 'X'); -- awlen
			awsize   : in  std_logic_vector(2 downto 0)   := (others => 'X'); -- awsize
			awburst  : in  std_logic_vector(1 downto 0)   := (others => 'X'); -- awburst
			awvalid  : in  std_logic                      := 'X';             -- awvalid
			awlock   : in  std_logic                      := 'X';             -- awlock
			awregion : in  std_logic_vector(3 downto 0)   := (others => 'X'); -- awregion
			awprot   : in  std_logic_vector(2 downto 0)   := (others => 'X'); -- awprot
			awready  : out std_logic;                                         -- awready
			arlen    : in  std_logic_vector(7 downto 0)   := (others => 'X'); -- arlen
			arsize   : in  std_logic_vector(2 downto 0)   := (others => 'X'); -- arsize
			arburst  : in  std_logic_vector(1 downto 0)   := (others => 'X'); -- arburst
			arvalid  : in  std_logic                      := 'X';             -- arvalid
			arlock   : in  std_logic                      := 'X';             -- arlock
			arregion : in  std_logic_vector(3 downto 0)   := (others => 'X'); -- arregion
			awcache  : in  std_logic_vector(3 downto 0)   := (others => 'X'); -- awcache
			awqos    : in  std_logic_vector(3 downto 0)   := (others => 'X'); -- awqos
			arprot   : in  std_logic_vector(2 downto 0)   := (others => 'X'); -- arprot
			arready  : out std_logic;                                         -- arready
			rvalid   : out std_logic;                                         -- rvalid
			rlast    : out std_logic;                                         -- rlast
			rresp    : out std_logic_vector(1 downto 0);                      -- rresp
			rready   : in  std_logic                      := 'X';             -- rready
			wvalid   : in  std_logic                      := 'X';             -- wvalid
			wlast    : in  std_logic                      := 'X';             -- wlast
			wready   : out std_logic;                                         -- wready
			bresp    : out std_logic_vector(1 downto 0);                      -- bresp
			bvalid   : out std_logic;                                         -- bvalid
			bready   : in  std_logic                      := 'X';             -- bready
			arcache  : in  std_logic_vector(3 downto 0)   := (others => 'X'); -- arcache
			arqos    : in  std_logic_vector(3 downto 0)   := (others => 'X'); -- arqos
			awaddr   : in  std_logic_vector(19 downto 0)  := (others => 'X'); -- awaddr
			awid     : in  std_logic_vector(4 downto 0)   := (others => 'X'); -- awid
			awuser   : in  std_logic_vector(31 downto 0)  := (others => 'X'); -- awuser
			araddr   : in  std_logic_vector(19 downto 0)  := (others => 'X'); -- araddr
			arid     : in  std_logic_vector(4 downto 0)   := (others => 'X'); -- arid
			aruser   : in  std_logic_vector(31 downto 0)  := (others => 'X'); -- aruser
			ruser    : out std_logic_vector(31 downto 0);                     -- ruser
			wuser    : in  std_logic_vector(31 downto 0)  := (others => 'X'); -- wuser
			buser    : out std_logic_vector(31 downto 0);                     -- buser
			rdata    : out std_logic_vector(255 downto 0);                    -- rdata
			rid      : out std_logic_vector(4 downto 0);                      -- rid
			wdata    : in  std_logic_vector(255 downto 0) := (others => 'X'); -- wdata
			wstrb    : in  std_logic_vector(31 downto 0)  := (others => 'X'); -- wstrb
			bid      : out std_logic_vector(4 downto 0);                      -- bid
			clk      : in  std_logic                      := 'X';             -- clk
			rstn     : in  std_logic                      := 'X'              -- reset_n
		);
	end component axi4_sub_wide;

	u0 : component axi4_sub_wide
		generic map (
			ADDR_WIDTH                     => INTEGER_VALUE_FOR_ADDR_WIDTH,
			DATA_WIDTH                     => INTEGER_VALUE_FOR_DATA_WIDTH,
			ID_WIDTH                       => INTEGER_VALUE_FOR_ID_WIDTH,
			USER_WIDTH                     => INTEGER_VALUE_FOR_USER_WIDTH,
			RD_ACCEPTANCE_CAPABILITY       => INTEGER_VALUE_FOR_RD_ACCEPTANCE_CAPABILITY,
			WR_ACCEPTANCE_CAPABILITY       => INTEGER_VALUE_FOR_WR_ACCEPTANCE_CAPABILITY,
			COMBINED_ACCEPTANCE_CAPABILITY => INTEGER_VALUE_FOR_COMBINED_ACCEPTANCE_CAPABILITY,
			USE_AWREGION                   => INTEGER_VALUE_FOR_USE_AWREGION,
			USE_AWLOCK                     => INTEGER_VALUE_FOR_USE_AWLOCK,
			USE_AWCACHE                    => INTEGER_VALUE_FOR_USE_AWCACHE,
			USE_AWQOS                      => INTEGER_VALUE_FOR_USE_AWQOS,
			USE_AWPROT                     => INTEGER_VALUE_FOR_USE_AWPROT,
			USE_WLAST                      => INTEGER_VALUE_FOR_USE_WLAST,
			USE_BRESP                      => INTEGER_VALUE_FOR_USE_BRESP,
			USE_ARREGION                   => INTEGER_VALUE_FOR_USE_ARREGION,
			USE_ARLOCK                     => INTEGER_VALUE_FOR_USE_ARLOCK,
			USE_ARCACHE                    => INTEGER_VALUE_FOR_USE_ARCACHE,
			USE_ARQOS                      => INTEGER_VALUE_FOR_USE_ARQOS,
			USE_ARPROT                     => INTEGER_VALUE_FOR_USE_ARPROT,
			USE_RRESP                      => INTEGER_VALUE_FOR_USE_RRESP,
			USE_AWUSER                     => INTEGER_VALUE_FOR_USE_AWUSER,
			USE_ARUSER                     => INTEGER_VALUE_FOR_USE_ARUSER,
			USE_WUSER                      => INTEGER_VALUE_FOR_USE_WUSER,
			USE_RUSER                      => INTEGER_VALUE_FOR_USE_RUSER,
			USE_BUSER                      => INTEGER_VALUE_FOR_USE_BUSER
		)
		port map (
			awlen    => CONNECTED_TO_awlen,    -- altera_axi4_subordinate.awlen
			awsize   => CONNECTED_TO_awsize,   --                        .awsize
			awburst  => CONNECTED_TO_awburst,  --                        .awburst
			awvalid  => CONNECTED_TO_awvalid,  --                        .awvalid
			awlock   => CONNECTED_TO_awlock,   --                        .awlock
			awregion => CONNECTED_TO_awregion, --                        .awregion
			awprot   => CONNECTED_TO_awprot,   --                        .awprot
			awready  => CONNECTED_TO_awready,  --                        .awready
			arlen    => CONNECTED_TO_arlen,    --                        .arlen
			arsize   => CONNECTED_TO_arsize,   --                        .arsize
			arburst  => CONNECTED_TO_arburst,  --                        .arburst
			arvalid  => CONNECTED_TO_arvalid,  --                        .arvalid
			arlock   => CONNECTED_TO_arlock,   --                        .arlock
			arregion => CONNECTED_TO_arregion, --                        .arregion
			awcache  => CONNECTED_TO_awcache,  --                        .awcache
			awqos    => CONNECTED_TO_awqos,    --                        .awqos
			arprot   => CONNECTED_TO_arprot,   --                        .arprot
			arready  => CONNECTED_TO_arready,  --                        .arready
			rvalid   => CONNECTED_TO_rvalid,   --                        .rvalid
			rlast    => CONNECTED_TO_rlast,    --                        .rlast
			rresp    => CONNECTED_TO_rresp,    --                        .rresp
			rready   => CONNECTED_TO_rready,   --                        .rready
			wvalid   => CONNECTED_TO_wvalid,   --                        .wvalid
			wlast    => CONNECTED_TO_wlast,    --                        .wlast
			wready   => CONNECTED_TO_wready,   --                        .wready
			bresp    => CONNECTED_TO_bresp,    --                        .bresp
			bvalid   => CONNECTED_TO_bvalid,   --                        .bvalid
			bready   => CONNECTED_TO_bready,   --                        .bready
			arcache  => CONNECTED_TO_arcache,  --                        .arcache
			arqos    => CONNECTED_TO_arqos,    --                        .arqos
			awaddr   => CONNECTED_TO_awaddr,   --                        .awaddr
			awid     => CONNECTED_TO_awid,     --                        .awid
			awuser   => CONNECTED_TO_awuser,   --                        .awuser
			araddr   => CONNECTED_TO_araddr,   --                        .araddr
			arid     => CONNECTED_TO_arid,     --                        .arid
			aruser   => CONNECTED_TO_aruser,   --                        .aruser
			ruser    => CONNECTED_TO_ruser,    --                        .ruser
			wuser    => CONNECTED_TO_wuser,    --                        .wuser
			buser    => CONNECTED_TO_buser,    --                        .buser
			rdata    => CONNECTED_TO_rdata,    --                        .rdata
			rid      => CONNECTED_TO_rid,      --                        .rid
			wdata    => CONNECTED_TO_wdata,    --                        .wdata
			wstrb    => CONNECTED_TO_wstrb,    --                        .wstrb
			bid      => CONNECTED_TO_bid,      --                        .bid
			clk      => CONNECTED_TO_clk,      --              clock_sink.clk
			rstn     => CONNECTED_TO_rstn      --              reset_sink.reset_n
		);

