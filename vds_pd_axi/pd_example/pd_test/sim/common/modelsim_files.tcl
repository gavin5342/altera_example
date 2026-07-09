source [file join [file dirname [info script]] ./../../../ip/pd_test/axi4_sub_wide/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/pd_test/axi4_mgr_narrow/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/pd_test/rst_src/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/pd_test/clk_src1/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/pd_test/clk_src2/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/pd_test/axi4_mgr/sim/common/modelsim_files.tcl]

namespace eval pd_test {
  proc get_design_libraries {} {
    set libraries [dict create]
    set libraries [dict merge $libraries [axi4_sub_wide::get_design_libraries]]
    set libraries [dict merge $libraries [axi4_mgr_narrow::get_design_libraries]]
    set libraries [dict merge $libraries [rst_src::get_design_libraries]]
    set libraries [dict merge $libraries [clk_src1::get_design_libraries]]
    set libraries [dict merge $libraries [clk_src2::get_design_libraries]]
    set libraries [dict merge $libraries [axi4_mgr::get_design_libraries]]
    dict set libraries altera_merlin_axi_translator_1987    1
    dict set libraries altera_merlin_axi_master_ni_19117    1
    dict set libraries altera_avalon_sc_fifo_1932           1
    dict set libraries altera_merlin_axi_slave_ni_19129     1
    dict set libraries altera_avalon_st_pipeline_stage_1930 1
    dict set libraries altera_merlin_router_1921            1
    dict set libraries altera_merlin_demultiplexer_1921     1
    dict set libraries altera_merlin_multiplexer_1922       1
    dict set libraries altera_merlin_width_adapter_1961     1
    dict set libraries st_dc_fifo_1953                      1
    dict set libraries altera_mm_interconnect_1920          1
    dict set libraries altera_reset_controller_1924         1
    dict set libraries pd_test                              1
    return $libraries
  }
  
  proc get_memory_files {QSYS_SIMDIR QUARTUS_INSTALL_DIR} {
    set memory_files [list]
    set memory_files [concat $memory_files [axi4_sub_wide::get_memory_files "$QSYS_SIMDIR/../../ip/pd_test/axi4_sub_wide/sim/" "$QUARTUS_INSTALL_DIR"]]
    set memory_files [concat $memory_files [axi4_mgr_narrow::get_memory_files "$QSYS_SIMDIR/../../ip/pd_test/axi4_mgr_narrow/sim/" "$QUARTUS_INSTALL_DIR"]]
    set memory_files [concat $memory_files [rst_src::get_memory_files "$QSYS_SIMDIR/../../ip/pd_test/rst_src/sim/" "$QUARTUS_INSTALL_DIR"]]
    set memory_files [concat $memory_files [clk_src1::get_memory_files "$QSYS_SIMDIR/../../ip/pd_test/clk_src1/sim/" "$QUARTUS_INSTALL_DIR"]]
    set memory_files [concat $memory_files [clk_src2::get_memory_files "$QSYS_SIMDIR/../../ip/pd_test/clk_src2/sim/" "$QUARTUS_INSTALL_DIR"]]
    set memory_files [concat $memory_files [axi4_mgr::get_memory_files "$QSYS_SIMDIR/../../ip/pd_test/axi4_mgr/sim/" "$QUARTUS_INSTALL_DIR"]]
    return $memory_files
  }
  
  proc get_common_design_files {QSYS_SIMDIR} {
    set design_files [dict create]
    set design_files [dict merge $design_files [axi4_sub_wide::get_common_design_files "$QSYS_SIMDIR/../../ip/pd_test/axi4_sub_wide/sim/"]]
    set design_files [dict merge $design_files [axi4_mgr_narrow::get_common_design_files "$QSYS_SIMDIR/../../ip/pd_test/axi4_mgr_narrow/sim/"]]
    set design_files [dict merge $design_files [rst_src::get_common_design_files "$QSYS_SIMDIR/../../ip/pd_test/rst_src/sim/"]]
    set design_files [dict merge $design_files [clk_src1::get_common_design_files "$QSYS_SIMDIR/../../ip/pd_test/clk_src1/sim/"]]
    set design_files [dict merge $design_files [clk_src2::get_common_design_files "$QSYS_SIMDIR/../../ip/pd_test/clk_src2/sim/"]]
    set design_files [dict merge $design_files [axi4_mgr::get_common_design_files "$QSYS_SIMDIR/../../ip/pd_test/axi4_mgr/sim/"]]
    return $design_files
  }
  
  proc get_design_files {QSYS_SIMDIR QUARTUS_INSTALL_DIR} {
    set design_files [list]
    set design_files [concat $design_files [axi4_sub_wide::get_design_files "$QSYS_SIMDIR/../../ip/pd_test/axi4_sub_wide/sim/" "$QUARTUS_INSTALL_DIR"]]
    set design_files [concat $design_files [axi4_mgr_narrow::get_design_files "$QSYS_SIMDIR/../../ip/pd_test/axi4_mgr_narrow/sim/" "$QUARTUS_INSTALL_DIR"]]
    set design_files [concat $design_files [rst_src::get_design_files "$QSYS_SIMDIR/../../ip/pd_test/rst_src/sim/" "$QUARTUS_INSTALL_DIR"]]
    set design_files [concat $design_files [clk_src1::get_design_files "$QSYS_SIMDIR/../../ip/pd_test/clk_src1/sim/" "$QUARTUS_INSTALL_DIR"]]
    set design_files [concat $design_files [clk_src2::get_design_files "$QSYS_SIMDIR/../../ip/pd_test/clk_src2/sim/" "$QUARTUS_INSTALL_DIR"]]
    set design_files [concat $design_files [axi4_mgr::get_design_files "$QSYS_SIMDIR/../../ip/pd_test/axi4_mgr/sim/" "$QUARTUS_INSTALL_DIR"]]
    lappend design_files "-makelib altera_merlin_axi_translator_1987 \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_translator_1987/sim/pd_test_altera_merlin_axi_translator_1987_lty7xoq.sv"]\"   -end"                            
    lappend design_files "-makelib altera_merlin_axi_master_ni_19117 \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_master_ni_19117/sim/altera_merlin_address_alignment.sv"]\"   -end"                                              
    lappend design_files "-makelib altera_merlin_axi_master_ni_19117 \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_master_ni_19117/sim/pd_test_altera_merlin_axi_master_ni_19117_aq3hevq.sv"]\"   -end"                            
    lappend design_files "-makelib altera_avalon_sc_fifo_1932 \"[normalize_path "$QSYS_SIMDIR/../altera_avalon_sc_fifo_1932/sim/pd_test_altera_avalon_sc_fifo_1932_22gxxgi.v"]\"   -end"                                                  
    lappend design_files "-makelib altera_merlin_axi_slave_ni_19129 \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_19129/sim/pd_test_altera_merlin_axi_slave_ni_altera_avalon_sc_fifo_19129_3jmi5ry.v"]\"   -end"          
    lappend design_files "-makelib altera_avalon_st_pipeline_stage_1930 \"[normalize_path "$QSYS_SIMDIR/../altera_avalon_st_pipeline_stage_1930/sim/pd_test_altera_avalon_st_pipeline_stage_1930_oiupeiq.sv"]\"   -end"                   
    lappend design_files "-makelib altera_avalon_st_pipeline_stage_1930 \"[normalize_path "$QSYS_SIMDIR/../altera_avalon_st_pipeline_stage_1930/sim/altera_avalon_st_pipeline_base.v"]\"   -end"                                          
    lappend design_files "-makelib altera_merlin_axi_slave_ni_19129 \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_19129/sim/pd_test_altera_merlin_axi_slave_ni_altera_avalon_st_pipeline_stage_19129_qot3jfy.v"]\"   -end"
    lappend design_files "-makelib altera_merlin_axi_slave_ni_19129 \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_19129/sim/pd_test_altera_merlin_axi_slave_ni_altera_avalon_st_pipeline_stage_19129_pyxt2rq.v"]\"   -end"
    lappend design_files "-makelib altera_merlin_axi_slave_ni_19129 \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_19129/sim/pd_test_altera_merlin_axi_slave_ni_altera_avalon_st_pipeline_stage_19129_fxvjijy.v"]\"   -end"
    lappend design_files "-makelib altera_merlin_axi_slave_ni_19129 \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_19129/sim/altera_merlin_burst_uncompressor.sv"]\"   -end"                                               
    lappend design_files "-makelib altera_merlin_axi_slave_ni_19129 \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_19129/sim/altera_merlin_address_alignment.sv"]\"   -end"                                                
    lappend design_files "-makelib altera_merlin_axi_slave_ni_19129 \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_19129/sim/compare_eq.sv"]\"   -end"                                                                     
    lappend design_files "-makelib altera_merlin_axi_slave_ni_19129 \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_19129/sim/rd_response_mem_v3rxewy.sv"]\"   -end"                                                        
    lappend design_files "-makelib altera_merlin_axi_slave_ni_19129 \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_19129/sim/rd_comp_sel_v3rxewy.sv"]\"   -end"                                                            
    lappend design_files "-makelib altera_merlin_axi_slave_ni_19129 \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_19129/sim/rd_pri_mux_v3rxewy.sv"]\"   -end"                                                             
    lappend design_files "-makelib altera_merlin_axi_slave_ni_19129 \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_19129/sim/rd_sipo_plus_v3rxewy.sv"]\"   -end"                                                           
    lappend design_files "-makelib altera_merlin_axi_slave_ni_19129 \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_19129/sim/wr_response_mem_v3rxewy.sv"]\"   -end"                                                        
    lappend design_files "-makelib altera_merlin_axi_slave_ni_19129 \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_19129/sim/wr_comp_sel_v3rxewy.sv"]\"   -end"                                                            
    lappend design_files "-makelib altera_merlin_axi_slave_ni_19129 \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_19129/sim/wr_pri_mux_v3rxewy.sv"]\"   -end"                                                             
    lappend design_files "-makelib altera_merlin_axi_slave_ni_19129 \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_19129/sim/wr_sipo_plus_v3rxewy.sv"]\"   -end"                                                           
    lappend design_files "-makelib altera_merlin_axi_slave_ni_19129 \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_19129/sim/pd_test_altera_merlin_axi_slave_ni_19129_v3rxewy.sv"]\"   -end"                               
    lappend design_files "-makelib altera_merlin_router_1921 \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_router_1921/sim/pd_test_altera_merlin_router_1921_jgdfucq.sv"]\"   -end"                                                    
    lappend design_files "-makelib altera_merlin_router_1921 \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_router_1921/sim/pd_test_altera_merlin_router_1921_gnptley.sv"]\"   -end"                                                    
    lappend design_files "-makelib altera_merlin_router_1921 \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_router_1921/sim/pd_test_altera_merlin_router_1921_cbsa3bi.sv"]\"   -end"                                                    
    lappend design_files "-makelib altera_merlin_router_1921 \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_router_1921/sim/pd_test_altera_merlin_router_1921_z5fwury.sv"]\"   -end"                                                    
    lappend design_files "-makelib altera_merlin_router_1921 \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_router_1921/sim/pd_test_altera_merlin_router_1921_r6gmhbi.sv"]\"   -end"                                                    
    lappend design_files "-makelib altera_merlin_router_1921 \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_router_1921/sim/pd_test_altera_merlin_router_1921_fmtyn6q.sv"]\"   -end"                                                    
    lappend design_files "-makelib altera_merlin_demultiplexer_1921 \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_demultiplexer_1921/sim/pd_test_altera_merlin_demultiplexer_1921_tgvstaq.sv"]\"   -end"                               
    lappend design_files "-makelib altera_merlin_multiplexer_1922 \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_multiplexer_1922/sim/pd_test_altera_merlin_multiplexer_1922_lyizxii.sv"]\"   -end"                                     
    lappend design_files "-makelib altera_merlin_multiplexer_1922 \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_multiplexer_1922/sim/altera_merlin_arbitrator.sv"]\"   -end"                                                           
    lappend design_files "-makelib altera_merlin_demultiplexer_1921 \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_demultiplexer_1921/sim/pd_test_altera_merlin_demultiplexer_1921_zlhapmq.sv"]\"   -end"                               
    lappend design_files "-makelib altera_merlin_multiplexer_1922 \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_multiplexer_1922/sim/pd_test_altera_merlin_multiplexer_1922_w3dbbsi.sv"]\"   -end"                                     
    lappend design_files "-makelib altera_merlin_multiplexer_1922 \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_multiplexer_1922/sim/altera_merlin_arbitrator.sv"]\"   -end"                                                           
    lappend design_files "-makelib altera_merlin_width_adapter_1961 \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_width_adapter_1961/sim/pd_test_altera_merlin_width_adapter_1961_tsic3ja.sv"]\"   -end"                               
    lappend design_files "-makelib altera_merlin_width_adapter_1961 \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_width_adapter_1961/sim/altera_merlin_address_alignment.sv"]\"   -end"                                                
    lappend design_files "-makelib altera_merlin_width_adapter_1961 \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_width_adapter_1961/sim/altera_merlin_burst_uncompressor.sv"]\"   -end"                                               
    lappend design_files "-makelib altera_merlin_width_adapter_1961 \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_width_adapter_1961/sim/pd_test_altera_merlin_width_adapter_1961_pch2mgq.sv"]\"   -end"                               
    lappend design_files "-makelib altera_merlin_width_adapter_1961 \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_width_adapter_1961/sim/altera_merlin_address_alignment.sv"]\"   -end"                                                
    lappend design_files "-makelib altera_merlin_width_adapter_1961 \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_width_adapter_1961/sim/altera_merlin_burst_uncompressor.sv"]\"   -end"                                               
    lappend design_files "-makelib st_dc_fifo_1953 \"[normalize_path "$QSYS_SIMDIR/../st_dc_fifo_1953/sim/pd_test_st_dc_fifo_1953_go42oja.v"]\"   -end"                                                                                   
    lappend design_files "-makelib st_dc_fifo_1953 \"[normalize_path "$QSYS_SIMDIR/../st_dc_fifo_1953/sim/altera_reset_synchronizer.v"]\"   -end"                                                                                         
    lappend design_files "-makelib st_dc_fifo_1953 \"[normalize_path "$QSYS_SIMDIR/../st_dc_fifo_1953/sim/altera_dcfifo_synchronizer_bundle.v"]\"   -end"                                                                                 
    lappend design_files "-makelib st_dc_fifo_1953 \"[normalize_path "$QSYS_SIMDIR/../st_dc_fifo_1953/sim/altera_std_synchronizer_nocut.v"]\"   -end"                                                                                     
    lappend design_files "-makelib altera_mm_interconnect_1920 \"[normalize_path "$QSYS_SIMDIR/../altera_mm_interconnect_1920/sim/pd_test_altera_mm_interconnect_1920_6srq35i.v"]\"   -end"                                               
    lappend design_files "-makelib altera_reset_controller_1924 \"[normalize_path "$QSYS_SIMDIR/../altera_reset_controller_1924/sim/altera_reset_controller.v"]\"   -end"                                                                 
    lappend design_files "-makelib altera_reset_controller_1924 \"[normalize_path "$QSYS_SIMDIR/../altera_reset_controller_1924/sim/altera_reset_synchronizer.v"]\"   -end"                                                               
    lappend design_files "-makelib pd_test \"[normalize_path "$QSYS_SIMDIR/pd_test.v"]\"   -end"                                                                                                                                          
    lappend design_files "-makelib pd_test \"[normalize_path "$QSYS_SIMDIR/pd_test_stim.sv"]\"   -end"                                                                                                                                          
    return $design_files
  }
  
  proc get_non_duplicate_elab_option {ELAB_OPTIONS NEW_ELAB_OPTION} {
    set IS_DUPLICATE [string first $NEW_ELAB_OPTION $ELAB_OPTIONS]
    if {$IS_DUPLICATE == -1} {
      return $NEW_ELAB_OPTION
    } else {
      return ""
    }
  }
  
  
  proc get_elab_options {SIMULATOR_TOOL_BITNESS} {
    set ELAB_OPTIONS ""
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [axi4_sub_wide::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [axi4_mgr_narrow::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [rst_src::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [clk_src1::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [clk_src2::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [axi4_mgr::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    if ![ string match "bit_64" $SIMULATOR_TOOL_BITNESS ] {
    } else {
    }
    return $ELAB_OPTIONS
  }
  
  
  proc get_sim_options {SIMULATOR_TOOL_BITNESS} {
    set SIM_OPTIONS ""
    append SIM_OPTIONS [axi4_sub_wide::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [axi4_mgr_narrow::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [rst_src::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [clk_src1::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [clk_src2::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [axi4_mgr::get_sim_options $SIMULATOR_TOOL_BITNESS]
    if ![ string match "bit_64" $SIMULATOR_TOOL_BITNESS ] {
    } else {
    }
    return $SIM_OPTIONS
  }
  
  
  proc get_env_variables {SIMULATOR_TOOL_BITNESS} {
    set ENV_VARIABLES [dict create]
    set LD_LIBRARY_PATH [dict create]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [axi4_sub_wide::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [axi4_mgr_narrow::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [rst_src::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [clk_src1::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [clk_src2::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [axi4_mgr::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    dict set ENV_VARIABLES "LD_LIBRARY_PATH" $LD_LIBRARY_PATH
    if ![ string match "bit_64" $SIMULATOR_TOOL_BITNESS ] {
    } else {
    }
    return $ENV_VARIABLES
  }
  
  
  proc normalize_path {FILEPATH} {
      if {[catch { package require fileutil } err]} { 
          return $FILEPATH 
      } 
      set path [fileutil::lexnormalize [file join [pwd] $FILEPATH]]  
      if {[file pathtype $FILEPATH] eq "relative"} { 
          set path [fileutil::relative [pwd] $path] 
      } 
      return $path 
  } 
  proc get_dpi_libraries {QSYS_SIMDIR} {
    set libraries [dict create]
    set libraries [dict merge $libraries [axi4_sub_wide::get_dpi_libraries "$QSYS_SIMDIR/../../ip/pd_test/axi4_sub_wide/sim/"]]
    set libraries [dict merge $libraries [axi4_mgr_narrow::get_dpi_libraries "$QSYS_SIMDIR/../../ip/pd_test/axi4_mgr_narrow/sim/"]]
    set libraries [dict merge $libraries [rst_src::get_dpi_libraries "$QSYS_SIMDIR/../../ip/pd_test/rst_src/sim/"]]
    set libraries [dict merge $libraries [clk_src1::get_dpi_libraries "$QSYS_SIMDIR/../../ip/pd_test/clk_src1/sim/"]]
    set libraries [dict merge $libraries [clk_src2::get_dpi_libraries "$QSYS_SIMDIR/../../ip/pd_test/clk_src2/sim/"]]
    set libraries [dict merge $libraries [axi4_mgr::get_dpi_libraries "$QSYS_SIMDIR/../../ip/pd_test/axi4_mgr/sim/"]]
    
    return $libraries
  }
  
}
