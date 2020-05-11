`timescale 1ns / 1ps

module register(
  input      [9:0]  data_i,             
  input             clk_i,           
  input             rstn_i,           
  input             en_i, 
    
  output reg [9:0]  data_o       
  );
  
  wire btn_was_pressed;
  
  keypress kpr(
    .btn_was_pressed_o ( btn_was_pressed )
  );
  
  always @( posedge clk_i or negedge rstn_i ) begin
    if ( !rstn_i ) 
      data_o <= 0;
    else if ( btn_was_pressed ) 
      data_o <= data_i;
  end 
 
endmodule
