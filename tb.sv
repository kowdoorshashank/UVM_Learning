module tb;

  logic clk;
  
  Counter_intf tb_intf(clk);
  
  Up_Down_Counter counter (.clk(tb_intf.clk) , .rst(tb_intf.rst) , .up_dn(tb_intf.up_dn) , .data_out(tb_intf.data_out));
  
  initial begin
    clk = 0;
    forever #10 clk = ~clk;
  end
  
  
  initial begin
    uvm_config_db#(virtual Counter_intf)::set(uvm_root::get(),"","vir_intf",tb_intf);
  end
  
  initial begin
    run_test("Counter_test");
  end
  
  initial begin
    $dumpfile ("wave.vcd");
    $dumpvars (0,tb);
  end
  
endmodule
