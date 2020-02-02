`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.05.2018 18:22:53
// Design Name: 
// Module Name: fsm_score
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
module fsm_score(
    input logic clk, 
    input logic reset,
    input logic dec_l,
    input logic dec_r,
    input logic inc_l,
    input logic inc_r,
    output logic [6:0] score_l, 
    output logic [6:0] score_r,
    output logic [3:0] currentState 
    );
  
    logic [3:0] nextState;
   // logic [3:0] currentState;
   
    
    parameter S0 = 4'b0000;
    parameter S1 = 4'b0001;
    parameter S2 = 4'b0010;
    parameter S3 = 4'b0011;
    parameter S4 = 4'b0100;
    parameter S5 = 4'b0101;
    parameter S6 = 4'b0110;
    parameter S7 = 4'b0111;
    parameter S8 = 4'b1000;
    parameter S9 = 4'b1001;
    parameter S10 = 4'b1010;
    
    

    always @(clk)
        currentState <= nextState;
        
    always_ff @(posedge clk)
    begin
        case ({currentState})
        
            S0: nextState <= S1;
                            
            S1: if (reset) nextState <= S2;
            else if (dec_l) nextState <= S3;
            else if (dec_r) nextState <= S5;
            else if (inc_l) nextState <= S7;
            else if (inc_r) nextState <= S9;
            else  nextState <= S1;
            
            S2: if (!reset) nextState <= S0;
            else  nextState <= S2;
            
            S3: if (!dec_l) nextState <= S4;
            else  nextState <= S3;

            S4: nextState <= S1;

            S5: if (!dec_r) nextState <= S6;
            else nextState <= S5;
            
            S6: nextState <= S1;
            
            S7: if (!inc_l) nextState <= S8;
            else  nextState <= S7;
                        
                        
            S8: nextState <= S1;
                        
            S9: if (!inc_r) nextState <= S10;
            else  nextState <= S9;
                        
            S10: nextState <= S1;
                                    
            default: nextState = S0;                               
        endcase;
    end
    
    always_ff @(posedge clk )
    begin
        case(currentState)
            S0: begin score_l = 0; score_r = 0; end
            S1: begin end
            S2: begin end
            S3: begin end
            S4: begin if (score_l == 0) score_l = 99;
                      else score_l--; end
            S5: begin end
            S6: begin if (score_r == 0) score_r = 99;
                      else score_r--; end
            S7: begin end
            S8: begin if (score_l == 99) score_l = 0;
                      else score_l++; end 
            S9: begin end
            S10: begin if (score_r == 99) score_r = 0;
                      else score_r++; end 
                           
        endcase
    end
endmodule