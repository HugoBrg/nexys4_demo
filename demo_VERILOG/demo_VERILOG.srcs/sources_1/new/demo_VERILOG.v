`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.04.2018 10:56:53
// Design Name: 
// Module Name: demo_VERILOG
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module demo_VERILOG(
    input [7:0] swt,
    output [7:0] led
);

assign led[0]=!swt[0];
assign led[1]=swt[1] & !swt[2];
assign led[3]=swt[2] & swt[3];
assign led[2]=led[1] | led[3];

assign led[7:4]=swt[7:4];

endmodule
