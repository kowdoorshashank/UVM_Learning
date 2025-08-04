class Counter_agent extends uvm_agent;
  
  `uvm_component_utils (Counter_agent);
  
  function new (string name = "Counter_agent", uvm_component parent);
    super.new(name,parent);
  endfunction
  
  Counter_Sequencer sequencer;
  Counter_driver driver;
  Counter_monitor moniter;
  
  function void build_phase (uvm_phase phase);
    super.build_phase(phase);
    
    sequencer = Counter_Sequencer::type_id::create("sequencer",this);
    driver = Counter_driver::type_id::create("driver",this);
    moniter = Counter_monitor::type_id::create("moniter",this);
    
  endfunction
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    
    driver.seq_item_port.connect(sequencer.seq_item_export);
    
  endfunction
  
endclass

