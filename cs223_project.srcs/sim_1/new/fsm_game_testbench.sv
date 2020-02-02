`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.03.2018 17:43:06
// Design Name: 
// Module Name: FSMStepMotor_testbench
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


module fsm_game_testbench();
    logic [7:0] [7:0] red, blue;
    logic clk, newGame, row1, row2, row3, row4, rgtl;
    logic [3:0] currentStateG;
    
    fsm_game game(clk, newGame, row1, row2, row3, row4, rgtl, red, blue, currentStateG);
    
    always begin
        clk = ~clk;  #5;
    end
    
    initial begin
    clk = 0;
    newGame = 1; row1 = 0; row2 = 0; row3 = 0; row4 = 0; rgtl = 0; #50;                  
    newGame = 0; row1 = 1; row2 = 0; row3 = 0; row4 = 0; rgtl = 0; #50; 
    newGame = 0; row1 = 0; row2 = 1; row3 = 0; row4 = 0; rgtl = 0; #50; 
    newGame = 0; row1 = 0; row2 = 1; row3 = 0; row4 = 0; rgtl = 0; #50; 
    newGame = 0; row1 = 0; row2 = 0; row3 = 1; row4 = 0; rgtl = 0; #50; 
    newGame = 0; row1 = 0; row2 = 0; row3 = 1; row4 = 0; rgtl = 0; #50; 
    newGame = 0; row1 = 0; row2 = 0; row3 = 1; row4 = 0; rgtl = 0; #50; 
    newGame = 0; row1 = 0; row2 = 0; row3 = 0; row4 = 1; rgtl = 0; #50; 
    newGame = 0; row1 = 0; row2 = 0; row3 = 0; row4 = 1; rgtl = 0; #50; 
    newGame = 0; row1 = 0; row2 = 0; row3 = 0; row4 = 1; rgtl = 0; #50; 
    newGame = 0; row1 = 0; row2 = 0; row3 = 0; row4 = 1; rgtl = 0; #50; 
    end    
endmodule
