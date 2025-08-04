class Counter_env extends uvm_env;
  
  `uvm_component_utils (Counter_env);
  
  function new (string name = "Counter_env", uvm_component parent);
    super.new(name,parent);
  endfunction
  
  Counter_agent agent;
  
  function void build_phase (uvm_phase phase);
    super.build_phase(phase);
    
    agent = Counter_agent::type_id::create("agent",this);
    
  endfunction
  
  function void connect_phase (uvm_phase phase);
    super.connect_phase (phase);
  endfunction
  
endclass