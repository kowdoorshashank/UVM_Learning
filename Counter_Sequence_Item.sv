class Counter_Sequence_Item extends uvm_sequence_item;
  logic rst;
  rand logic up_dn;
  logic [7:0] data_out;
  
  `uvm_object_utils_begin (Counter_Sequence_Item)
  `uvm_field_int(rst , UVM_ALL_ON)
  `uvm_field_int(up_dn , UVM_ALL_ON)
  `uvm_field_int(data_out , UVM_ALL_ON)
  `uvm_object_utils_end
  
  function new ( string name = "Counter_Sequence_Item");
    super.new(name);
  endfunction
  
  
  constraint up {up_dn == 1;}
  constraint dn {up_dn == 0;}
  
  // For input to print
  function string input2string();
    return ($sformatf("up_down enable = %b , reset = %0b ", up_dn, rst));
  endfunction 
  
  // Output to print
  
  function string output2string ();
    return ($sformatf("Output =%0b", data_out));
  endfunction
  
  function string convert2string();
    return {input2string(), " ", output2string()};
  endfunction
            
  
endclass