module shiftregister(sysclk, reset_led, reset_score, button0, button1, button2, 
led0, led1, led2, led3, led4, led5, led6, //led7, 
led8, led9, led10, led11, led12, led13, led14, led15, 
led16, led17, led18, led19, led20, led21, led22, led23, 
seg_a, seg_b, seg_c, seg_d, seg_e, seg_f, seg_g, 
an3, an2, an1, an0);
	
//input ports					
input sysclk, reset_led, reset_score, button0, button1, button2;

//output ports (led7 is commented out because it is connected to VCC)

output led0, led1, led2, led3, led4, led5, led6; //led7;
output led8, led9, led10, led11, led12, led13, led14, led15;
output led16, led17, led18, led19, led20, led21, led22, led23;

output seg_a, seg_b, seg_c, seg_d, seg_e, seg_f, seg_g, an3, an2, an1, an0;
	 
reg [7:0] temp0, temp1, temp2; //temporary array to store values in shift register to for shifting LED signals
wire [88:0] shiftin0, shiftin1, shiftin2; //inputs for shift register
	
wire clock, faster_clock; 
wire en = 1; //enable
wire res = 0; //reset

//counter for going through array of inputs for shift register
integer i; 
	
	//inputs to the 3 column of LEDs, pattern in sync with song “Eye of the Tiger” if
   //played at appropriate speed

//right column
assign shiftin0[0] = 1, shiftin0[1] = 0, shiftin0[2] = 0, shiftin0[3] = 0;
	assign shiftin0[4] = 1, shiftin0[5] = 0, shiftin0[6] = 0, shiftin0[7] = 0;
	assign shiftin0[8] = 1, shiftin0[9] = 0, shiftin0[10] = 0, shiftin0[11] = 0;
	assign shiftin0[12] = 1, shiftin0[13] = 0, shiftin0[14] = 0, shiftin0[15] = 0;
	assign shiftin0[16] = 1, shiftin0[17] = 0, shiftin0[18] = 1, shiftin0[19] = 0;
	assign shiftin0[20] = 1, shiftin0[21] = 0, shiftin0[22] = 1, shiftin0[23] = 0;
	assign shiftin0[24] = 1, shiftin0[25] = 0, shiftin0[26] = 1, shiftin0[27] = 0;
	assign shiftin0[28] = 0, shiftin0[29] = 0, shiftin0[30] = 0, shiftin0[31] = 0;
	assign shiftin0[32] = 1, shiftin0[33] = 0, shiftin0[34] = 1, shiftin0[35] = 0;
	assign shiftin0[36] = 1, shiftin0[37] = 0, shiftin0[38] = 1, shiftin0[39] = 0;
	assign shiftin0[40] = 1, shiftin0[41] = 0, shiftin0[42] = 1, shiftin0[43] = 0;
	assign shiftin0[44] = 0, shiftin0[45] = 0, shiftin0[46] = 0, shiftin0[47] = 0;
	assign shiftin0[48] = 1, shiftin0[49] = 0, shiftin0[50] = 1, shiftin0[51] = 0;
	assign shiftin0[52] = 1, shiftin0[53] = 1, shiftin0[54] = 0, shiftin0[55] = 0;
	assign shiftin0[56] = 0, shiftin0[57] = 0, shiftin0[58] = 1, shiftin0[59] = 0;
	assign shiftin0[60] = 0, shiftin0[61] = 0, shiftin0[62] = 0, shiftin0[63] = 0;
	assign shiftin0[64] = 1, shiftin0[65] = 0, shiftin0[66] = 1, shiftin0[67] = 0;
	assign shiftin0[68] = 1, shiftin0[69] = 1, shiftin0[70] = 0, shiftin0[71] = 0;	
	assign shiftin0[72] = 0, shiftin0[73] = 0, shiftin0[74] = 1, shiftin0[75] = 0;
	assign shiftin0[76] = 0, shiftin0[77] = 0, shiftin0[78] = 0, shiftin0[79] = 0;
	assign shiftin0[80] = 1, shiftin0[81] = 1, shiftin0[82] = 0, shiftin0[83] = 0;
	assign shiftin0[84] = 0, shiftin0[85] = 0, shiftin0[86] = 0, shiftin0[87] = 0;
	assign shiftin0[88] = 0;
	
//middle column
	assign shiftin1[0]= 0, shiftin1[1]= 0, shiftin1[2]= 0, shiftin1[3]= 0;
	assign shiftin1[4]= 0, shiftin1[5]= 0, shiftin1[6]= 0, shiftin1[7]= 0;	
	assign shiftin1[8]= 0, shiftin1[9]= 0, shiftin1[10]= 0, shiftin1[11]= 0;	
	assign shiftin1[12]= 0, shiftin1[13]= 0, shiftin1[14]= 0, shiftin1[15]= 0;
	assign shiftin1[16]= 0, shiftin1[17]= 0, shiftin1[18]= 0, shiftin1[19]= 1;	
	assign shiftin1[20]= 0, shiftin1[21]= 0, shiftin1[22]= 0, shiftin1[23]= 1;	
	assign shiftin1[24]= 0, shiftin1[25]= 0, shiftin1[26]= 0, shiftin1[27]= 1;	
	assign shiftin1[28]= 0, shiftin1[29]= 0, shiftin1[30]= 0, shiftin1[31]= 0;
	assign shiftin1[32]= 0, shiftin1[33]= 0, shiftin1[34]= 0, shiftin1[35]= 1;
	assign shiftin1[36]= 0, shiftin1[37]= 0, shiftin1[38]= 0, shiftin1[39]= 1;
	assign shiftin1[40]= 0, shiftin1[41]= 0, shiftin1[42]= 0, shiftin1[43]= 1;	
	assign shiftin1[44]= 0, shiftin1[45]= 0, shiftin1[46]= 0, shiftin1[47]= 0;	
	assign shiftin1[48]= 0, shiftin1[49]= 0, shiftin1[50]= 0, shiftin1[51]= 1;
	assign shiftin1[52]= 0, shiftin1[53]= 0, shiftin1[54]= 1, shiftin1[55]= 0;	
	assign shiftin1[56]= 1, shiftin1[57]= 1, shiftin1[58]= 0, shiftin1[59]= 1;
	assign shiftin1[60]= 0, shiftin1[61]= 0, shiftin1[62]= 0, shiftin1[63]= 0;
	assign shiftin1[64]= 0, shiftin1[65]= 0, shiftin1[66]= 0, shiftin1[67]= 1;
	assign shiftin1[68]= 0, shiftin1[69]= 0, shiftin1[70]= 1, shiftin1[71]= 0;
	assign shiftin1[72]= 1, shiftin1[73]= 1, shiftin1[74]= 0, shiftin1[75]= 1;
	assign shiftin1[76]= 0, shiftin1[77]= 0, shiftin1[78]= 0, shiftin1[79]= 0;
	assign shiftin1[80]= 0, shiftin1[81]= 0, shiftin1[82]= 0, shiftin1[83]= 0;
	assign shiftin1[84]= 0, shiftin1[85]= 0, shiftin1[86]= 0, shiftin1[87]= 0, shiftin1[88]=0;
	
//left column
	assign shiftin2[0]= 0, shiftin2[1]= 0, shiftin2[2]= 1, shiftin2[3]= 0;	
	assign shiftin2[4]= 0, shiftin2[5]= 0, shiftin2[6]= 1, shiftin2[7]= 0;
	assign shiftin2[8]= 0, shiftin2[9]= 0, shiftin2[10]= 1, shiftin2[11]= 0;
	assign shiftin2[12]= 0, shiftin2[13]= 0, shiftin2[14]= 1, shiftin2[15]= 0;
	assign shiftin2[16]= 1, shiftin2[17]= 0, shiftin2[18]= 1, shiftin2[19]= 0;
	assign shiftin2[20]= 1, shiftin2[21]= 0, shiftin2[22]= 1, shiftin2[23]= 0;
	assign shiftin2[24]= 1, shiftin2[25]= 0, shiftin2[26]= 1, shiftin2[27]= 0;
	assign shiftin2[28]= 1, shiftin2[29]= 1, shiftin2[30]= 1, shiftin2[31]= 1;
	assign shiftin2[32]= 1, shiftin2[33]= 0, shiftin2[34]= 1, shiftin2[35]= 0;
	assign shiftin2[36]= 1, shiftin2[37]= 0, shiftin2[38]= 1, shiftin2[39]= 0;
	assign shiftin2[40]= 1, shiftin2[41]= 0, shiftin2[42]= 1, shiftin2[43]= 0;
	assign shiftin2[44]= 1, shiftin2[45]= 1, shiftin2[46]= 1, shiftin2[47]= 1;
	assign shiftin2[48]= 1, shiftin2[49]= 0, shiftin2[50]= 0, shiftin2[51]= 0;
	assign shiftin2[52]= 0, shiftin2[53]= 0, shiftin2[54]= 0, shiftin2[55]= 1;
	assign shiftin2[56]= 0, shiftin2[57]= 0, shiftin2[58]= 1, shiftin2[59]= 0;
	assign shiftin2[60]= 1, shiftin2[61]= 1, shiftin2[62]= 1, shiftin2[63]= 1;
	assign shiftin2[64]= 1, shiftin2[65]= 0, shiftin2[66]= 0, shiftin2[67]= 0;
	assign shiftin2[68]= 0, shiftin2[69]= 0, shiftin2[70]= 0, shiftin2[71]= 1;
	assign shiftin2[72]= 0, shiftin2[73]= 0, shiftin2[74]= 1, shiftin2[75]= 0;
	assign shiftin2[76]= 1, shiftin2[77]= 1, shiftin2[78]= 1, shiftin2[79]= 1;
	assign shiftin2[80]= 1, shiftin2[81]= 1, shiftin2[82]= 0, shiftin2[83]= 0;
	assign shiftin2[84]= 0, shiftin2[85]= 0, shiftin2[86]= 0, shiftin2[87]= 0, shiftin2[88]=0;

//slow down system clock to shift LED signals
	counter count1 (sysclk, res, en, clock);
//slow down system clock to update score
	counter_faster_clock count2 (sysclk, res, en, faster_clock);
	
	always @(posedge clock) begin
		 //if reset is ON, array resets to 0
			 if (reset_led) begin 
				temp0 <= 0;
				temp1 <= 0;
				temp2 <= 0;

			 end

			 //keep shifting LED value one space down until at the end of song
			 else if (i < 88) begin 
				temp0    <= temp0 >> 1;
				temp0[7] <= shiftin0[i];
				
				temp1    <= temp1 >> 1;
				temp1[7] <= shiftin1[i];
				
				temp2    <= temp2 >> 1;
				temp2[7] <= shiftin2[i];
				
				i <= i + 1;
			 end

			 //go back to beginning of song once finished
			 else begin
				i <= 0;
				temp0    <= temp0 >> 1;
				temp0[7] <= shiftin0[0];
				
				temp1    <= temp1 >> 1;
				temp1[7] <= shiftin1[0];
				
				temp2    <= temp2 >> 1;
				temp2[7] <= shiftin2[0];
			 end	
	end

	//assign elements temporary array to LEDs

	//assign led7 = temp0[7]; //don’t use led7 because it’s connected to VCC
	assign led6 = temp0[6];
            assign led5 = temp0[5];
            assign led4 = temp0[4];	 
            assign led3 = temp0[3];
	assign led2 = temp0[2];
	assign led1 = temp0[1];
	assign led0 = temp0[0];
	
	assign led15 = temp1[7];
	assign led14 = temp1[6];
            assign led13 = temp1[5];
            assign led12 = temp1[4];	 
            assign led11 = temp1[3];
	assign led10 = temp1[2];
	assign led9 = temp1[1];
	assign led8 = temp1[0];
	
	assign led23 = temp2[7];
	assign led22 = temp2[6];
            assign led21 = temp2[5];
            assign led20 = temp2[4];	 
            assign led19 = temp2[3];
	assign led18 = temp2[2];
	assign led17 = temp2[1];
	assign led16 = temp2[0];

//score-keeping module
	pushbutton push1 (faster_clock, faster_clock, reset_score, button0, button1, button2,   led0, led8, led16, seg_a, seg_b, seg_c, seg_d, seg_e, seg_f, seg_g, an3, an2, an1, an0);

endmodule

//counter that slows down system clock by factor of 24
module counter (sysclock, reset, enable, b24);

	input sysclock ;
	input reset ;
	input enable ;
	
	output b24; 
	
	wire sysclock ;
	wire reset ;
	wire enable ;
	
	reg [23:0] counter_out ;
	
	always @ (posedge sysclock) begin 
	
	  if (reset) begin
		 counter_out <= 0;
	  end
	
	  else if (enable) begin
		 counter_out <= counter_out + 1;
	  end
	  
	end 
	
	assign b24 = counter_out[23];

endmodule

//counter that slows down system clock by factor of 16
module counter_faster_clock (sysclock, reset, enable, b16);

	input sysclock ;
	input reset ;
	input enable ;
	
	output b16; 
	
	wire sysclock ;
	wire reset ;
	wire enable ;
	
	reg [15:0] counter_out ;
	
	always @ (posedge sysclock) begin 
	
	  if (reset) begin
		 counter_out <= 0;
	  end
	
	  else if (enable) begin
		 counter_out <= counter_out + 1;
	  end
	  
	end 
	
	assign b16 = counter_out[15];

endmodule

module pushbutton(clo, sclk, reset, button0, button1, button2, led0, led8, led16, 
                      seg_a, seg_b, seg_c, seg_d, seg_e, seg_f, seg_g, an3, an2, an1, an0);

	input clo, sclk, button0, button1, button2, led0, led8, led16, reset;
	output seg_a, seg_b, seg_c, seg_d, seg_e, seg_f, seg_g, an3, an2, an1, an0;

	reg [15:0] score;
	wire clo;
	
	wire seg_a, seg_b, seg_c, seg_d, seg_e, seg_f, seg_g; 
	reg an3, an2, an1, an0; //controls which digit of the score gets updated
	reg [3:0] scoredigit; //stores one digit of the score
	reg [6:0] out;
	
	reg [1:0] count; //counter to determine which digit gets updated

	always @(posedge clo) 
		count <= count + 1;
	
	always @(posedge sclk) begin
		
		if (reset) begin
			score <= 0;
		end

	//if bottom LEDs are ON and corresponding push button is pressed, score
//increments by 1 (score stored in BCD form)
		else if ( (led0 & button0) | (led8 & button1) | (led16 & button2) ) begin
			if (score[3:0] == 4'b1001) 
				score <= score + 7;
			else 		
				score <= score + 1;
		end	

		//if bottom LED is OFF and button is pressed, score decrements by 1
	else if ( ( (~led0 & button0) | (~led8 & button1) | (~led16 & button2) ) & (score > 0)) begin
			if (score[3:0] == 4'b0000)
				score <= score - 7;
			else
				score <= score - 1;
		end
	end	

	//update score output one digit at a time starting from the least significant bit
//an0, an1, an2, and an3 determine which of the four 7-segment LEDs is allowed to be
//changed (active low)
	always @(posedge clo) begin
		if (count == 0) begin //update last digit
			scoredigit <= score [3:0]; 
			an0 <= 0;
			an1 <= 1;
			an2 <= 1;
			an3 <= 1;
		end
		else if (count == 1) begin //update second last digit
			scoredigit <= score [7:4]; 
			an0 <= 1;
			an1 <= 0;
			an2 <= 1;
			an3 <= 1;
		end
		else if (count == 2) begin //update second digit
			scoredigit <= score [11:8]; 
			an0 <= 1;
			an1 <= 1;
			an2 <= 0;
			an3 <= 1;
		end
		else if (count == 3) begin //update first digit
			scoredigit <= score [15:12]; 
			an0 <= 1;
			an1 <= 1;
			an2 <= 1;
			an3 <= 0;
		end
	end

	//program 7-segment LED patterns for numbers 0 to 9
	always @( scoredigit ) begin
		case (scoredigit)
			4'b0000: out = 7'b0000001; //0
			4'b0001: out = 7'b1001111; //1
			4'b0010: out = 7'b0010010; //2
			4'b0011: out = 7'b0000110; //3
			4'b0100: out = 7'b1001100; //4
			4'b0101: out = 7'b0100100; //5
			4'b0110: out = 7'b0100000; //6
			4'b0111: out = 7'b0001111; //7
			4'b1000: out = 7'b0000000; //8
			4'b1001: out = 7'b0000100; //9
			default: out = 7'b0000001; //0
		endcase
	end

	assign seg_a = out[6];
	assign seg_b = out[5];
	assign seg_c = out[4];
	assign seg_d = out[3];
	assign seg_e = out[2];
	assign seg_f = out[1];
	assign seg_g = out[0];
	
endmodule
