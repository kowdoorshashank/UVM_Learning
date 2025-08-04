
class Counter_test extends uvm_test;
  `uvm_component_utils (Counter_test);
  
  function new (string name = "Counter_test",uvm_component parent);
    super.new(name,parent);
  endfunction
  
  Counter_env env;
  Counter_agent agent;
  
  function void build_phase (uvm_phase phase);
    super.build_phase(phase);
    
    env = Counter_env::type_id::create("env",this);
    
  endfunction
  
  function void end_of_elabration_phase(uvm_phase phase);
    $display ("TEST", "End of elabration phase ");
  endfunction
  
  function void start_of_simulation_phase (uvm_phase phase);
    $display("TEST","Start of Simulation Phase");
    set_report_severity_action_hier(UVM_INFO,UVM_DISPLAY);
    set_report_verbosity_level_hier (UVM_MEDIUM);
  endfunction
  
  task run_phase(uvm_phase phase);
    Counter_Sequence seq;
    
    phase.raise_objection(this);
    seq = Counter_Sequence::type_id::create("Counter_Sequence",this);
      seq.start(env.agent.sequencer);
    #500;
    
    phase.drop_objection(this);
    
  endtask
  
endclass

