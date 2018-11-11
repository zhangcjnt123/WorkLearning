//Author:zhangcj
//Function:watch dog
//data:2018.10.18
//Version:v1.0
//
module  apb_iwdt  (   
                      //input
                      pclk,
                      prestn,
                      psel,
                      penable,
                      paddr,
                      pwdata,
                      pwrite,
                      pstrb,
                      //output
                      prdata,
                      pready,
                      pslverr,
                      irq_iwdt,
                      iwdt_rst
                              );
          
     input         pclk;
     input         prestn;
     input         psel;
     input         penable;
     input         [31:0]paddr;
     input         [31:0]pwdata;
     input         pwrite;
     input         pstrb;
     input         //output
     output         [31:0]prdata;
     output         pready;
     output         pslverr;
     output         irq_iwdt;
     output         iwdt_rst;

     apb_slave_interface    A0_apb_slave_interface
                                      (
                                          .pclk          ()       ,
                                          .prestn        ()       ,
                                          .psel          ()       ,
                                          .penable       ()       ,
                                          .paddr         ()       ,
                                          .pwdata        ()       ,
                                          .pwrite        ()       ,
                                          .pstrb         ()       ,
                                          .rdata         ()       ,
                                          //output
                                          .prdata        ()       ,
                                          .pready        ()       ,
                                          .pslverr       ()       ,
                                          .addr          ()       ,
                                          .read_en       ()       ,
                                          .write_en      ()       ,
                                          .wdata         ()       ,
                                          .byte_strobe   ()       
                                                                            );
    iwdt_reg                A1_iwdt_reg
                                      (
                                          .pclk                   ()       ,
                                          .prestn                 ()       ,
                                          .addr                   ()       ,
                                          .read_en                ()       ,
                                          .write_en               ()       ,
                                          .wdata                  ()       ,
                                          .byte_strobe            ()       ,
                                          .iwdt_int               ()       ,
                                          .iwdt_value             ()       ,
                                          //output
                                          .wen_iwdtintclr         ()       ,
                                          .wen_load               ()       ,
                                          .iwdt_con               ()       ,
                                          .iwdt_load              ()       
                                                                                );


    iwdt_ctrl             A2_iwdt_ctrl
                                   (
                                          .pclk                   ()       ,
                                          .prestn                 ()       ,
                                          .lrc_clk                ()       ,
                                          .iwdt_cfgen             ()       ,
                                          .iwdt_gated             ()       ,
                                          .wen_iwdtintclr         ()       ,
                                          .wen_load               ()       ,
                                          .iwdt_con               ()       ,
                                          .iwdt_load              ()       ,
                                          //output
                                          .iwdt_int               ()       ,
                                          .iwdt_value             ()       ,
                                          .irq_iwdt               ()       ,
                                          .iwdt_rst               ()       
                                                                                );
 
  



endmodule
