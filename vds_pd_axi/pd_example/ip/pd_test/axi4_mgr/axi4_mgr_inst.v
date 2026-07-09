	axi4_mgr #(
		.ADDR_WIDTH                  (INTEGER_VALUE_FOR_ADDR_WIDTH),
		.DATA_WIDTH                  (INTEGER_VALUE_FOR_DATA_WIDTH),
		.ID_WIDTH                    (INTEGER_VALUE_FOR_ID_WIDTH),
		.USER_WIDTH                  (INTEGER_VALUE_FOR_USER_WIDTH),
		.RD_ISSUING_CAPABILITY       (INTEGER_VALUE_FOR_RD_ISSUING_CAPABILITY),
		.WR_ISSUING_CAPABILITY       (INTEGER_VALUE_FOR_WR_ISSUING_CAPABILITY),
		.COMBINED_ISSUING_CAPABILITY (INTEGER_VALUE_FOR_COMBINED_ISSUING_CAPABILITY),
		.USE_AWID                    (INTEGER_VALUE_FOR_USE_AWID),
		.USE_AWREGION                (INTEGER_VALUE_FOR_USE_AWREGION),
		.USE_AWLEN                   (INTEGER_VALUE_FOR_USE_AWLEN),
		.USE_AWSIZE                  (INTEGER_VALUE_FOR_USE_AWSIZE),
		.USE_AWBURST                 (INTEGER_VALUE_FOR_USE_AWBURST),
		.USE_AWLOCK                  (INTEGER_VALUE_FOR_USE_AWLOCK),
		.USE_AWCACHE                 (INTEGER_VALUE_FOR_USE_AWCACHE),
		.USE_AWQOS                   (INTEGER_VALUE_FOR_USE_AWQOS),
		.USE_WSTRB                   (INTEGER_VALUE_FOR_USE_WSTRB),
		.USE_BID                     (INTEGER_VALUE_FOR_USE_BID),
		.USE_BRESP                   (INTEGER_VALUE_FOR_USE_BRESP),
		.USE_ARID                    (INTEGER_VALUE_FOR_USE_ARID),
		.USE_ARREGION                (INTEGER_VALUE_FOR_USE_ARREGION),
		.USE_ARLEN                   (INTEGER_VALUE_FOR_USE_ARLEN),
		.USE_ARSIZE                  (INTEGER_VALUE_FOR_USE_ARSIZE),
		.USE_ARBURST                 (INTEGER_VALUE_FOR_USE_ARBURST),
		.USE_ARLOCK                  (INTEGER_VALUE_FOR_USE_ARLOCK),
		.USE_ARCACHE                 (INTEGER_VALUE_FOR_USE_ARCACHE),
		.USE_ARQOS                   (INTEGER_VALUE_FOR_USE_ARQOS),
		.USE_RID                     (INTEGER_VALUE_FOR_USE_RID),
		.USE_RRESP                   (INTEGER_VALUE_FOR_USE_RRESP),
		.USE_RLAST                   (INTEGER_VALUE_FOR_USE_RLAST),
		.USE_AWUSER                  (INTEGER_VALUE_FOR_USE_AWUSER),
		.USE_ARUSER                  (INTEGER_VALUE_FOR_USE_ARUSER),
		.USE_WUSER                   (INTEGER_VALUE_FOR_USE_WUSER),
		.USE_RUSER                   (INTEGER_VALUE_FOR_USE_RUSER),
		.USE_BUSER                   (INTEGER_VALUE_FOR_USE_BUSER)
	) u0 (
		.awlen    (_connected_to_awlen_),    //  output,    width = 8, altera_axi4_manager.awlen
		.awsize   (_connected_to_awsize_),   //  output,    width = 3,                    .awsize
		.awburst  (_connected_to_awburst_),  //  output,    width = 2,                    .awburst
		.awvalid  (_connected_to_awvalid_),  //  output,    width = 1,                    .awvalid
		.awlock   (_connected_to_awlock_),   //  output,    width = 1,                    .awlock
		.awregion (_connected_to_awregion_), //  output,    width = 4,                    .awregion
		.awprot   (_connected_to_awprot_),   //  output,    width = 3,                    .awprot
		.awready  (_connected_to_awready_),  //   input,    width = 1,                    .awready
		.arlen    (_connected_to_arlen_),    //  output,    width = 8,                    .arlen
		.arsize   (_connected_to_arsize_),   //  output,    width = 3,                    .arsize
		.arburst  (_connected_to_arburst_),  //  output,    width = 2,                    .arburst
		.arvalid  (_connected_to_arvalid_),  //  output,    width = 1,                    .arvalid
		.arlock   (_connected_to_arlock_),   //  output,    width = 1,                    .arlock
		.awcache  (_connected_to_awcache_),  //  output,    width = 4,                    .awcache
		.awqos    (_connected_to_awqos_),    //  output,    width = 4,                    .awqos
		.arregion (_connected_to_arregion_), //  output,    width = 4,                    .arregion
		.arprot   (_connected_to_arprot_),   //  output,    width = 3,                    .arprot
		.arready  (_connected_to_arready_),  //   input,    width = 1,                    .arready
		.rresp    (_connected_to_rresp_),    //   input,    width = 2,                    .rresp
		.rvalid   (_connected_to_rvalid_),   //   input,    width = 1,                    .rvalid
		.rlast    (_connected_to_rlast_),    //   input,    width = 1,                    .rlast
		.rready   (_connected_to_rready_),   //  output,    width = 1,                    .rready
		.wvalid   (_connected_to_wvalid_),   //  output,    width = 1,                    .wvalid
		.wlast    (_connected_to_wlast_),    //  output,    width = 1,                    .wlast
		.wready   (_connected_to_wready_),   //   input,    width = 1,                    .wready
		.bresp    (_connected_to_bresp_),    //   input,    width = 2,                    .bresp
		.bvalid   (_connected_to_bvalid_),   //   input,    width = 1,                    .bvalid
		.bready   (_connected_to_bready_),   //  output,    width = 1,                    .bready
		.arcache  (_connected_to_arcache_),  //  output,    width = 4,                    .arcache
		.arqos    (_connected_to_arqos_),    //  output,    width = 4,                    .arqos
		.awaddr   (_connected_to_awaddr_),   //  output,   width = 20,                    .awaddr
		.awid     (_connected_to_awid_),     //  output,    width = 4,                    .awid
		.awuser   (_connected_to_awuser_),   //  output,   width = 32,                    .awuser
		.araddr   (_connected_to_araddr_),   //  output,   width = 20,                    .araddr
		.arid     (_connected_to_arid_),     //  output,    width = 4,                    .arid
		.aruser   (_connected_to_aruser_),   //  output,   width = 32,                    .aruser
		.ruser    (_connected_to_ruser_),    //   input,   width = 32,                    .ruser
		.wuser    (_connected_to_wuser_),    //  output,   width = 32,                    .wuser
		.buser    (_connected_to_buser_),    //   input,   width = 32,                    .buser
		.rdata    (_connected_to_rdata_),    //   input,  width = 256,                    .rdata
		.rid      (_connected_to_rid_),      //   input,    width = 4,                    .rid
		.wdata    (_connected_to_wdata_),    //  output,  width = 256,                    .wdata
		.wstrb    (_connected_to_wstrb_),    //  output,   width = 32,                    .wstrb
		.bid      (_connected_to_bid_),      //   input,    width = 4,                    .bid
		.clk      (_connected_to_clk_),      //   input,    width = 1,          clock_sink.clk
		.rstn     (_connected_to_rstn_)      //   input,    width = 1,          reset_sink.reset_n
	);

