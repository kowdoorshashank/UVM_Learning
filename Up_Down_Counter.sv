// Code your design here

module Up_Down_Counter (
  input logic clk , rst , up_dn ,
  output logic [7:0] data_out 
);

  
  always @(posedge clk )
    begin
      if (rst )
        data_out <= 0;
      else if (up_dn )
          data_out <= data_out +  1; 
          else
            data_out <= data_out - 1;
    end
endmodule


      