class Counter_Sequencer extends uvm_sequencer#(Counter_Sequence_Item);
  
  `uvm_component_utils (Counter_Sequencer)
  
  function new (string name = " Counter_Sequencer ", uvm_component parent);
    super.new(name,parent);
  endfunction
  
endclass

