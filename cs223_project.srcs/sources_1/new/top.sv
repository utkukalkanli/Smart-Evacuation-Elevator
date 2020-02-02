module top(
   
	input logic clk, //100Mhz on Basys3

    input logic row1, row2, row3, row4, changePlayer, reset, newGame,
    input logic dec_l, dec_r, inc_l, inc_r, 
    
    
	// FPGA pins for 8x8 display
	output logic reset_out, //shift register's reset
	output logic OE, 	//output enable, active low 
	output logic SH_CP,  //pulse to the shift register
	output logic ST_CP,  //pulse to store shift register
	output logic DS, 	//shift register's serial input data
	output logic [7:0] col_select, // active column, active high
	
    //7-segment signals
    output logic a, b, c, d, e, f, g, dp,
    output logic [3:0] an,    
    
    //step motor
    output logic [3:0] phases,
    
    // fsm test
    output logic [3:0] currentState,
    output logic [3:0] currentStateG
	);
	
// SCORES
//4 numbers to keep value of any of 4 digits
//user's hex inputs for 4 digits
logic [6:0] score_l, score_r;
logic [3:0] in0 = score_r % 10;
logic [3:0] in1 = (score_r-(score_r % 10))/10;
logic [3:0] in2 = score_l % 10;
logic [3:0] in3 = (score_l-(score_l % 10))/10;
fsm_score fs(clk, reset, dec_l, dec_r, inc_l, inc_r, score_l, score_r, currentState);
 
//// SCORES TO 7SEG
SevSeg_4digit SevSeg(
    clk,
    in0, in1, in2, in3, //user inputs for each digit (hexadecimal value)
    a, b, c, d, e, f, g, dp, // just connect them to FPGA pins (individual LEDs).
    an   // just connect them to FPGA pins (enable vector for 4 digits, active low)
);

// STEP MOTOR
logic stop;
logic [1:0] speed = 2'b10;
logic direction;
logic [28:0] counter;

always_ff @ (posedge clk)
    if (changePlayer) begin
        counter = {29{1'b1}};
        direction = ~direction;
    end
    else if (counter == 0)
        stop = 1;
    else begin
        counter--;
        stop = 0;
    end                    

// RGB    

logic [2:0] col_num;
logic [7:0] [7:0] image_red, image_green, image_blue;

// initial value for RGB images:
//	image_???[0]     : left column  .... image_???[7]     : right column
//	image_???[?]'MSB : top line     .... image_???[?]'LSB : bottom line
//logic [0:7] [7:0] initial_red = 
//{8'b00000000, 8'b00000000, 8'b00111000, 8'b00111000, 8'b00000000, 8'b00000000, 8'b11111110, 8'b11111110};
//logic [0:7] [7:0]  initial_blue = 
//{8'b00010000, 8'b00010000, 8'b00000000, 8'b00000000, 8'b01111100, 8'b01111100, 8'b00000000, 8'b00000000};


   
// This module displays 8x8 image on LED display module. 
display_8x8 display_8x8_0(
	.clk(clk),
	
	// RGB data for display current column
	.red_vect_in(red[col_num]),
	.green_vect_in(green[col_num]),
	.blue_vect_in(blue[col_num]),
	
	.col_data_capture(), // unused
	.col_num(col_num),
	
	// FPGA pins for display
	.reset_out(reset_out),
	.OE(OE),
	.SH_CP(SH_CP),
	.ST_CP(ST_CP),
	.DS(DS),
	.col_select(col_select)   
);

logic rgtl;
always @* begin
    if (score_r > score_l)
        rgtl = 1;
    else
        rgtl = 0;    
end

// game image
logic [7:0] [7:0] red;
logic [7:0] [7:0] blue;
logic [7:0] [7:0] green  = {8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000};
fsm_game fg(clk, newGame, row1,row2,row3,row4, rgtl, red, blue, currentStateG);

//// TEST DISPLAY MATRIX
//logic [3:0] in0 = red[4][3:0];
//logic [3:0] in1 = red[4][7:4];
//logic [3:0] in2 = red[0][3:0];
//logic [3:0] in3 = red[0][7:4];

//// TEST DISPLAY GAME WITH 7SEG
//SevSeg_4digit SevSeg(
//    clk,
//    in0, in1, in2, in3, //user inputs for each digit (hexadecimal value)
//    a, b, c, d, e, f, g, dp, // just connect them to FPGA pins (individual LEDs).
//    an   // just connect them to FPGA pins (enable vector for 4 digits, active low)
//);
 
   
// move the image to right every half a second to make an animation
//logic [26:0] counter = {27{1'b0}}; 
//always@ (posedge clk)
//begin
//	counter <= counter + 1;

//	if ( counter == 27'd49_999_999 )
//	begin
//		counter <= {27{1'b0}}; 
//		image_red   <= { image_red[7],   image_red[0:6]};
//		image_green <= { image_green[7], image_green[0:6]};
//		image_blue  <= { image_blue[7],  image_blue[0:6]};
//	end

//end


//


stepmotor stepmotor_inst0(
	.clk(clk),
    .direction(direction), //user input for motor direction
	.speed(speed), // user input for motor speed
    .phases(phases), // just connect them to FPGA (motor driver)
	.stop(stop) // user input for stopping the motor
);



// this module shows 4 decimal numbers on 4-digit 7-Segment.  
// 4 digits are scanned with high speed, then you do not notice that every time 
// only one of them is ON. dp is always off.
//SevSeg_4digit SevSeg(
//    clk,
//    in0, in1, in2, in3, //user inputs for each digit (hexadecimal value)
//    a, b, c, d, e, f, g, dp, // just connect them to FPGA pins (individual LEDs).
//    an   // just connect them to FPGA pins (enable vector for 4 digits, active low)
//);

endmodule
