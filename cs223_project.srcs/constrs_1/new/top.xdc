
#------------------------------------------------------------
#---------------------- Clock signal ------------------------
#------------------------------------------------------------
set_property PACKAGE_PIN W5 [get_ports clk]  	 	 	 	  
set_property IOSTANDARD LVCMOS33 [get_ports clk] 
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk] 

#------------------------------------------------------------
#--------------------  user inputs for score ----------------
#------------------------------------------------------------
set_property PACKAGE_PIN U1 [get_ports reset] 	 	 	 	 	 
 	set_property IOSTANDARD LVCMOS33 [get_ports reset]
set_property PACKAGE_PIN R2 [get_ports dec_l] 	 	 	 	 	 
    set_property IOSTANDARD LVCMOS33 [get_ports dec_l]
set_property PACKAGE_PIN V16 [get_ports dec_r] 	 	 	 	 	 
    set_property IOSTANDARD LVCMOS33 [get_ports dec_r]
set_property PACKAGE_PIN T1 [get_ports inc_l]                  	 
    set_property IOSTANDARD LVCMOS33 [get_ports inc_l] 
set_property PACKAGE_PIN V17 [get_ports inc_r] 	 	 	 	 	 
    set_property IOSTANDARD LVCMOS33 [get_ports inc_r] 
set_property PACKAGE_PIN W16 [get_ports newGame] 	 	 	 	 	 
    set_property IOSTANDARD LVCMOS33 [get_ports newGame]   
# BUTTONS    
#set_property PACKAGE_PIN T18 [get_ports row1] 	 	 	 	 	 
#    set_property IOSTANDARD LVCMOS33 [get_ports row1]
#set_property PACKAGE_PIN T17 [get_ports row2]                          
#    set_property IOSTANDARD LVCMOS33 [get_ports row2]
#set_property PACKAGE_PIN U17 [get_ports row3]                       
#    set_property IOSTANDARD LVCMOS33 [get_ports row3] 
#set_property PACKAGE_PIN W19 [get_ports row4]                          
#    set_property IOSTANDARD LVCMOS33 [get_ports row4] 
#set_property PACKAGE_PIN U18 [get_ports changePlayer]                          
#    set_property IOSTANDARD LVCMOS33 [get_ports changePlayer]     

# SWITCHES FOR GAME INPUTS
set_property PACKAGE_PIN T3 [get_ports row1] 	 	 	 	 	 
    set_property IOSTANDARD LVCMOS33 [get_ports row1]
set_property PACKAGE_PIN V2 [get_ports row2]                          
    set_property IOSTANDARD LVCMOS33 [get_ports row2]
set_property PACKAGE_PIN W13 [get_ports row3]                       
    set_property IOSTANDARD LVCMOS33 [get_ports row3] 
set_property PACKAGE_PIN W14 [get_ports row4]                          
    set_property IOSTANDARD LVCMOS33 [get_ports row4] 
set_property PACKAGE_PIN V15 [get_ports changePlayer]                          
    set_property IOSTANDARD LVCMOS33 [get_ports changePlayer]                       
                         
                         
#------------------------------------------------------------
#-------------------- 7 segment display ---------------------
#------------------------------------------------------------
set_property PACKAGE_PIN W7 [get_ports {a}] 	 	 	 	 	 
 	set_property IOSTANDARD LVCMOS33 [get_ports {a}] 
set_property PACKAGE_PIN W6 [get_ports {b}] 	 	 	 	 	 
 	set_property IOSTANDARD LVCMOS33 [get_ports {b}] 
set_property PACKAGE_PIN U8 [get_ports {c}] 	 	 	 	 	 
 	set_property IOSTANDARD LVCMOS33 [get_ports {c}] 
set_property PACKAGE_PIN V8 [get_ports {d}] 	 	 	 	 	 
 	set_property IOSTANDARD LVCMOS33 [get_ports {d}] 
set_property PACKAGE_PIN U5 [get_ports {e}] 	 	 	 	 	 
 	set_property IOSTANDARD LVCMOS33 [get_ports {e}] 
set_property PACKAGE_PIN V5 [get_ports {f}] 	 	 	 	 	 
 	set_property IOSTANDARD LVCMOS33 [get_ports {f}] 
set_property PACKAGE_PIN U7 [get_ports {g}] 	 	 	 	 	 
 	set_property IOSTANDARD LVCMOS33 [get_ports {g}] 
set_property PACKAGE_PIN V7 [get_ports dp]  	 	 	 	  
 	set_property IOSTANDARD LVCMOS33 [get_ports dp] 
	
set_property PACKAGE_PIN U2 [get_ports {an[0]}] 	 	 	 	 	 
 	set_property IOSTANDARD LVCMOS33 [get_ports {an[0]}] 
set_property PACKAGE_PIN U4 [get_ports {an[1]}] 	 	 	 	 	 
 	set_property IOSTANDARD LVCMOS33 [get_ports {an[1]}] 
set_property PACKAGE_PIN V4 [get_ports {an[2]}] 	 	 	 	 	 
 	set_property IOSTANDARD LVCMOS33 [get_ports {an[2]}] 
set_property PACKAGE_PIN W4 [get_ports {an[3]}] 	 	 	 	 	 
 	set_property IOSTANDARD LVCMOS33 [get_ports {an[3]}] 


	
#------------------------------------------------------------
#---------------------- Stepper motor -----------------------
#------------------------------------------------------------	

###4 phases
###step motor: Bb
#set_property PACKAGE_PIN V19 [get_ports {phases[0]}]	 	 	 	 
# 	set_property IOSTANDARD  LVCMOS33 [get_ports {phases[0]}] 
##step motor: Ab
#set_property PACKAGE_PIN U19 [get_ports {phases[1]}] 	 	 	 	 	 
# 	set_property IOSTANDARD  LVCMOS33 [get_ports {phases[1]}] 
##step motor: B
#set_property PACKAGE_PIN E19 [get_ports {phases[2]}] 	 	 	 	 	 
# 	set_property IOSTANDARD  LVCMOS33 [get_ports {phases[2]}] 
##step motor: A
#set_property PACKAGE_PIN U16 [get_ports {phases[3]}] 	 	 	 	 	 
# 	set_property IOSTANDARD  LVCMOS33 [get_ports {phases[3]}]
 	
 	
#LEDS
set_property PACKAGE_PIN L1 [get_ports {currentState[3]}] 	 	 	 	 	 
 	set_property IOSTANDARD  LVCMOS33 [get_ports {currentState[3]}] 
set_property PACKAGE_PIN P1 [get_ports {currentState[2]}] 	 	 	 	 	 
    set_property IOSTANDARD  LVCMOS33 [get_ports {currentState[2]}] 
set_property PACKAGE_PIN N3 [get_ports {currentState[1]}]                          
    set_property IOSTANDARD  LVCMOS33 [get_ports {currentState[1]}]  	  	
set_property PACKAGE_PIN P3 [get_ports {currentState[0]}]                          
    set_property IOSTANDARD  LVCMOS33 [get_ports {currentState[0]}]
    
    
set_property PACKAGE_PIN U3 [get_ports {currentStateG[3]}] 	 	 	 	 	 
    set_property IOSTANDARD  LVCMOS33 [get_ports {currentStateG[3]}] 
set_property PACKAGE_PIN W3 [get_ports {currentStateG[2]}]                          
    set_property IOSTANDARD  LVCMOS33 [get_ports {currentStateG[2]}] 
set_property PACKAGE_PIN V3 [get_ports {currentStateG[1]}]                          
    set_property IOSTANDARD  LVCMOS33 [get_ports {currentStateG[1]}]            
set_property PACKAGE_PIN V13 [get_ports {currentStateG[0]}]                          
    set_property IOSTANDARD  LVCMOS33 [get_ports {currentStateG[0]}]      	
##direction	
#set_property PACKAGE_PIN R2 [get_ports {direction}] 	 	 	 	 	 
# 	set_property IOSTANDARD  LVCMOS33 [get_ports {direction}] 

##speed
#set_property PACKAGE_PIN U1 [get_ports {speed[0]}] 	 	 	 	 	 
# 	set_property IOSTANDARD  LVCMOS33 [get_ports {speed[0]}] 	
#set_property PACKAGE_PIN T1 [get_ports {speed[1]}] 	 	 	 	 	 
# 	set_property IOSTANDARD  LVCMOS33 [get_ports {speed[1]}]

#stop	
#set_property PACKAGE_PIN W2 [get_ports {stop}] 	 	 	 	 	 
# 	set_property IOSTANDARD  LVCMOS33 [get_ports {stop}] 


#------------------------------------------------------------
#---------------------- Display Connector--------------------
#------------------------------------------------------------
set_property PACKAGE_PIN L17 [get_ports reset_out]
set_property IOSTANDARD LVCMOS33 [get_ports reset_out]

set_property PACKAGE_PIN M18 [get_ports OE]
set_property IOSTANDARD LVCMOS33 [get_ports OE]

set_property PACKAGE_PIN P18 [get_ports SH_CP]
set_property IOSTANDARD LVCMOS33 [get_ports SH_CP]

set_property PACKAGE_PIN N17 [get_ports ST_CP]
set_property IOSTANDARD LVCMOS33 [get_ports ST_CP]

set_property PACKAGE_PIN K17 [get_ports DS]
set_property IOSTANDARD LVCMOS33 [get_ports DS]

set_property PACKAGE_PIN A14 [get_ports {col_select[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {col_select[0]}]

set_property PACKAGE_PIN A16 [get_ports {col_select[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {col_select[1]}]

set_property PACKAGE_PIN B15 [get_ports {col_select[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {col_select[2]}]

set_property PACKAGE_PIN B16 [get_ports {col_select[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {col_select[3]}]

set_property PACKAGE_PIN A15 [get_ports {col_select[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {col_select[4]}]

set_property PACKAGE_PIN A17 [get_ports {col_select[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {col_select[5]}]

set_property PACKAGE_PIN C15 [get_ports {col_select[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {col_select[6]}]

set_property PACKAGE_PIN C16 [get_ports {col_select[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {col_select[7]}]

#------------------------------------------------------------
#---------------- Ports for step motor ----------------------
#------------------------------------------------------------
set_property PACKAGE_PIN J1 [get_ports {phases[0]}]					
   set_property IOSTANDARD LVCMOS33 [get_ports {phases[0]}]
set_property PACKAGE_PIN J2 [get_ports {phases[1]}]                    
    set_property IOSTANDARD LVCMOS33 [get_ports {phases[1]}]
set_property PACKAGE_PIN G2 [get_ports {phases[2]}]                    
    set_property IOSTANDARD LVCMOS33 [get_ports {phases[2]}]
set_property PACKAGE_PIN L2 [get_ports {phases[3]}]                    
    set_property IOSTANDARD LVCMOS33 [get_ports {phases[3]}] 



