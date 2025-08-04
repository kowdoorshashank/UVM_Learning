class Counter_monitor extends uvm_monitor ;
  `uvm_component_utils (Counter_monitor);
  
  function new (string name = "Counter_moniter", uvm_component parent);
    super.new(name,parent);
  endfunction
  
  virtual Counter_intf vir_intf;
  
  Counter_Sequence_Item txn;
  
  uvm_analysis_port #(Counter_Sequence_Item) port;
  
  function void build_phase (uvm_phase phase);
    super.build_phase(phase);
    if(!(uvm_config_db#(virtual Counter_intf)::get(this,"","vir_intf",vir_intf)))
      begin
        `uvm_fatal("MONITER","Not Connected to interface ");
      end
    
    port = new("port",this);
    txn = Counter_Sequence_Item::type_id::create("txn",this);
  endfunction
  
  task run_phase (uvm_phase phase) ;
    forever begin
      
      @(posedge vir_intf.clk);
      txn.rst = vir_intf.rst;
      txn.up_dn = vir_intf.up_dn;
      txn.data_out = vir_intf.data_out;
      `uvm_info ("MONITER",txn.convert2string(),UVM_LOW)
      port.write(txn);
    end
  endtask
  
endclass

