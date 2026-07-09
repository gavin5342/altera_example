	axi4_sub_wide #(
		.ADDR_WIDTH                     (INTEGER_VALUE_FOR_ADDR_WIDTH),
		.DATA_WIDTH                     (INTEGER_VALUE_FOR_DATA_WIDTH),
		.ID_WIDTH                       (INTEGER_VALUE_FOR_ID_WIDTH),
		.USER_WIDTH                     (INTEGER_VALUE_FOR_USER_WIDTH),
		.RD_ACCEPTANCE_CAPABILITY       (INTEGER_VALUE_FOR_RD_ACCEPTANCE_CAPABILITY),
		.WR_ACCEPTANCE_CAPABILITY       (INTEGER_VALUE_FOR_WR_ACCEPTANCE_CAPABILITY),
		.COMBINED_ACCEPTANCE_CAPABILITY (INTEGER_VALUE_FOR_COMBINED_ACCEPTANCE_CAPABILITY),
		.USE_AWREGION                   (INTEGER_VALUE_FOR_USE_AWREGION),
		.USE_AWLOCK                     (INTEGER_VALUE_FOR_USE_AWLOCK),
		.USE_AWCACHE                    (INTEGER_VALUE_FOR_USE_AWCACHE),
		.USE_AWQOS                      (INTEGER_VALUE_FOR_USE_AWQOS),
		.USE_AWPROT                     (INTEGER_VALUE_FOR_USE_AWPROT),
		.USE_WLAST                      (INTEGER_VALUE_FOR_USE_WLAST),
		.USE_BRESP                      (INTEGER_VALUE_FOR_USE_BRESP),
		.USE_ARREGION                   (INTEGER_VALUE_FOR_USE_ARREGION),
		.USE_ARLOCK                     (INTEGER_VALUE_FOR_USE_ARLOCK),
		.USE_ARCACHE                    (INTEGER_VALUE_FOR_USE_ARCACHE),
		.USE_ARQOS                      (INTEGER_VALUE_FOR_USE_ARQOS),
		.USE_ARPROT                     (INTEGER_VALUE_FOR_USE_ARPROT),
		.USE_RRESP                      (INTEGER_VALUE_FOR_USE_RRESP),
		.USE_AWUSER                     (INTEGER_VALUE_FOR_USE_AWUSER),
		.USE_ARUSER                     (INTEGER_VALUE_FOR_USE_ARUSER),
		.USE_WUSER                      (INTEGER_VALUE_FOR_USE_WUSER),
		.USE_RUSER                      (INTEGER_VALUE_FOR_USE_RUSER),
		.USE_BUSER                      (INTEGER_VALUE_FOR_USE_BUSER)
	) u0 (
		.awlen    (_connected_to_awlen_),    //   input,    width = 8, altera_axi4_subordinate.awlen
		.awsize   (_connected_to_awsize_),   //   input,    width = 3,                        .awsize
		.awburst  (_connected_to_awburst_),  //   input,    width = 2,                        .awburst
		.awvalid  (_connected_to_awvalid_),  //   input,    width = 1,                        .awvalid
		.awlock   (_connected_to_awlock_),   //   input,    width = 1,                        .awlock
		.awregion (_connected_to_awregion_), //   input,    width = 4,                        .awregion
		.awprot   (_connected_to_awprot_),   //   input,    width = 3,                        .awprot
		.awready  (_connected_to_awready_),  //  output,    width = 1,                        .awready
		.arlen    (_connected_to_arlen_),    //   input,    width = 8,                        .arlen
		.arsize   (_connected_to_arsize_),   //   input,    width = 3,                        .arsize
		.arburst  (_connected_to_arburst_),  //   input,    width = 2,                        .arburst
		.arvalid  (_connected_to_arvalid_),  //   input,    width = 1,                        .arvalid
		.arlock   (_connected_to_arlock_),   //   input,    width = 1,                        .arlock
		.arregion (_connected_to_arregion_), //   input,    width = 4,                        .arregion
		.awcache  (_connected_to_awcache_),  //   input,    width = 4,                        .awcache
		.awqos    (_connected_to_awqos_),    //   input,    width = 4,                        .awqos
		.arprot   (_connected_to_arprot_),   //   input,    width = 3,                        .arprot
		.arready  (_connected_to_arready_),  //  output,    width = 1,                        .arready
		.rvalid   (_connected_to_rvalid_),   //  output,    width = 1,                        .rvalid
		.rlast    (_connected_to_rlast_),    //  output,    width = 1,                        .rlast
		.rresp    (_connected_to_rresp_),    //  output,    width = 2,                        .rresp
		.rready   (_connected_to_rready_),   //   input,    width = 1,                        .rready
		.wvalid   (_connected_to_wvalid_),   //   input,    width = 1,                        .wvalid
		.wlast    (_connected_to_wlast_),    //   input,    width = 1,                        .wlast
		.wready   (_connected_to_wready_),   //  output,    width = 1,                        .wready
		.bresp    (_connected_to_bresp_),    //  output,    width = 2,                        .bresp
		.bvalid   (_connected_to_bvalid_),   //  output,    width = 1,                        .bvalid
		.bready   (_connected_to_bready_),   //   input,    width = 1,                        .bready
		.arcache  (_connected_to_arcache_),  //   input,    width = 4,                        .arcache
		.arqos    (_connected_to_arqos_),    //   input,    width = 4,                        .arqos
		.awaddr   (_connected_to_awaddr_),   //   input,   width = 20,                        .awaddr
		.awid     (_connected_to_awid_),     //   input,    width = 5,                        .awid
		.awuser   (_connected_to_awuser_),   //   input,   width = 32,                        .awuser
		.araddr   (_connected_to_araddr_),   //   input,   width = 20,                        .araddr
		.arid     (_connected_to_arid_),     //   input,    width = 5,                        .arid
		.aruser   (_connected_to_aruser_),   //   input,   width = 32,                        .aruser
		.ruser    (_connected_to_ruser_),    //  output,   width = 32,                        .ruser
		.wuser    (_connected_to_wuser_),    //   input,   width = 32,                        .wuser
		.buser    (_connected_to_buser_),    //  output,   width = 32,                        .buser
		.rdata    (_connected_to_rdata_),    //  output,  width = 256,                        .rdata
		.rid      (_connected_to_rid_),      //  output,    width = 5,                        .rid
		.wdata    (_connected_to_wdata_),    //   input,  width = 256,                        .wdata
		.wstrb    (_connected_to_wstrb_),    //   input,   width = 32,                        .wstrb
		.bid      (_connected_to_bid_),      //  output,    width = 5,                        .bid
		.clk      (_connected_to_clk_),      //   input,    width = 1,              clock_sink.clk
		.rstn     (_connected_to_rstn_)      //   input,    width = 1,              reset_sink.reset_n
	);

