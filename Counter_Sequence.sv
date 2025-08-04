class Counter_Sequence extends uvm_sequence #(Counter_Sequence_Item);
  
  `uvm_object_utils (Counter_Sequence);
  
  function new (string name = "Counter_Sequence");
    super.new(name);
  endfunction
  
  Counter_Sequence_Item txn;
  int count = 100;

  typedef enum {UP_COUNT , DOWN_COUNT , RESET} seq_mode;
  seq_mode mode;

  task body();
  
    txn = Counter_Sequence_Item::type_id::create("txn");
    txn.rst = 1;
    repeat(20) txn.up_dn = 0; 
    repeat(20) txn.up_dn = 1; 

    start_item(txn);
    finish_item(txn);

    //mode = RESET;
   // #100 mode = UP_COUNT;
    //#100 mode = DOWN_COUNT;


    repeat (count) begin
      txn = Counter_Sequence_Item::type_id::create("txn");

      case (mode)
        RESET: begin
          txn.rst   = 1;
          txn.up_dn = 0;    
          mode = UP_COUNT;   
        end

        UP_COUNT: begin
          txn.rst   = 0;
          txn.up_dn = 1;     
          
          if ($urandom_range(0,19) == 0) mode = DOWN_COUNT;
        end

        DOWN_COUNT: begin
          txn.rst   = 0;
          txn.up_dn = 0;    
     
          if ($urandom_range(0,19) == 0) mode = UP_COUNT;
        end
      endcase

      start_item(txn);
      finish_item(txn);
    end
  endtask
  
endclass