`define N_MASTER pd_test.axi4_mgr_narrow.axi4_mgr_narrow
`define W_MASTER pd_test.axi4_mgr_wide.axi4_mgr
`define W_SUB pd_test.axi4_sub_wide.axi4_sub_wide

module pd_test_stim ();

import altera_lnsim_ver.altera_axi_bfm_pkg::*;
import altera_lnsim_ver.host_memory_class_pkg::*;

//transactions
AlteraAxiTransaction wr_tr, long_rd_tr, short_rd_tr, wr_resp, rd_resp;

BaseAxiBfm#(
	.ADDR_WIDTH_B(32'd23),
	.DATA_WIDTH_B(32'd32),
	.ID_WIDTH_B(32'd4),
	.USER_WIDTH_B(32'd32)
	) axi_narrow_mgr_bfm;

BaseAxiBfm#(
	.ADDR_WIDTH_B(32'd20),
	.DATA_WIDTH_B(32'd256),
	.ID_WIDTH_B(32'h4),
	.USER_WIDTH_B(32'd32)
	) axi_wide_mgr_bfm;

BaseAxiBfm#(
	.ADDR_WIDTH_B(32'd20),
	.DATA_WIDTH_B(32'd256),
	.ID_WIDTH_B(32'h5),
	.USER_WIDTH_B(32'd32)
	) axi_wide_sub_bfm;

int i; // loopvar
byte_t init_buf[];

initial begin : sub_ctl	
	axi_wide_sub_bfm = `W_SUB.AXI4SUB.bfm;
	axi_wide_sub_bfm.s_reset();
	wr_resp = axi_wide_sub_bfm.subordinate_bfm_wr_resp_tx();
	rd_resp = axi_wide_sub_bfm.subordinate_bfm_rd_resp_tx();

	//init data
	init_buf = new['h10000];
	`W_SUB.host_memory.initialize_data(0, init_buf);

	//always respond to writes & reads
	fork 
		forever begin
			axi_wide_sub_bfm.execute_transaction(wr_resp);
		end
		forever begin
			axi_wide_sub_bfm.execute_transaction(rd_resp);
		end
	join
end

initial begin : master_ctl
	//Assign our base object to the AXI BFM (should have dones this by
	//passing a reference to the interface - next time...
	axi_narrow_mgr_bfm = `N_MASTER.AXI4MAN.bfm;
	axi_wide_mgr_bfm = `W_MASTER.AXI4MAN.bfm;
	//wait on reset
	fork 
		axi_narrow_mgr_bfm.m_reset();
		axi_wide_mgr_bfm.m_reset();
	join
	//create write
	wr_tr = axi_narrow_mgr_bfm.manager_bfm_wr_tx();
	wr_tr.set_id(1);
	wr_tr.set_awaddr(0);
	wr_tr.set_burst_length(3);
	wr_tr.set_size(AXI4_BYTES_8);
	wr_tr.set_burst_type(BURST_TYPE_INCR);

	//send write
	$display("Start write");
	axi_narrow_mgr_bfm.execute_transaction(wr_tr);
	$display("end write");

	//create reads
	long_rd_tr = axi_wide_mgr_bfm.manager_bfm_rd_tx();
	short_rd_tr = axi_narrow_mgr_bfm.manager_bfm_rd_tx();
	long_rd_tr.set_id(1);
	short_rd_tr.set_id(1);
	long_rd_tr.set_araddr(0);
	short_rd_tr.set_araddr(23'h1000);
	long_rd_tr.set_burst_length('d31);
	short_rd_tr.set_burst_length('d0);
	long_rd_tr.set_size(AXI4_BYTES_32);
	short_rd_tr.set_size(AXI4_BYTES_4);
	long_rd_tr.set_burst_type(BURST_TYPE_INCR);
	short_rd_tr.set_burst_type(BURST_TYPE_INCR);
 	fork
	begin	
		for (i = 0; i < 7; i++) begin
			long_rd_tr.set_araddr(i*100);
		       repeat (2) axi_wide_mgr_bfm.posedge_clk;
			axi_wide_mgr_bfm.execute_transaction(long_rd_tr);
			//stray narrow
			if (i == 3) begin
				axi_narrow_mgr_bfm.posedge_clk;
				axi_narrow_mgr_bfm.execute_transaction(short_rd_tr);
			end
			$display("submit read %x", i);
		end
	end
	begin
		if (i == 3) begin
			axi_narrow_mgr_bfm.posedge_clk;
			axi_narrow_mgr_bfm.execute_transaction(short_rd_tr);
		end
	end
	join	

end


endmodule
