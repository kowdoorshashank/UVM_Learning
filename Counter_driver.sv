class Counter_driver extends uvm_driver #(Counter_Sequence_Item);
  
  `uvm_component_utils (Counter_driver)
  
  function new (string name = "Counter_driver",uvm_component parent);
    super.new(name,parent);
  endfunction
  
  virtual interface Counter_intf vir_intf;
    
    function void build_phase (uvm_phase phase);
      super.build_phase(phase);
      if(!(uvm_config_db#(virtual Counter_intf)::get(this,"","vir_intf",vir_intf)))
        begin
          `uvm_fatal("DRIVER","Not connected to interface" );
        end
    endfunction
    
    task run_phase (uvm_phase phase);
      Counter_Sequence_Item txn;
      forever begin
        seq_item_port.get_next_item(txn);
        @(posedge vir_intf.clk);
        vir_intf.rst = txn.rst;
        vir_intf.up_dn = txn.up_dn;
        `uvm_info("DRIVER",txn.input2string(),UVM_HIGH)
        seq_item_port.item_done();
      end
    endtask
    
endclass
    
    