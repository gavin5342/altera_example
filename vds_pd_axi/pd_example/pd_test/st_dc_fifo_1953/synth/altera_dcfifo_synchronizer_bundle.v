// (C) 2001-2026 Altera Corporation. All rights reserved.
// Your use of Altera Corporation's design tools, logic functions and other 
// software and tools, and its AMPP partner logic functions, and any output 
// files from any of the foregoing (including device programming or simulation 
// files), and any associated documentation or information are expressly subject 
// to the terms and conditions of the Altera Program License Subscription 
// Agreement, Altera IP License Agreement, or other applicable 
// license agreement, including, without limitation, that your use is for the 
// sole purpose of programming logic devices manufactured by Altera and sold by 
// Altera or its authorized distributors.  Please refer to the applicable 
// agreement for further details.


// $File: //acds/rel/26.1/ip/iconnect/avalon_st/altera_avalon_dc_fifo/altera_dcfifo_synchronizer_bundle.v $
// $Revision: #1 $
// $Date: 2026/02/05 $
// $Author: psgswbuild $
//-------------------------------------------------------------------------------

`timescale 1 ns / 1 ns
module altera_dcfifo_synchronizer_bundle(
                                     clk,
                                     reset_n,
                                     din,
                                     dout
                                     );
   parameter WIDTH = 1;
   parameter DEPTH = 3;   
   parameter retiming_reg_en = 0;

   input clk;
   input reset_n;
   input [WIDTH-1:0] din;
   output [WIDTH-1:0] dout;
   
   genvar i;
   
   generate
      for (i=0; i<WIDTH; i=i+1)
        begin : sync
           altera_std_synchronizer_nocut #(.depth(DEPTH), .retiming_reg_en(retiming_reg_en))
                                   u (
                                      .clk(clk), 
                                      .reset_n(reset_n), 
                                      .din(din[i]), 
                                      .dout(dout[i])
                                      );
        end
   endgenerate
   
endmodule 

`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "YTu29eqC0KhfAXeRYUICwrAy8f9dNBV8Yu+dcGvIzwUfS9I5ptCmbZm2uCuZOPVBwtVKcWxCI/+NeoaHntIaySHYiXfBS0rjxyGQ1PvQXHCWij1r9uR37Xhl/QPx0bCXnHcqTISdKzkt8Ln8KkNYH7nrnMsVsPv0qdFfytVvHaZA2ymERVJWzYTBStzr1wFRdvdc4EFdV8tOn6e9D/1x/55lNPxUJFwXEnW21qrq43kCk40DxKj0zGQRRhhLtMezKVsjw4CYNqaxkOgclnG4kt0ICoehQ6wXOPisdFDi99qITdPSZd7+tkD6mfP37U8OYZLSU8KcvAhAP+Hm8xVDd10SJCQybYe5zdP2j5YSJm6CIZaXqDTpeXlpvB5k6XS89qAAJjax1NvowlmHt4RHUVS2V8MsGbjG7R4AcGV1L/fUDtSN30mtVJF/MlviOtbRnGy5PpzTTGlddomXy8CqMSLjsHW3zihZPdCNA+TQuT+cWk5ntJF5/dYCKUzSeWhGwtATI28nPAryOhCVk7oupmQSktgbOay7wz006UQqQwkbg8gSpndzclW49IIM/77ddjGljRvnECow9QunzqWKeDBgh01ezPbgyQs1/QVZWGcwBvgb9Qihq4TpjsWgCJNsg3dvTj5JkuntU8RLMoNL0ypanQDeeyWP8atvpZqATBA0lVyedGqSFplBDGh4NqD3i/dFvRb5yx8pq8mPUEuJNRwEEDYTCw9biUQ97c6B3G1yubDJgtIbnxCE1xfUlnNWLYPTrU1MccO8d0hEQCsU7IO/UmaPvlMDRblrNm0zoCW3kXOqUeitV9AVvckPZ9msmnCTzzV30NLZw0lycIbIMuW5Hjr68CtM76Uf+ra9IuJJ21g6Q80by3ptkPMS9AzrMiBgLtMrDChZQbkMf21/ePpGoHxljggAbxUu7ZTDkBChisuVtsh+lN6xD2l06F/m/IzE+Lv9iXyOLScm96WnIrJ8l847BZXsjTRF7/YnAOBmIYni7NRWQvLv66HEqlRX"
`endif