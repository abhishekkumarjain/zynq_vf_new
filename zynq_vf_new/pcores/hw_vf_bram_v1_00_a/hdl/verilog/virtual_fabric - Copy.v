`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:49:27 12/12/2012 
// Design Name: 
// Module Name:    virtual_fabric 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module virtual_fabric(clk,rst,en,data_in,data_out,
							 dsp_config0,dsp_config1,dsp_config2,dsp_config3,
							 dsp_config0_d,dsp_config1_d,dsp_config2_d,dsp_config3_d,
							 dsp_config0_pb,dsp_config1_pb,dsp_config2_pb,dsp_config3_pb,
							 cb_config0_ws,cb_config0_en,
							 cb_config1_ws,cb_config1_en,
							 cb_config2_ws,cb_config2_en,
							 cb_config3_ws,cb_config3_en,
							 cb_config4_ws,cb_config4_en							 
							 );

input clk;
input rst;
input en;
input[31:0] data_in;
input[31:0] dsp_config0;
input[31:0] dsp_config1;
input[31:0] dsp_config2;
input[31:0] dsp_config3;
input[31:0] dsp_config0_d;
input[31:0] dsp_config1_d;
input[31:0] dsp_config2_d;
input[31:0] dsp_config3_d;
input[31:0] dsp_config0_pb;
input[31:0] dsp_config1_pb;
input[31:0] dsp_config2_pb;
input[31:0] dsp_config3_pb;
input[31:0] cb_config0_ws;
input[31:0] cb_config0_en;
input[31:0] cb_config1_ws;
input[31:0] cb_config1_en;
input[31:0] cb_config2_ws;
input[31:0] cb_config2_en;
input[31:0] cb_config3_ws;
input[31:0] cb_config3_en;
input[31:0] cb_config4_ws;
input[31:0] cb_config4_en;

output [31:0] data_out;

wire[31:0] data_valid;
wire[15:0] coeff_valid0;
wire[15:0] coeff_valid1;
wire[15:0] coeff_valid2;
wire[15:0] coeff_valid3;


wire[3:0] alumode=dsp_config0[31:28];
wire[4:0] inmode=dsp_config0[27:23];
wire[6:0] opmode=dsp_config0[22:16];
wire[1:0] dir_sel=dsp_config0[15:14];
wire dsel=dsp_config0[13];
wire psel=dsp_config0[12];
wire bsel=dsp_config0[11];




wire[3:0] alumode1=dsp_config1[31:28];
wire[4:0] inmode1=dsp_config1[27:23];
wire[6:0] opmode1=dsp_config1[22:16];
wire[1:0] dir_sel1=dsp_config1[15:14];
wire dsel1=dsp_config1[13];
wire psel1=dsp_config1[12];
wire bsel1=dsp_config1[11];

wire[3:0] alumode2=dsp_config2[31:28];
wire[4:0] inmode2=dsp_config2[27:23];
wire[6:0] opmode2=dsp_config2[22:16];
wire[1:0] dir_sel2=dsp_config2[15:14];
wire dsel2=dsp_config2[13];
wire psel2=dsp_config2[12];
wire bsel2=dsp_config2[11];

wire[3:0] alumode3=dsp_config3[31:28];
wire[4:0] inmode3=dsp_config3[27:23];
wire[6:0] opmode3=dsp_config3[22:16];
wire[1:0] dir_sel3=dsp_config3[15:14];
wire dsel3=dsp_config3[13];
wire psel3=dsp_config3[12];
wire bsel3=dsp_config3[11];

wire[15:0] coeff0=dsp_config0_d[15:0];		//d_im0
wire[15:0] coeff1=dsp_config1_d[15:0];		//d_im1
wire[15:0] coeff2=dsp_config2_d[15:0];		//d_im2
wire[15:0] coeff3=dsp_config3_d[15:0];		//d_im3


wire[15:0] p_im0=dsp_config0_pb[31:16];
wire[15:0] p_im1=dsp_config1_pb[31:16];
wire[15:0] p_im2=dsp_config2_pb[31:16];
wire[15:0] p_im3=dsp_config3_pb[31:16];

wire[15:0] b_im0=dsp_config0_pb[15:0];
wire[15:0] b_im1=dsp_config1_pb[15:0];
wire[15:0] b_im2=dsp_config2_pb[15:0];
wire[15:0] b_im3=dsp_config3_pb[15:0];

assign data_valid = (en) ? data_in : 32'd0;
assign coeff_valid0 = (en) ? coeff0 : 16'd0;
assign coeff_valid1 = (en) ? coeff1 : 16'd0;
assign coeff_valid2 = (en) ? coeff2 : 16'd0;
assign coeff_valid3 = (en) ? coeff3 : 16'd0;


wire[47:0] dpb1,dpb2,dpb3,dpb4,dpb5,dpb6,dpb7,dpb8,dpb9;

CB c0(
		.w_b_in(data_valid[15:0]),
		.w_d_in(16'd0),
		.w_p_in(data_valid[31:16]),
		.e_b_out(dpb1[15:0]),
		.e_d_out(dpb1[47:32]),
		.e_p_out(dpb1[31:16]),
		.e_b_mux(cb_config0_en[23:20]),
		.e_d_mux(cb_config0_en[19:16]),
		.e_p_mux(cb_config0_en[15:12]),
		.n_b_mux(cb_config0_en[11:8]),
		.n_d_mux(cb_config0_en[7:4]),
		.n_p_mux(cb_config0_en[3:0])		
		);

pe_single_cycle_latency p0(
		.clk(clk),
		.rst(rst),
		.en(en),

		.d_im(coeff_valid0),
		.p_im(p_im0),
		.b_im(b_im0),
		
		.w_in(dpb1),
		.e_out(dpb2),

		.alumode(alumode),
		.inmode(inmode),
		.opmode(opmode),
		.sel(dir_sel),
		.dsel(dsel),
		.psel(psel),
		.bsel(bsel)
		);	

CB c1(
		.w_b_in(dpb2[15:0]),
		.w_d_in(dpb2[47:32]),
		.w_p_in(dpb2[31:16]),
		.e_b_out(dpb3[15:0]),
		.e_d_out(dpb3[47:32]),
		.e_p_out(dpb3[31:16]),
		.e_b_mux(cb_config1_en[23:20]),
		.e_d_mux(cb_config1_en[19:16]),
		.e_p_mux(cb_config1_en[15:12]),
		.n_b_mux(cb_config1_en[11:8]),
		.n_d_mux(cb_config1_en[7:4]),
		.n_p_mux(cb_config1_en[3:0])		
		);
	
pe_single_cycle_latency p1(
		.clk(clk),
		.rst(rst),
		.en(en),
		
		.d_im(coeff_valid1),		
		.p_im(p_im1),
		.b_im(b_im1),
		
		.w_in(dpb3),
		.e_out(dpb4),
		
		.alumode(alumode1),
		.inmode(inmode1),
		.opmode(opmode1),
		.sel(dir_sel1),		
		.dsel(dsel1),
		.psel(psel1),
		.bsel(bsel1)
		);	

CB c2(
		.w_b_in(dpb4[15:0]),
		.w_d_in(dpb4[47:32]),
		.w_p_in(dpb4[31:16]),
		.s_b_out(dpb5[15:0]),
		.s_d_out(dpb5[47:32]),
		.s_p_out(dpb5[31:16]),
	   .w_b_mux(cb_config2_ws[23:20]),
		.w_d_mux(cb_config2_ws[19:16]),
		.w_p_mux(cb_config2_ws[15:12]),
		.s_b_mux(cb_config2_ws[11:8]),
		.s_d_mux(cb_config2_ws[7:4]),
		.s_p_mux(cb_config2_ws[3:0]),
		.e_b_mux(cb_config2_en[23:20]),
		.e_d_mux(cb_config2_en[19:16]),
		.e_p_mux(cb_config2_en[15:12]),
		.n_b_mux(cb_config2_en[11:8]),
		.n_d_mux(cb_config2_en[7:4]),
		.n_p_mux(cb_config2_en[3:0])		
		);
		
pe_single_cycle_latency p2(
		.clk(clk),
		.rst(rst),
		.en(en),
		
		.d_im(coeff_valid2),		
		.p_im(p_im2),
		.b_im(b_im2),
		
		.n_in(dpb5),
		.w_out(dpb6),
		
		.alumode(alumode2),
		.inmode(inmode2),
		.opmode(opmode2),
		.sel(dir_sel2),		
		.dsel(dsel2),
		.psel(psel2),
		.bsel(bsel2)
		);	

CB c3(
		.e_b_in(dpb6[15:0]),
		.e_d_in(dpb6[47:32]),
		.e_p_in(dpb6[31:16]),
		.w_b_out(dpb7[15:0]),
		.w_d_out(dpb7[47:32]),
		.w_p_out(dpb7[31:16]),
		.w_b_mux(cb_config3_ws[23:20]),
		.w_d_mux(cb_config3_ws[19:16]),
		.w_p_mux(cb_config3_ws[15:12]),
		.s_b_mux(cb_config3_ws[11:8]),
		.s_d_mux(cb_config3_ws[7:4]),
		.s_p_mux(cb_config3_ws[3:0]),
		.e_b_mux(cb_config3_en[23:20]),
		.e_d_mux(cb_config3_en[19:16]),
		.e_p_mux(cb_config3_en[15:12]),
		.n_b_mux(cb_config3_en[11:8]),
		.n_d_mux(cb_config3_en[7:4]),
		.n_p_mux(cb_config3_en[3:0])		
		);
		
pe_single_cycle_latency p3(
		.clk(clk),
		.rst(rst),
		.en(en),
		
		.d_im(coeff_valid3),		
		.p_im(p_im3),
		.b_im(b_im3),
		
		.e_in(dpb7),
		.w_out(dpb8),
		
		.alumode(alumode3),
		.inmode(inmode3),
		.opmode(opmode3),
		.sel(dir_sel3),		
		.dsel(dsel3),
		.psel(psel3),
		.bsel(bsel3)
		);	
CB c4(
		.e_b_in(dpb8[15:0]),
		.e_d_in(dpb8[47:32]),
		.e_p_in(dpb8[31:16]),
		.w_b_out(dpb9[15:0]),
		.w_d_out(dpb9[47:32]),
		.w_p_out(dpb9[31:16]),
		.w_b_mux(cb_config4_ws[23:20]),
		.w_d_mux(cb_config4_ws[19:16]),
		.w_p_mux(cb_config4_ws[15:12]),
		.s_b_mux(cb_config4_ws[11:8]),
		.s_d_mux(cb_config4_ws[7:4]),
		.s_p_mux(cb_config4_ws[3:0]),
		.e_b_mux(cb_config4_en[23:20]),
		.e_d_mux(cb_config4_en[19:16]),
		.e_p_mux(cb_config4_en[15:12]),
		.n_b_mux(cb_config4_en[11:8]),
		.n_d_mux(cb_config4_en[7:4]),
		.n_p_mux(cb_config4_en[3:0])		
		);		
		
		
assign data_out=dpb9[31:0];

endmodule


module CB(w_b_in, w_d_in, w_p_in, s_b_in, s_d_in, s_p_in, e_b_in, e_d_in, e_p_in, n_b_in, n_d_in, n_p_in,
			  w_b_out, w_d_out, w_p_out, s_b_out, s_d_out, s_p_out, e_b_out, e_d_out, e_p_out, n_b_out, n_d_out, n_p_out,
			  w_b_mux, w_d_mux, w_p_mux, s_b_mux, s_d_mux, s_p_mux, e_b_mux, e_d_mux, e_p_mux, n_b_mux, n_d_mux, n_p_mux
			 );	 

input [15:0] w_b_in, w_d_in, w_p_in;
input [15:0] s_b_in, s_d_in, s_p_in;
input [15:0] e_b_in, e_d_in, e_p_in;
input [15:0] n_b_in, n_d_in, n_p_in;

input [3:0] w_b_mux, w_d_mux, w_p_mux;
input [3:0] s_b_mux, s_d_mux, s_p_mux;
input [3:0] e_b_mux, e_d_mux, e_p_mux;
input [3:0] n_b_mux, n_d_mux, n_p_mux;

output[15:0] w_b_out, w_d_out, w_p_out;
output[15:0] s_b_out, s_d_out, s_p_out;
output[15:0] e_b_out, e_d_out, e_p_out;
output[15:0] n_b_out, n_d_out, n_p_out;

mux wbmux( w_b_in, w_d_in, w_p_in, n_b_in, n_d_in, n_p_in, e_b_in, e_d_in, e_p_in, s_b_in, s_d_in, s_p_in, w_b_out, w_b_mux);
mux wdmux( w_b_in, w_d_in, w_p_in, n_b_in, n_d_in, n_p_in, e_b_in, e_d_in, e_p_in, s_b_in, s_d_in, s_p_in, w_d_out, w_d_mux);
mux wpmux( w_b_in, w_d_in, w_p_in, n_b_in, n_d_in, n_p_in, e_b_in, e_d_in, e_p_in, s_b_in, s_d_in, s_p_in, w_p_out, w_p_mux);

mux sbmux( s_b_in, s_d_in, s_p_in, w_b_in, w_d_in, w_p_in, n_b_in, n_d_in, n_p_in, e_b_in, e_d_in, e_p_in, s_b_out, s_b_mux);
mux sdmux( s_b_in, s_d_in, s_p_in, w_b_in, w_d_in, w_p_in, n_b_in, n_d_in, n_p_in, e_b_in, e_d_in, e_p_in, s_d_out, s_d_mux);
mux spmux( s_b_in, s_d_in, s_p_in, w_b_in, w_d_in, w_p_in, n_b_in, n_d_in, n_p_in, e_b_in, e_d_in, e_p_in, s_p_out, s_p_mux);

mux ebmux( e_b_in, e_d_in, e_p_in,  s_b_in, s_d_in, s_p_in, w_b_in, w_d_in, w_p_in, n_b_in, n_d_in, n_p_in, e_b_out, e_b_mux);
mux edmux( e_b_in, e_d_in, e_p_in,  s_b_in, s_d_in, s_p_in, w_b_in, w_d_in, w_p_in, n_b_in, n_d_in, n_p_in, e_d_out, e_d_mux);
mux epmux( e_b_in, e_d_in, e_p_in,  s_b_in, s_d_in, s_p_in, w_b_in, w_d_in, w_p_in, n_b_in, n_d_in, n_p_in, e_p_out, e_p_mux);

mux nbmux( n_b_in, n_d_in, n_p_in,  e_b_in, e_d_in, e_p_in, s_b_in, s_d_in, s_p_in, w_b_in, w_d_in, w_p_in, n_b_out, n_b_mux);
mux ndmux( n_b_in, n_d_in, n_p_in,  e_b_in, e_d_in, e_p_in, s_b_in, s_d_in, s_p_in, w_b_in, w_d_in, w_p_in, n_d_out, n_d_mux);
mux npmux( n_b_in, n_d_in, n_p_in,  e_b_in, e_d_in, e_p_in, s_b_in, s_d_in, s_p_in, w_b_in, w_d_in, w_p_in, n_p_out, n_p_mux);

endmodule

module mux(in0,in1,in2,in3,in4,in5,in6,in7,in8,in9,in10,in11,out,sel);
input[15:0] in0,in1,in2,in3,in4,in5,in6,in7,in8,in9,in10,in11;
output reg[15:0] out;
input[3:0] sel;

always @(*)
      case (sel)
		   4'b0000: out = in0;
			4'b0001: out = in1;
			4'b0010: out = in2;
			4'b0011: out = in3;
			4'b0100: out = in4;
			4'b0101: out = in5;
			4'b0110: out = in6;
			4'b0111: out = in7;
			4'b1000: out = in8;
			4'b1001: out = in9;
			4'b1010: out = in10;
			4'b1011: out = in11;
			default: out = 16'hzzzz;
      endcase
endmodule


module pe_single_cycle_latency(clk,rst,en,
										 w_in,s_in,e_in,n_in,
										 w_out,s_out,e_out,n_out,
										 d_im,p_im,b_im,alumode,inmode,opmode,
										 sel,dsel,psel,bsel);
input clk;  
input rst;
input en;
input [47:0] w_in,s_in,e_in,n_in;
output[47:0] w_out,s_out,e_out,n_out;
input[15:0] d_im;
input[15:0] p_im;
input[15:0] b_im; 
input[3:0] alumode;
input[4:0] inmode;
input[6:0] opmode;
input[1:0] sel;
input dsel;
input psel;
input bsel;

wire[15:0] d_in;
wire[15:0] p_in;
wire[15:0] b_in;

wire[15:0] d;
wire[15:0] p;
wire[15:0] b;

wire[15:0] p_d;
wire[47:0] p_d_dsp;

reg[15:0] b_d1;
reg[15:0] b_d2;
reg[15:0] d_d1;

mux48 dspmux(e_in,s_in,w_in,n_in,{d_in,p_in,b_in},sel);

mux16 dmux(d_in,d_im,d,dsel);
mux16 pmux(p_in,p_im,p,psel);
mux16 bmux(b_in,b_im,b,bsel);

assign p_d=p_d_dsp[15:0];
assign w_out={d_d1,p_d,b_d2};
assign s_out={d_d1,p_d,b_d2};
assign e_out={d_d1,p_d,b_d2};
assign n_out={d_d1,p_d,b_d2};

always@(posedge clk)
begin	
	if(rst)
	begin
		b_d1<=16'd0;
		b_d2<=16'd0;
		d_d1<=16'd0;
	end	
	else if(en)
	begin
		b_d1<=b;
		b_d2<=b_d1;
		d_d1<=d;
	end		
	else
	begin
		b_d1<=b_d1;
		b_d2<=b_d2;
		d_d1<=d_d1;
	end
end		
	// DSP48E1: 48-bit Multi-Functional Arithmetic Block Artix-7
   DSP48E1 #(
      // Feature Control Attributes: Data Path Selection
      .A_INPUT("DIRECT"),               // Selects A input source, "DIRECT" (A port) or "CASCADE" (ACIN port)
      .B_INPUT("DIRECT"),               // Selects B input source, "DIRECT" (B port) or "CASCADE" (BCIN port)
      .USE_DPORT("TRUE"),              // Select D port usage (TRUE or FALSE)
      .USE_MULT("MULTIPLY"),            // Select multiplier usage ("MULTIPLY", "DYNAMIC", or "NONE")
      // Pattern Detector Attributes: Pattern Detection Configuration
      .AUTORESET_PATDET("NO_RESET"),    // "NO_RESET", "RESET_MATCH", "RESET_NOT_MATCH" 
      .MASK(48'h3fffffffffff),          // 48-bit mask value for pattern detect (1=ignore)
      .PATTERN(48'h000000000000),       // 48-bit pattern match for pattern detect
      .SEL_MASK("MASK"),                // "C", "MASK", "ROUNDING_MODE1", "ROUNDING_MODE2" 
      .SEL_PATTERN("PATTERN"),          // Select pattern value ("PATTERN" or "C")
      .USE_PATTERN_DETECT("NO_PATDET"), // Enable pattern detect ("PATDET" or "NO_PATDET")
      // Register Control Attributes: Pipeline Register Configuration
      .ACASCREG(0),                     // Number of pipeline stages between A/ACIN and ACOUT (0, 1 or 2)
      .ADREG(0),                        // Number of pipeline stages for pre-adder (0 or 1)
      .ALUMODEREG(0),                   // Number of pipeline stages for ALUMODE (0 or 1)
      .AREG(0),                         // Number of pipeline stages for A (0, 1 or 2)
      .BCASCREG(1),                     // Number of pipeline stages between B/BCIN and BCOUT (0, 1 or 2)
      .BREG(1),                         // Number of pipeline stages for B (0, 1 or 2)
      .CARRYINREG(0),                   // Number of pipeline stages for CARRYIN (0 or 1)
      .CARRYINSELREG(0),                // Number of pipeline stages for CARRYINSEL (0 or 1)
      .CREG(0),                         // Number of pipeline stages for C (0 or 1)
      .DREG(1),                         // Number of pipeline stages for D (0 or 1)
      .INMODEREG(0),                    // Number of pipeline stages for INMODE (0 or 1)
      .MREG(0),                         // Number of multiplier pipeline stages (0 or 1)
      .OPMODEREG(0),                    // Number of pipeline stages for OPMODE (0 or 1)
      .PREG(1),                         // Number of pipeline stages for P (0 or 1)
      .USE_SIMD("ONE48")                // SIMD selection ("ONE48", "TWO24", "FOUR12")
   )
   DSP48E1_inst (      
		.CLK(clk),                        // 1-bit input: Clock input
      .P(p_d_dsp),                      // 48-bit output: Primary data output.
		.B({{2{b[15]}},b}),               // 18-bit input: B data input
		.D({{9{d[15]}},d}),               // 25-bit input: D data input
		.C({{32{p[15]}},p}),          	 // 48-bit input: C data input
      .ALUMODE(alumode),                // 4-bit input: ALU control input   
      .INMODE(inmode),                  // 5-bit input: INMODE control input
      .OPMODE(opmode),                  // 7-bit input: Operation mode input    
      
		.CARRYINSEL(3'b000),         	    // 3-bit input: Carry select input
      .CARRYIN(1'b0),                   // 1-bit input: Carry input signal		
		.CEB2(en),                        // 1-bit input: Clock enable input for 2nd stage BREG
      .CED(en),                         // 1-bit input: Clock enable input for DREG
      .CEP(en),                         // 1-bit input: Clock enable input for PREG       
		.RSTB(rst),                       // 1-bit input: Reset input for BREG
      .RSTD(rst),                       // 1-bit input: Reset input for DREG and ADREG
      .RSTP(rst)                        // 1-bit input: Reset input for PREG
   );
endmodule

module mux48(in0,in1,in2,in3,out,sel);
input[47:0] in0,in1,in2,in3;
output reg[47:0] out;
input[1:0] sel;
always @(*)
      case (sel)
         2'b00: out = in0;
			2'b01: out = in1;
			2'b10: out = in2;
			2'b11: out = in3;
      endcase
endmodule

module mux16(in0,in1,out,sel);
input[15:0] in0,in1;
output[15:0] out;
input sel; 
assign out = (sel) ? in1 : in0;
endmodule