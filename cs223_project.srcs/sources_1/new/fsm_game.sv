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
module fsm_game(
    input logic clk, 
    input logic newGame,
    input logic row1,
    input logic row2,
    input logic row3,
    input logic row4,
    
    // input fsm_game
    input logic rgtl,
    
    output logic [7:0] [7:0] red,
    output logic [7:0] [7:0] blue,
    output logic [3:0] currentStateG 
    );
  
    logic [3:0] nextState;
    //logic [3:0] currentState;
    
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
    parameter S11 = 4'b1011;



    always @(clk)
        currentStateG <= nextState;
        
    always_ff @(posedge clk)
    begin
        case ({currentStateG})
        
            S0: nextState <= S1;
                            
            S1: if ( !((|red) || (|blue)) ) nextState <= S11;  
            else if (newGame) nextState <= S2;
            else if (row1) nextState <= S3;
            else if (row2) nextState <= S5;
            else if (row3) nextState <= S7;
            else if (row4) nextState <= S9;
            else  nextState <= S1;
           
            S2: if (!newGame) nextState <= S0;
            else  nextState <= S2;
            
            S3: if (!row1) nextState <= S4;
            else  nextState <= S3;

            S4: nextState <= S1;

            S5: if (!row2) nextState <= S6;
            else nextState <= S5;
            
            S6: nextState <= S1;
            
            S7: if (!row3) nextState <= S8;
            else  nextState <= S7;
                        
                        
            S8: nextState <= S1;
                        
            S9: if (!row4) nextState <= S10;
            else  nextState <= S9;
                        
            S10: nextState <= S1; 
            
            S11: if (newGame) nextState <= S2;
                 else nextState <= S11;
                                    
            default: nextState = S1;                               
        endcase
    end
    
    always_ff @(posedge clk )
        begin
            case(currentStateG)
                S0: begin
                        red  = {8'b00000011, 8'b00000011, 8'b00110011, 8'b00110011, 8'b00110011, 8'b00000011, 8'b00000011, 8'b00000000};
                        blue = {8'b00000000, 8'b00001100, 8'b00001100, 8'b11001100, 8'b00001100, 8'b00001100, 8'b00000000, 8'b00000000};
                    end
                S1: begin end
                S2: begin end
                S3: begin end
                S4: begin
                        if(blue[4] == 8'b11001100) blue[4] <= 8'b00001100;
                        else if(blue[4] == 8'b11000000) blue[4] <= 8'b00000000;
                    end
                S5: begin end
                S6: begin
                        if(red[3] == 8'b00110011) red[3] <= 8'b00000011;
                        else if(red[3] == 8'b00110000) red[3] <= 8'b00000000;         
                        else if(red[4] == 8'b00110011) red[4] <= 8'b00000011;
                        else if(red[4] == 8'b00110000) red[4] <= 8'b00000000;         
                        else if(red[5] == 8'b00110011) red[5] <= 8'b00000011;
                        else if(red[5] == 8'b00110000) red[5] <= 8'b00000000;
                    end
                S7: begin end
                S8: begin 
                        if(blue[2] == 8'b00001100) blue[2] <= 8'b00000000;
                        else if(blue[3] == 8'b00001100) blue[3] <= 8'b00000000;
                        else if(blue[4] ==8'b11001100) blue[4] <= 8'b11000000;                    
                        else if(blue[4] == 8'b00001100) blue[4] <= 8'b00000000;
                        else if(blue[5] == 8'b00001100) blue[5] <= 8'b00000000;                    
                        else if(blue[6] == 8'b00001100) blue[6] <= 8'b00000000;
                    end
                S9: begin end 
                S10: begin 
                        if(red[1] ==  8'b00000011) red[1] <= 8'b00000000;
                        else if(red[2] ==  8'b00000011) red[2] <= 8'b00000000;         
                        else if(red[3] == 8'b00110011) red[3] <= 8'b00110000;
                        else if(red[3] ==  8'b00000011) red[3] <= 8'b00000000;         
                        else if(red[4] == 8'b00110011) red[4] <= 8'b00110000;
                        else if(red[4] ==  8'b00000011) red[4] <= 8'b00000000;   
                        else if(red[5] == 8'b00110011) red[5] <= 8'b00110000;
                        else if(red[5] ==  8'b00000011) red[5] <= 8'b00000000;   
                        else if(red[6] ==  8'b00000011) red[6] <= 8'b00000000;
                        else if(red[7] ==  8'b00000011) red[7] <= 8'b00000000;                                           
                     end
                S11: begin 
                        if (rgtl)
                            red  = /*{8'b00001000, 
                                    8'b00001100, 
                                    8'b11111110, 
                                    8'b11111111, 
                                    8'b11111110, 
                                    8'b00001100, 
                                    8'b00001000, 
                                    8'b00000000};*/
                                    
                                    {8'b00010000, 
                                    8'b00111000, 
                                    8'b01111100, 
                                    8'b11111110, 
                                    8'b00111000, 
                                    8'b00111000, 
                                    8'b00111000, 
                                    8'b00111000};
                                    
                                   
                                    
                                    
                        else
                            red = { 8'b00111000, 
                                    8'b00111000, 
                                    8'b00111000, 
                                    8'b00111000,
                                    8'b11111110,
                                    8'b01111100,
                                    8'b00111000,
                                    8'b00010000};
                            //red  = {8'b00010000, 8'b00110000, 8'b01111111, 8'b11111111, 8'b01111111, 8'b00110000, 8'b00010000, 8'b00000000};
                        blue = {8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000};
                        end
                               
            endcase
    end
endmodule