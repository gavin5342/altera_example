module axi4_mgr_narrow #(
		parameter ADDR_WIDTH                  = 23,
		parameter DATA_WIDTH                  = 32,
		parameter ID_WIDTH                    = 4,
		parameter USER_WIDTH                  = 32,
		parameter RD_ISSUING_CAPABILITY       = 16,
		parameter WR_ISSUING_CAPABILITY       = 16,
		parameter COMBINED_ISSUING_CAPABILITY = 16,
		parameter USE_AWID                    = 1,
		parameter USE_AWREGION                = 1,
		parameter USE_AWLEN                   = 1,
		parameter USE_AWSIZE                  = 1,
		parameter USE_AWBURST                 = 1,
		parameter USE_AWLOCK                  = 1,
		parameter USE_AWCACHE                 = 1,
		parameter USE_AWQOS                   = 1,
		parameter USE_WSTRB                   = 1,
		parameter USE_BID                     = 1,
		parameter USE_BRESP                   = 1,
		parameter USE_ARID                    = 1,
		parameter USE_ARREGION                = 1,
		parameter USE_ARLEN                   = 1,
		parameter USE_ARSIZE                  = 1,
		parameter USE_ARBURST                 = 1,
		parameter USE_ARLOCK                  = 1,
		parameter USE_ARCACHE                 = 1,
		parameter USE_ARQOS                   = 1,
		parameter USE_RID                     = 1,
		parameter USE_RRESP                   = 1,
		parameter USE_RLAST                   = 1,
		parameter USE_AWUSER                  = 1,
		parameter USE_ARUSER                  = 1,
		parameter USE_WUSER                   = 1,
		parameter USE_RUSER                   = 1,
		parameter USE_BUSER                   = 1
	) (
		output wire [7:0]  awlen,    // altera_axi4_manager.awlen
		output wire [2:0]  awsize,   //                    .awsize
		output wire [1:0]  awburst,  //                    .awburst
		output wire        awvalid,  //                    .awvalid
		output wire        awlock,   //                    .awlock
		output wire [3:0]  awregion, //                    .awregion
		output wire [2:0]  awprot,   //                    .awprot
		input  wire        awready,  //                    .awready
		output wire [7:0]  arlen,    //                    .arlen
		output wire [2:0]  arsize,   //                    .arsize
		output wire [1:0]  arburst,  //                    .arburst
		output wire        arvalid,  //                    .arvalid
		output wire        arlock,   //                    .arlock
		output wire [3:0]  awcache,  //                    .awcache
		output wire [3:0]  awqos,    //                    .awqos
		output wire [3:0]  arregion, //                    .arregion
		output wire [2:0]  arprot,   //                    .arprot
		input  wire        arready,  //                    .arready
		input  wire [1:0]  rresp,    //                    .rresp
		input  wire        rvalid,   //                    .rvalid
		input  wire        rlast,    //                    .rlast
		output wire        rready,   //                    .rready
		output wire        wvalid,   //                    .wvalid
		output wire        wlast,    //                    .wlast
		input  wire        wready,   //                    .wready
		input  wire [1:0]  bresp,    //                    .bresp
		input  wire        bvalid,   //                    .bvalid
		output wire        bready,   //                    .bready
		output wire [3:0]  arcache,  //                    .arcache
		output wire [3:0]  arqos,    //                    .arqos
		output wire [22:0] awaddr,   //                    .awaddr
		output wire [3:0]  awid,     //                    .awid
		output wire [31:0] awuser,   //                    .awuser
		output wire [22:0] araddr,   //                    .araddr
		output wire [3:0]  arid,     //                    .arid
		output wire [31:0] aruser,   //                    .aruser
		input  wire [31:0] ruser,    //                    .ruser
		output wire [31:0] wuser,    //                    .wuser
		input  wire [31:0] buser,    //                    .buser
		input  wire [31:0] rdata,    //                    .rdata
		input  wire [3:0]  rid,      //                    .rid
		output wire [31:0] wdata,    //                    .wdata
		output wire [3:0]  wstrb,    //                    .wstrb
		input  wire [3:0]  bid,      //                    .bid
		input  wire        clk,      //          clock_sink.clk
		input  wire        rstn      //          reset_sink.reset_n
	);
endmodule

