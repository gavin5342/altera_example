module axi4_sub_wide #(
		parameter ADDR_WIDTH                     = 20,
		parameter DATA_WIDTH                     = 256,
		parameter ID_WIDTH                       = 5,
		parameter USER_WIDTH                     = 32,
		parameter RD_ACCEPTANCE_CAPABILITY       = 16,
		parameter WR_ACCEPTANCE_CAPABILITY       = 16,
		parameter COMBINED_ACCEPTANCE_CAPABILITY = 16,
		parameter USE_AWREGION                   = 1,
		parameter USE_AWLOCK                     = 1,
		parameter USE_AWCACHE                    = 1,
		parameter USE_AWQOS                      = 1,
		parameter USE_AWPROT                     = 1,
		parameter USE_WLAST                      = 1,
		parameter USE_BRESP                      = 1,
		parameter USE_ARREGION                   = 1,
		parameter USE_ARLOCK                     = 1,
		parameter USE_ARCACHE                    = 1,
		parameter USE_ARQOS                      = 1,
		parameter USE_ARPROT                     = 1,
		parameter USE_RRESP                      = 1,
		parameter USE_AWUSER                     = 1,
		parameter USE_ARUSER                     = 1,
		parameter USE_WUSER                      = 1,
		parameter USE_RUSER                      = 1,
		parameter USE_BUSER                      = 1
	) (
		input  wire [7:0]   awlen,    // altera_axi4_subordinate.awlen
		input  wire [2:0]   awsize,   //                        .awsize
		input  wire [1:0]   awburst,  //                        .awburst
		input  wire         awvalid,  //                        .awvalid
		input  wire         awlock,   //                        .awlock
		input  wire [3:0]   awregion, //                        .awregion
		input  wire [2:0]   awprot,   //                        .awprot
		output wire         awready,  //                        .awready
		input  wire [7:0]   arlen,    //                        .arlen
		input  wire [2:0]   arsize,   //                        .arsize
		input  wire [1:0]   arburst,  //                        .arburst
		input  wire         arvalid,  //                        .arvalid
		input  wire         arlock,   //                        .arlock
		input  wire [3:0]   arregion, //                        .arregion
		input  wire [3:0]   awcache,  //                        .awcache
		input  wire [3:0]   awqos,    //                        .awqos
		input  wire [2:0]   arprot,   //                        .arprot
		output wire         arready,  //                        .arready
		output wire         rvalid,   //                        .rvalid
		output wire         rlast,    //                        .rlast
		output wire [1:0]   rresp,    //                        .rresp
		input  wire         rready,   //                        .rready
		input  wire         wvalid,   //                        .wvalid
		input  wire         wlast,    //                        .wlast
		output wire         wready,   //                        .wready
		output wire [1:0]   bresp,    //                        .bresp
		output wire         bvalid,   //                        .bvalid
		input  wire         bready,   //                        .bready
		input  wire [3:0]   arcache,  //                        .arcache
		input  wire [3:0]   arqos,    //                        .arqos
		input  wire [19:0]  awaddr,   //                        .awaddr
		input  wire [4:0]   awid,     //                        .awid
		input  wire [31:0]  awuser,   //                        .awuser
		input  wire [19:0]  araddr,   //                        .araddr
		input  wire [4:0]   arid,     //                        .arid
		input  wire [31:0]  aruser,   //                        .aruser
		output wire [31:0]  ruser,    //                        .ruser
		input  wire [31:0]  wuser,    //                        .wuser
		output wire [31:0]  buser,    //                        .buser
		output wire [255:0] rdata,    //                        .rdata
		output wire [4:0]   rid,      //                        .rid
		input  wire [255:0] wdata,    //                        .wdata
		input  wire [31:0]  wstrb,    //                        .wstrb
		output wire [4:0]   bid,      //                        .bid
		input  wire         clk,      //              clock_sink.clk
		input  wire         rstn      //              reset_sink.reset_n
	);
endmodule

