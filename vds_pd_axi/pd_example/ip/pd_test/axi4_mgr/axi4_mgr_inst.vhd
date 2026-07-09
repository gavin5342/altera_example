	component axi4_mgr is
		generic (
			ADDR_WIDTH                  : integer := 20;
			DATA_WIDTH                  : integer := 256;
			ID_WIDTH                    : integer := 4;
			USER_WIDTH                  : integer := 32;
			RD_ISSUING_CAPABILITY       : integer := 16;
			WR_ISSUING_CAPABILITY       : integer := 16;
			COMBINED_ISSUING_CAPABILITY : integer := 16;
			USE_AWID                    : integer := 1;
			USE_AWREGION                : integer := 1;
			USE_AWLEN                   : integer := 1;
			USE_AWSIZE                  : integer := 1;
			USE_AWBURST                 : integer := 1;
			USE_AWLOCK                  : integer := 1;
			USE_AWCACHE                 : integer := 1;
			USE_AWQOS                   : integer := 1;
			USE_WSTRB                   : integer := 1;
			USE_BID                     : integer := 1;
			USE_BRESP                   : integer := 1;
			USE_ARID                    : integer := 1;
			USE_ARREGION                : integer := 1;
			USE_ARLEN                   : integer := 1;
			USE_ARSIZE                  : integer := 1;
			USE_ARBURST                 : integer := 1;
			USE_ARLOCK                  : integer := 1;
			USE_ARCACHE                 : integer := 1;
			USE_ARQOS                   : integer := 1;
			USE_RID                     : integer := 1;
			USE_RRESP                   : integer := 1;
			USE_RLAST                   : integer := 1;
			USE_AWUSER                  : integer := 1;
			USE_ARUSER                  : integer := 1;
			USE_WUSER                   : integer := 1;
			USE_RUSER                   : integer := 1;
			USE_BUSER                   : integer := 1
		);
		port (
			awlen    : out std_logic_vector(7 downto 0);                      -- awlen
			awsize   : out std_logic_vector(2 downto 0);                      -- awsize
			awburst  : out std_logic_vector(1 downto 0);                      -- awburst
			awvalid  : out std_logic;                                         -- awvalid
			awlock   : out std_logic;                                         -- awlock
			awregion : out std_logic_vector(3 downto 0);                      -- awregion
			awprot   : out std_logic_vector(2 downto 0);                      -- awprot
			awready  : in  std_logic                      := 'X';             -- awready
			arlen    : out std_logic_vector(7 downto 0);                      -- arlen
			arsize   : out std_logic_vector(2 downto 0);                      -- arsize
			arburst  : out std_logic_vector(1 downto 0);                      -- arburst
			arvalid  : out std_logic;                                         -- arvalid
			arlock   : out std_logic;                                         -- arlock
			awcache  : out std_logic_vector(3 downto 0);                      -- awcache
			awqos    : out std_logic_vector(3 downto 0);                      -- awqos
			arregion : out std_logic_vector(3 downto 0);                      -- arregion
			arprot   : out std_logic_vector(2 downto 0);                      -- arprot
			arready  : in  std_logic                      := 'X';             -- arready
			rresp    : in  std_logic_vector(1 downto 0)   := (others => 'X'); -- rresp
			rvalid   : in  std_logic                      := 'X';             -- rvalid
			rlast    : in  std_logic                      := 'X';             -- rlast
			rready   : out std_logic;                                         -- rready
			wvalid   : out std_logic;                                         -- wvalid
			wlast    : out std_logic;                                         -- wlast
			wready   : in  std_logic                      := 'X';             -- wready
			bresp    : in  std_logic_vector(1 downto 0)   := (others => 'X'); -- bresp
			bvalid   : in  std_logic                      := 'X';             -- bvalid
			bready   : out std_logic;                                         -- bready
			arcache  : out std_logic_vector(3 downto 0);                      -- arcache
			arqos    : out std_logic_vector(3 downto 0);                      -- arqos
			awaddr   : out std_logic_vector(19 downto 0);                     -- awaddr
			awid     : out std_logic_vector(3 downto 0);                      -- awid
			awuser   : out std_logic_vector(31 downto 0);                     -- awuser
			araddr   : out std_logic_vector(19 downto 0);                     -- araddr
			arid     : out std_logic_vector(3 downto 0);                      -- arid
			aruser   : out std_logic_vector(31 downto 0);                     -- aruser
			ruser    : in  std_logic_vector(31 downto 0)  := (others => 'X'); -- ruser
			wuser    : out std_logic_vector(31 downto 0);                     -- wuser
			buser    : in  std_logic_vector(31 downto 0)  := (others => 'X'); -- buser
			rdata    : in  std_logic_vector(255 downto 0) := (others => 'X'); -- rdata
			rid      : in  std_logic_vector(3 downto 0)   := (others => 'X'); -- rid
			wdata    : out std_logic_vector(255 downto 0);                    -- wdata
			wstrb    : out std_logic_vector(31 downto 0);                     -- wstrb
			bid      : in  std_logic_vector(3 downto 0)   := (others => 'X'); -- bid
			clk      : in  std_logic                      := 'X';             -- clk
			rstn     : in  std_logic                      := 'X'              -- reset_n
		);
	end component axi4_mgr;

	u0 : component axi4_mgr
		generic map (
			ADDR_WIDTH                  => INTEGER_VALUE_FOR_ADDR_WIDTH,
			DATA_WIDTH                  => INTEGER_VALUE_FOR_DATA_WIDTH,
			ID_WIDTH                    => INTEGER_VALUE_FOR_ID_WIDTH,
			USER_WIDTH                  => INTEGER_VALUE_FOR_USER_WIDTH,
			RD_ISSUING_CAPABILITY       => INTEGER_VALUE_FOR_RD_ISSUING_CAPABILITY,
			WR_ISSUING_CAPABILITY       => INTEGER_VALUE_FOR_WR_ISSUING_CAPABILITY,
			COMBINED_ISSUING_CAPABILITY => INTEGER_VALUE_FOR_COMBINED_ISSUING_CAPABILITY,
			USE_AWID                    => INTEGER_VALUE_FOR_USE_AWID,
			USE_AWREGION                => INTEGER_VALUE_FOR_USE_AWREGION,
			USE_AWLEN                   => INTEGER_VALUE_FOR_USE_AWLEN,
			USE_AWSIZE                  => INTEGER_VALUE_FOR_USE_AWSIZE,
			USE_AWBURST                 => INTEGER_VALUE_FOR_USE_AWBURST,
			USE_AWLOCK                  => INTEGER_VALUE_FOR_USE_AWLOCK,
			USE_AWCACHE                 => INTEGER_VALUE_FOR_USE_AWCACHE,
			USE_AWQOS                   => INTEGER_VALUE_FOR_USE_AWQOS,
			USE_WSTRB                   => INTEGER_VALUE_FOR_USE_WSTRB,
			USE_BID                     => INTEGER_VALUE_FOR_USE_BID,
			USE_BRESP                   => INTEGER_VALUE_FOR_USE_BRESP,
			USE_ARID                    => INTEGER_VALUE_FOR_USE_ARID,
			USE_ARREGION                => INTEGER_VALUE_FOR_USE_ARREGION,
			USE_ARLEN                   => INTEGER_VALUE_FOR_USE_ARLEN,
			USE_ARSIZE                  => INTEGER_VALUE_FOR_USE_ARSIZE,
			USE_ARBURST                 => INTEGER_VALUE_FOR_USE_ARBURST,
			USE_ARLOCK                  => INTEGER_VALUE_FOR_USE_ARLOCK,
			USE_ARCACHE                 => INTEGER_VALUE_FOR_USE_ARCACHE,
			USE_ARQOS                   => INTEGER_VALUE_FOR_USE_ARQOS,
			USE_RID                     => INTEGER_VALUE_FOR_USE_RID,
			USE_RRESP                   => INTEGER_VALUE_FOR_USE_RRESP,
			USE_RLAST                   => INTEGER_VALUE_FOR_USE_RLAST,
			USE_AWUSER                  => INTEGER_VALUE_FOR_USE_AWUSER,
			USE_ARUSER                  => INTEGER_VALUE_FOR_USE_ARUSER,
			USE_WUSER                   => INTEGER_VALUE_FOR_USE_WUSER,
			USE_RUSER                   => INTEGER_VALUE_FOR_USE_RUSER,
			USE_BUSER                   => INTEGER_VALUE_FOR_USE_BUSER
		)
		port map (
			awlen    => CONNECTED_TO_awlen,    -- altera_axi4_manager.awlen
			awsize   => CONNECTED_TO_awsize,   --                    .awsize
			awburst  => CONNECTED_TO_awburst,  --                    .awburst
			awvalid  => CONNECTED_TO_awvalid,  --                    .awvalid
			awlock   => CONNECTED_TO_awlock,   --                    .awlock
			awregion => CONNECTED_TO_awregion, --                    .awregion
			awprot   => CONNECTED_TO_awprot,   --                    .awprot
			awready  => CONNECTED_TO_awready,  --                    .awready
			arlen    => CONNECTED_TO_arlen,    --                    .arlen
			arsize   => CONNECTED_TO_arsize,   --                    .arsize
			arburst  => CONNECTED_TO_arburst,  --                    .arburst
			arvalid  => CONNECTED_TO_arvalid,  --                    .arvalid
			arlock   => CONNECTED_TO_arlock,   --                    .arlock
			awcache  => CONNECTED_TO_awcache,  --                    .awcache
			awqos    => CONNECTED_TO_awqos,    --                    .awqos
			arregion => CONNECTED_TO_arregion, --                    .arregion
			arprot   => CONNECTED_TO_arprot,   --                    .arprot
			arready  => CONNECTED_TO_arready,  --                    .arready
			rresp    => CONNECTED_TO_rresp,    --                    .rresp
			rvalid   => CONNECTED_TO_rvalid,   --                    .rvalid
			rlast    => CONNECTED_TO_rlast,    --                    .rlast
			rready   => CONNECTED_TO_rready,   --                    .rready
			wvalid   => CONNECTED_TO_wvalid,   --                    .wvalid
			wlast    => CONNECTED_TO_wlast,    --                    .wlast
			wready   => CONNECTED_TO_wready,   --                    .wready
			bresp    => CONNECTED_TO_bresp,    --                    .bresp
			bvalid   => CONNECTED_TO_bvalid,   --                    .bvalid
			bready   => CONNECTED_TO_bready,   --                    .bready
			arcache  => CONNECTED_TO_arcache,  --                    .arcache
			arqos    => CONNECTED_TO_arqos,    --                    .arqos
			awaddr   => CONNECTED_TO_awaddr,   --                    .awaddr
			awid     => CONNECTED_TO_awid,     --                    .awid
			awuser   => CONNECTED_TO_awuser,   --                    .awuser
			araddr   => CONNECTED_TO_araddr,   --                    .araddr
			arid     => CONNECTED_TO_arid,     --                    .arid
			aruser   => CONNECTED_TO_aruser,   --                    .aruser
			ruser    => CONNECTED_TO_ruser,    --                    .ruser
			wuser    => CONNECTED_TO_wuser,    --                    .wuser
			buser    => CONNECTED_TO_buser,    --                    .buser
			rdata    => CONNECTED_TO_rdata,    --                    .rdata
			rid      => CONNECTED_TO_rid,      --                    .rid
			wdata    => CONNECTED_TO_wdata,    --                    .wdata
			wstrb    => CONNECTED_TO_wstrb,    --                    .wstrb
			bid      => CONNECTED_TO_bid,      --                    .bid
			clk      => CONNECTED_TO_clk,      --          clock_sink.clk
			rstn     => CONNECTED_TO_rstn      --          reset_sink.reset_n
		);

