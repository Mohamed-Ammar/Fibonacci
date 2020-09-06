`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Mohamed Ammar
// 
// Create Date:    22:52:22 09/05/2020 
// Design Name: fibonacci
// Module Name:    fibonacci 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: Implementation for fibonacci series. 
// The output at  each cycle  is the summmation of the previous two numbers
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module fibonacci(clock, reset, fib, N);
input  clock , reset;
input  [7:0] N;
output [7:0] fib;               //fibonacci result

wire[7:0] fib;
reg [7:0] curr_num , next_num ;
reg [1:0] state,next_state;

reg [1:0] curr_mux,next_mux;           //control lines

parameter [0:0] s0 = 1'b0, s1 = 1'b1 ;  //states
              
		//data path
always@(posedge clock)
case(curr_mux)
2'h1 : curr_num <= 8'h0;
2'h2 : begin
 curr_num <= next_num;
 end
endcase

always@(posedge clock)
case(next_mux)
2'h1 :  next_num <= 8'h1;
2'h2 : begin
 next_num <= fib;
 end
endcase

	  //controller
always@(posedge clock)
if (reset) state<=s0;
else state <= next_state;

	  //FSM
always@(*)
casex (state)
s0: begin
  curr_mux = 1 ; next_mux = 1;
  next_state = s1; 
 end

s1: begin 
curr_mux = 2 ; next_mux = 2; 
  if (fib >= N ) next_state = s0;
  else next_state = s1;
 end

default: begin
 next_state = s0; next_mux = 2'hx ; curr_mux = 2'hx;
 end
endcase
assign fib = curr_num + next_num;
endmodule
