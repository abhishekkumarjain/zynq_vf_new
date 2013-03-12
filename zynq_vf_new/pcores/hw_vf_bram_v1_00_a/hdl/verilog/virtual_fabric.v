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
							 dsp_config01,dsp_config03,dsp_config10,dsp_config12, dsp_config14, dsp_config21, dsp_config23, dsp_config30, dsp_config32, dsp_config34, dsp_config41, dsp_config43,
							 dsp_config01_d, dsp_config03_d, dsp_config10_d, dsp_config12_d, dsp_config14_d, dsp_config21_d, dsp_config23_d, dsp_config30_d, dsp_config32_d, dsp_config34_d, dsp_config41_d, dsp_config43_d,
							 dsp_config01_pb, dsp_config03_pb, dsp_config10_pb, dsp_config12_pb, dsp_config14_pb, dsp_config21_pb, dsp_config23_pb, dsp_config30_pb, dsp_config32_pb, dsp_config34_pb, dsp_config41_pb, dsp_config43_pb,
							 cb_config00_ws,cb_config00_en,
							 cb_config02_ws,cb_config02_en,
							 cb_config04_ws,cb_config04_en,
							 cb_config11_ws,cb_config11_en,
							 cb_config13_ws,cb_config13_en,
							 cb_config20_ws,cb_config20_en,
							 cb_config22_ws,cb_config22_en,
							 cb_config24_ws,cb_config24_en,
							 cb_config31_ws,cb_config31_en,
							 cb_config33_ws,cb_config33_en,
							 cb_config40_ws,cb_config40_en,
							 cb_config42_ws,cb_config42_en,
							 cb_config44_ws,cb_config44_en
							 );

input clk;
input rst;
input en;
input[31:0] data_in;
input[31:0] dsp_config01;
input[31:0] dsp_config03;
input[31:0] dsp_config10;
input[31:0] dsp_config12;
input[31:0] dsp_config14;
input[31:0] dsp_config21;
input[31:0] dsp_config23;
input[31:0] dsp_config30;
input[31:0] dsp_config32;
input[31:0] dsp_config34;
input[31:0] dsp_config41;
input[31:0] dsp_config43;
input[31:0] dsp_config01_d;
input[31:0] dsp_config03_d;
input[31:0] dsp_config10_d;
input[31:0] dsp_config12_d;
input[31:0] dsp_config14_d;
input[31:0] dsp_config21_d;
input[31:0] dsp_config23_d;
input[31:0] dsp_config30_d;
input[31:0] dsp_config32_d;
input[31:0] dsp_config34_d;
input[31:0] dsp_config41_d;
input[31:0] dsp_config43_d;
input[31:0] dsp_config01_pb;
input[31:0] dsp_config03_pb;
input[31:0] dsp_config10_pb;
input[31:0] dsp_config12_pb;
input[31:0] dsp_config14_pb;
input[31:0] dsp_config21_pb;
input[31:0] dsp_config23_pb;
input[31:0] dsp_config30_pb;
input[31:0] dsp_config32_pb;
input[31:0] dsp_config34_pb;
input[31:0] dsp_config41_pb;
input[31:0] dsp_config43_pb;

input[31:0] cb_config00_ws;
input[31:0] cb_config00_en;
input[31:0] cb_config02_ws;
input[31:0] cb_config02_en;
input[31:0] cb_config04_ws;
input[31:0] cb_config04_en;
input[31:0] cb_config11_ws;
input[31:0] cb_config11_en;
input[31:0] cb_config13_ws;
input[31:0] cb_config13_en;
input[31:0] cb_config20_ws;
input[31:0] cb_config20_en;
input[31:0] cb_config22_ws;
input[31:0] cb_config22_en;
input[31:0] cb_config24_ws;
input[31:0] cb_config24_en;
input[31:0] cb_config31_ws;
input[31:0] cb_config31_en;
input[31:0] cb_config33_ws;
input[31:0] cb_config33_en;
input[31:0] cb_config40_ws;
input[31:0] cb_config40_en;
input[31:0] cb_config42_ws;
input[31:0] cb_config42_en;
input[31:0] cb_config44_ws;
input[31:0] cb_config44_en;

output [31:0] data_out;

wire[31:0] data_valid;
wire[15:0] coeff_valid01;
wire[15:0] coeff_valid03;
wire[15:0] coeff_valid10;
wire[15:0] coeff_valid12;
wire[15:0] coeff_valid14;
wire[15:0] coeff_valid21;
wire[15:0] coeff_valid23;
wire[15:0] coeff_valid30;
wire[15:0] coeff_valid32;
wire[15:0] coeff_valid34;
wire[15:0] coeff_valid41;
wire[15:0] coeff_valid43;

wire[3:0] alumode01=dsp_config01[31:28];
wire[4:0] inmode01=dsp_config01[27:23];
wire[6:0] opmode01=dsp_config01[22:16];
wire[1:0] dir_sel01=dsp_config01[15:14];
wire dsel01=dsp_config01[13];
wire psel01=dsp_config01[12];
wire bsel01=dsp_config01[11];

wire[3:0] alumode03=dsp_config03[31:28];
wire[4:0] inmode03=dsp_config03[27:23];
wire[6:0] opmode03=dsp_config03[22:16];
wire[1:0] dir_sel03=dsp_config03[15:14];
wire dsel03=dsp_config03[13];
wire psel03=dsp_config03[12];
wire bsel03=dsp_config03[11];

wire[3:0] alumode10=dsp_config10[31:28];
wire[4:0] inmode10=dsp_config10[27:23];
wire[6:0] opmode10=dsp_config10[22:16];
wire[1:0] dir_sel10=dsp_config10[15:14];
wire dsel10=dsp_config10[13];
wire psel10=dsp_config10[12];
wire bsel10=dsp_config10[11];

wire[3:0] alumode12=dsp_config12[31:28];
wire[4:0] inmode12=dsp_config12[27:23];
wire[6:0] opmode12=dsp_config12[22:16];
wire[1:0] dir_sel12=dsp_config12[15:14];
wire dsel12=dsp_config12[13];
wire psel12=dsp_config12[12];
wire bsel12=dsp_config12[11];

wire[3:0] alumode14=dsp_config14[31:28];
wire[4:0] inmode14=dsp_config14[27:23];
wire[6:0] opmode14=dsp_config14[22:16];
wire[1:0] dir_sel14=dsp_config14[15:14];
wire dsel14=dsp_config14[13];
wire psel14=dsp_config14[12];
wire bsel14=dsp_config14[11];

wire[3:0] alumode21=dsp_config21[31:28];
wire[4:0] inmode21=dsp_config21[27:23];
wire[6:0] opmode21=dsp_config21[22:16];
wire[1:0] dir_sel21=dsp_config21[15:14];
wire dsel21=dsp_config21[13];
wire psel21=dsp_config21[12];
wire bsel21=dsp_config21[11];

wire[3:0] alumode23=dsp_config23[31:28];
wire[4:0] inmode23=dsp_config23[27:23];
wire[6:0] opmode23=dsp_config23[22:16];
wire[1:0] dir_sel23=dsp_config23[15:14];
wire dsel23=dsp_config23[13];
wire psel23=dsp_config23[12];
wire bsel23=dsp_config23[11];

wire[3:0] alumode30=dsp_config30[31:28];
wire[4:0] inmode30=dsp_config30[27:23];
wire[6:0] opmode30=dsp_config30[22:16];
wire[1:0] dir_sel30=dsp_config30[15:14];
wire dsel30=dsp_config30[13];
wire psel30=dsp_config30[12];
wire bsel30=dsp_config30[11];

wire[3:0] alumode32=dsp_config32[31:28];
wire[4:0] inmode32=dsp_config32[27:23];
wire[6:0] opmode32=dsp_config32[22:16];
wire[1:0] dir_sel32=dsp_config32[15:14];
wire dsel32=dsp_config32[13];
wire psel32=dsp_config32[12];
wire bsel32=dsp_config32[11];

wire[3:0] alumode34=dsp_config34[31:28];
wire[4:0] inmode34=dsp_config34[27:23];
wire[6:0] opmode34=dsp_config34[22:16];
wire[1:0] dir_sel34=dsp_config34[15:14];
wire dsel34=dsp_config34[13];
wire psel34=dsp_config34[12];
wire bsel34=dsp_config34[11];

wire[3:0] alumode41=dsp_config41[31:28];
wire[4:0] inmode41=dsp_config41[27:23];
wire[6:0] opmode41=dsp_config41[22:16];
wire[1:0] dir_sel41=dsp_config41[15:14];
wire dsel41=dsp_config41[13];
wire psel41=dsp_config41[12];
wire bsel41=dsp_config41[11];

wire[3:0] alumode43=dsp_config43[31:28];
wire[4:0] inmode43=dsp_config43[27:23];
wire[6:0] opmode43=dsp_config43[22:16];
wire[1:0] dir_sel43=dsp_config43[15:14];
wire dsel43=dsp_config43[13];
wire psel43=dsp_config43[12];
wire bsel43=dsp_config43[11];

wire[15:0] coeff01=dsp_config01_d[15:0];		//d_im0
wire[15:0] coeff03=dsp_config03_d[15:0];		//d_im1
wire[15:0] coeff10=dsp_config10_d[15:0];		//d_im2
wire[15:0] coeff12=dsp_config12_d[15:0];		//d_im3
wire[15:0] coeff14=dsp_config14_d[15:0];		//d_im3
wire[15:0] coeff21=dsp_config21_d[15:0];		//d_im3
wire[15:0] coeff23=dsp_config23_d[15:0];		//d_im3
wire[15:0] coeff30=dsp_config30_d[15:0];		//d_im3
wire[15:0] coeff32=dsp_config32_d[15:0];		//d_im3
wire[15:0] coeff34=dsp_config34_d[15:0];		//d_im3
wire[15:0] coeff41=dsp_config41_d[15:0];		//d_im3
wire[15:0] coeff43=dsp_config43_d[15:0];		//d_im3

wire[15:0] p_im01=dsp_config01_pb[31:16];
wire[15:0] p_im03=dsp_config03_pb[31:16];
wire[15:0] p_im10=dsp_config10_pb[31:16];
wire[15:0] p_im12=dsp_config12_pb[31:16];
wire[15:0] p_im14=dsp_config14_pb[31:16];
wire[15:0] p_im21=dsp_config21_pb[31:16];
wire[15:0] p_im23=dsp_config23_pb[31:16];
wire[15:0] p_im30=dsp_config30_pb[31:16];
wire[15:0] p_im32=dsp_config32_pb[31:16];
wire[15:0] p_im34=dsp_config34_pb[31:16];
wire[15:0] p_im41=dsp_config41_pb[31:16];
wire[15:0] p_im43=dsp_config43_pb[31:16];

wire[15:0] b_im01=dsp_config01_pb[15:0];
wire[15:0] b_im03=dsp_config03_pb[15:0];
wire[15:0] b_im10=dsp_config10_pb[15:0];
wire[15:0] b_im12=dsp_config12_pb[15:0];
wire[15:0] b_im14=dsp_config14_pb[15:0];
wire[15:0] b_im21=dsp_config21_pb[15:0];
wire[15:0] b_im23=dsp_config23_pb[15:0];
wire[15:0] b_im30=dsp_config30_pb[15:0];
wire[15:0] b_im32=dsp_config32_pb[15:0];
wire[15:0] b_im34=dsp_config34_pb[15:0];
wire[15:0] b_im41=dsp_config41_pb[15:0];
wire[15:0] b_im43=dsp_config43_pb[15:0];

assign data_valid = (en) ? data_in : 32'd0;
assign coeff_valid01 = (en) ? coeff01 : 16'd0;
assign coeff_valid03 = (en) ? coeff03 : 16'd0;
assign coeff_valid10 = (en) ? coeff10 : 16'd0;
assign coeff_valid12 = (en) ? coeff12 : 16'd0;
assign coeff_valid14 = (en) ? coeff14 : 16'd0;
assign coeff_valid21 = (en) ? coeff21 : 16'd0;
assign coeff_valid23 = (en) ? coeff23 : 16'd0;
assign coeff_valid30 = (en) ? coeff30 : 16'd0;
assign coeff_valid32 = (en) ? coeff32 : 16'd0;
assign coeff_valid34 = (en) ? coeff34 : 16'd0;
assign coeff_valid41 = (en) ? coeff41 : 16'd0;
assign coeff_valid43 = (en) ? coeff43 : 16'd0;

//wire[47:0] dpb1,dpb2,dpb3,dpb4,dpb5,dpb6,dpb7,dpb8,dpb9;
wire [47:0] we_br00, ew_00br, ns_br00, sn_00br, we_0001, ew_0100, ns_0010, sn_1000,
				ns_br01, sn_01br, we_0102, ew_0201, ns_0111, sn_1101,
				ns_br02, sn_02br, we_0203, ew_0302, ns_0212, sn_1202,
				ns_br03, sn_03br, we_0304, ew_0403, ns_0313, sn_1302,
				ns_br04, sn_04br, we_04br, ew_br04, ns_0414, sn_1404,
				we_br10, ew_10br, we_1011, ew_1110, ns_1020, sn_2010,
				we_1112, ew_1211, ns_1121, sn_2111,
				we_1213, ew_1312, ns_1222, sn_2212,
				we_1314, ew_1413, ns_1323, sn_2313,
				we_14br, ew_br14, ns_1424, sn_2414,
				we_br20, ew_br20, we_2021, ew_2120, ns_2030, sn_3020,
				we_2122, ew_2221, ns_2131, sn_3121,
				we_2223, ew_2322, ns_2232, sn 3222,
				we_2324, ew_2423, ns_2333, sn_3323,
				we_24br, ew_br24, ns_2434, sn_3424,
				we_br30, ew_30br, we_3031, ew_3130, ns_3040, sn_4030,
				we_3132, ew_3231, ns_3141, sn_4131,
				we_3233, ew_3332, ns_3242, sn_4232,
				we_3334, ew_3433, ns_3343, sn_4333,
				we_34br, ew_br34, ns_3444, sn_4434,
				we_br40, ew_40br, we_4041, ew_4140, ns_40br, sn_br40,
				we_4142, ew_4241, ns_41br, sn_br41,
				we_4243, ew_4342, ns_42br, sn_br42,
				we_4344, ew_4443, ns_43br, sn_br43,
				we_44br, ew_br44, ns_44br, sn_br44;
//row 0
CB cb00(
		.w_b_in(data_valid[15:0]),
		.w_d_in(16'd0),
		.w_p_in(data_valid[31:16]),
		.w_b_out(ew_00br[15:0]),
		.w_d_out(ew_00br[47:32]),
		.w_p_out(ew_00br[31:16]),
		
		.e_b_in(ew_0100[15:0]),
		.e_d_in(ew_0100[47:32]),
		.e_p_in(ew_0100[31:16]),
		.e_b_out(we_0001[15:0]),
		.e_d_out(we_0001[47:32]),
		.e_p_out(we_0001[31:16]),
		
		.n_b_in(ns_br00[15:0]),
		.n_d_in(ns_br00[47:32]),
		.n_p_in(ns_br00[31:16]),
		.n_b_out(sn_00br[15:0]),
		.n_d_out(sn_00br[47:32]),
		.n_p_out(sn_00br[31:16]),
		
		.s_b_in(sn_1000[15:0]),
		.s_d_in(sn_1000[47:32]),
		.s_p_in(sn_1000[31:16]),
		.s_b_out(ns_0010[15:0]),
		.s_d_out(ns_0010[47:32]),
		.s_p_out(ns_0010[31:16]),
		
		.w_b_mux(cb_config00_ws[23:20]),
		.w_d_mux(cb_config00_ws[19:16]),
		.w_p_mux(cb_config00_ws[15:12]),
		
		.s_b_mux(cb_config00_ws[11:8]),
		.s_d_mux(cb_config00_ws[7:4]),
		.s_p_mux(cb_config00_ws[3:0]),
		
		.e_b_mux(cb_config00_en[23:20]),
		.e_d_mux(cb_config00_en[19:16]),
		.e_p_mux(cb_config00_en[15:12]),
		
		.n_b_mux(cb_config00_en[11:8]),
		.n_d_mux(cb_config00_en[7:4]),
		.n_p_mux(cb_config00_en[3:0])		
		);

pe_single_cycle_latency pe01(
		.clk(clk),
		.rst(rst),
		.en(en),

		.d_im(coeff_valid01),
		.p_im(p_im01),
		.b_im(b_im01),
		
		.w_in(we_0001),
		.w_out(ew_0100),
		.e_in(ew_0201),
		.e_out(we_0102),
		.n_in(ns_br01),
		.n_out(sn_01br),
		.s_in(sn_1101),
		.s_out(ns_0111),

		.alumode(alumode01),
		.inmode(inmode01),
		.opmode(opmode01),
		.sel(dir_sel01),
		.dsel(dsel01),
		.psel(psel01),
		.bsel(bsel01)
		);	

CB cb02(
		.w_b_in(we_0102[15:0]),
		.w_d_in(we_0102[47:32]),
		.w_p_in(we_0102[31:16]),
		.w_b_out(ew_0201[15:0]),
		.w_d_out(ew_0201[47:32]),
		.w_p_out(ew_0201[31:16]),
		
		.e_b_in(ew_0302[15:0]),
		.e_d_in(ew_0302[47:32]),
		.e_p_in(ew_0302[31:16]),
		.e_b_out(we_0203[15:0]),
		.e_d_out(we_0203[47:32]),
		.e_p_out(we_0203[31:16]),
		
		.n_b_in(ns_br02[15:0]),
		.n_d_in(ns_br02[47:32]),
		.n_p_in(ns_br02[31:16]),
		.n_b_out(sn_02br[15:0]),
		.n_d_out(sn_02br[47:32]),
		.n_p_out(sn_02br[31:16]),
		
		.s_b_in(sn_1202[15:0]),
		.s_d_in(sn_1202[47:32]),
		.s_p_in(sn_1202[31:16]),
		.s_b_out(ns_0212[15:0]),
		.s_d_out(ns_0212[47:32]),
		.s_p_out(ns_0212[31:16]),
		
		.w_b_mux(cb_config02_ws[23:20]),
		.w_d_mux(cb_config02_ws[19:16]),
		.w_p_mux(cb_config02_ws[15:12]),
		
		.s_b_mux(cb_config02_ws[11:8]),
		.s_d_mux(cb_config02_ws[7:4]),
		.s_p_mux(cb_config02_ws[3:0]),
		
		.e_b_mux(cb_config02_en[23:20]),
		.e_d_mux(cb_config02_en[19:16]),
		.e_p_mux(cb_config02_en[15:12]),
		
		.n_b_mux(cb_config02_en[11:8]),
		.n_d_mux(cb_config02_en[7:4]),
		.n_p_mux(cb_config02_en[3:0])		
		);
	
pe_single_cycle_latency pe03(
		.clk(clk),
		.rst(rst),
		.en(en),
		
		.d_im(coeff_valid03),		
		.p_im(p_im03),
		.b_im(b_im03),
		
		.w_in(we_0203),
		.w_out(ew_0302),
		.e_in(ew_0403),
		.e_out(we_0304),
		.n_in(ns_br03),
		.n_out(sn_03br),
		.s_in(sn_1303),
		.s_out(ns_0313),
		
		.alumode(alumode03),
		.inmode(inmode03),
		.opmode(opmode03),
		.sel(dir_sel03),		
		.dsel(dsel03),
		.psel(psel03),
		.bsel(bsel03)
		);	

CB cb04(
		.w_b_in(we_0304[15:0]),
		.w_d_in(we_0304[47:32]),
		.w_p_in(we_0304[31:16]),
		.w_b_out(ew_0403[15:0]),
		.w_d_out(ew_0403[47:32]),
		.w_p_out(ew_0403[31:16]),
		
		.e_b_in(ew_br04[15:0]),
		.e_d_in(ew_br04[47:32]),
		.e_p_in(ew_br04[31:16]),
		.e_b_out(we_04br[15:0]),
		.e_d_out(we_04br[47:32]),
		.e_p_out(we_04br[31:16]),
		
		.n_b_in(ns_br04[15:0]),
		.n_d_in(ns_br04[47:32]),
		.n_p_in(ns_br04[31:16]),
		.n_b_out(sn_04br[15:0]),
		.n_d_out(sn_04br[47:32]),
		.n_p_out(sn_04br[31:16]),
		
		.s_b_in(sn_1404[15:0]),
		.s_d_in(sn_1404[47:32]),
		.s_p_in(sn_1404[31:16]),
		.s_b_out(ns_0414[15:0]),
		.s_d_out(ns_0414[47:32]),
		.s_p_out(ns_0414[31:16]),
		
	   .w_b_mux(cb_config04_ws[23:20]),
		.w_d_mux(cb_config04_ws[19:16]),
		.w_p_mux(cb_config04_ws[15:12]),
		
		.s_b_mux(cb_config04_ws[11:8]),
		.s_d_mux(cb_config04_ws[7:4]),
		.s_p_mux(cb_config04_ws[3:0]),
		
		.e_b_mux(cb_config04_en[23:20]),
		.e_d_mux(cb_config04_en[19:16]),
		.e_p_mux(cb_config04_en[15:12]),
		
		.n_b_mux(cb_config04_en[11:8]),
		.n_d_mux(cb_config04_en[7:4]),
		.n_p_mux(cb_config04_en[3:0])		
		);
//row 1		
pe_single_cycle_latency pe10(
		.clk(clk),
		.rst(rst),
		.en(en),
		
		.d_im(coeff_valid10),		
		.p_im(p_im10),
		.b_im(b_im10),
		
		.w_in(we_br10),
		.w_out(ew_10br),
		.e_in(we_1011),
		.e_out(ew_1110),
		.n_in(ns_0010),
		.n_out(sn_1000),
		.s_in(sn_2010),
		.s_out(ns_1020),
		
		.alumode(alumode10),
		.inmode(inmode10),
		.opmode(opmode10),
		.sel(dir_sel10),		
		.dsel(dsel10),
		.psel(psel10),
		.bsel(bsel10)
		);	

CB cb11(
		.w_b_in(we_1011[15:0]),
		.w_d_in(we_1011[47:32]),
		.w_p_in(we_1011[31:16]),
		.w_b_out(ew_1110[15:0]),
		.w_d_out(ew_1110[47:32]),
		.w_p_out(ew_1110[31:16]),
		
		.e_b_in(ew_1211[15:0]),
		.e_d_in(ew_1211[47:32]),
		.e_p_in(ew_1211[31:16]),
		.e_b_out(we_1112[15:0]),
		.e_d_out(we_1112[47:32]),
		.e_p_out(we_1112[31:16]),
		
		.n_b_in(ns_0111[15:0]),
		.n_d_in(ns_0111[47:32]),
		.n_p_in(ns_0111[31:16]),
		.n_b_out(sn_1101[15:0]),
		.n_d_out(sn_1101[47:32]),
		.n_p_out(sn_1101[31:16]),
		
		.s_b_in(sn_2111[15:0]),
		.s_d_in(sn_2111[47:32]),
		.s_p_in(sn_2111[31:16]),
		.s_b_out(ns_1121[15:0]),
		.s_d_out(ns_1121[47:32]),
		.s_p_out(ns_1121[31:16]),
		
		.w_b_mux(cb_config11_ws[23:20]),
		.w_d_mux(cb_config11_ws[19:16]),
		.w_p_mux(cb_config11_ws[15:12]),
		
		.s_b_mux(cb_config11_ws[11:8]),
		.s_d_mux(cb_config11_ws[7:4]),
		.s_p_mux(cb_config11_ws[3:0]),
		
		.e_b_mux(cb_config11_en[23:20]),
		.e_d_mux(cb_config11_en[19:16]),
		.e_p_mux(cb_config11_en[15:12]),
		
		.n_b_mux(cb_config11_en[11:8]),
		.n_d_mux(cb_config11_en[7:4]),
		.n_p_mux(cb_config11_en[3:0])		
		);
		
pe_single_cycle_latency pe12(
		.clk(clk),
		.rst(rst),
		.en(en),
		
		.d_im(coeff_valid12),		
		.p_im(p_im12),
		.b_im(b_im12),
		
		.w_in(we_1112),
		.w_out(ew_1211),
		.e_in(ew_1312),
		.e_out(we_1213),
		.n_in(ns_0212),
		.n_out(sn_1202),
		.s_in(sn_2212),
		.s_out(ns_1222),
		
		.alumode(alumode12),
		.inmode(inmode12),
		.opmode(opmode12),
		.sel(dir_sel12),		
		.dsel(dsel12),
		.psel(psel12),
		.bsel(bsel12)
		);	
		
CB cb13(
		.w_b_in(we_1213[15:0]),
		.w_d_in(we_1213[47:32]),
		.w_p_in(we_1213[31:16]),
		.w_b_out(ew_1312[15:0]),
		.w_d_out(ew_1312[47:32]),
		.w_p_out(ew_1312[31:16]),
		
		.e_b_in(ew_1413[15:0]),
		.e_d_in(ew_1413[47:32]),
		.e_p_in(ew_1413[31:16]),
		.e_b_out(we_1314[15:0]),
		.e_d_out(we_1314[47:32]),
		.e_p_out(we_1314[31:16]),
		
		.n_b_in(ns_0313[15:0]),
		.n_d_in(ns_0313[47:32]),
		.n_p_in(ns_0313[31:16]),
		.n_b_out(sn_1303[15:0]),
		.n_d_out(sn_1303[47:32]),
		.n_p_out(sn_1303[31:16]),
		
		.s_b_in(sn_2313[15:0]),
		.s_d_in(sn_2313[47:32]),
		.s_p_in(sn_2313[31:16]),
		.s_b_out(ns_1323[15:0]),
		.s_d_out(ns_1323[47:32]),
		.s_p_out(ns_1323[31:16]),
		
		.w_b_mux(cb_config13_ws[23:20]),
		.w_d_mux(cb_config13_ws[19:16]),
		.w_p_mux(cb_config13_ws[15:12]),
		
		.s_b_mux(cb_config13_ws[11:8]),
		.s_d_mux(cb_config13_ws[7:4]),
		.s_p_mux(cb_config13_ws[3:0]),
		
		.e_b_mux(cb_config13_en[23:20]),
		.e_d_mux(cb_config13_en[19:16]),
		.e_p_mux(cb_config13_en[15:12]),
		
		.n_b_mux(cb_config13_en[11:8]),
		.n_d_mux(cb_config13_en[7:4]),
		.n_p_mux(cb_config13_en[3:0])		
		);		
		
pe_single_cycle_latency pe14(
		.clk(clk),
		.rst(rst),
		.en(en),
		
		.d_im(coeff_valid14),		
		.p_im(p_im14),
		.b_im(b_im14),
		
		.w_in(we_1314),
		.w_out(ew_1413),
		.e_in(ew_br14),
		.e_out(we_14br),
		.n_in(ns_0414),
		.n_out(sn_1404),
		.s_in(sn_2414),
		.s_out(ns_1424),
		
		.alumode(alumode14),
		.inmode(inmode14),
		.opmode(opmode14),
		.sel(dir_sel14),		
		.dsel(dsel14),
		.psel(psel14),
		.bsel(bsel14)
		);	
//row 2
CB cb20(
		.w_b_in(we_br20[15:0]),
		.w_d_in(we_br20[47:32]),
		.w_p_in(we_br20[31:16]),
		.w_b_out(ew_20br[15:0]),
		.w_d_out(ew_20br[47:32]),
		.w_p_out(ew_20br[31:16]),
		
		.e_b_in(ew_2120[15:0]),
		.e_d_in(ew_2120[47:32]),
		.e_p_in(ew_2120[31:16]),
		.e_b_out(we_2021[15:0]),
		.e_d_out(we_2021[47:32]),
		.e_p_out(we_2021[31:16]),
		
		.n_b_in(ns_1020[15:0]),
		.n_d_in(ns_1020[47:32]),
		.n_p_in(ns_1020[31:16]),
		.n_b_out(sn_2010[15:0]),
		.n_d_out(sn_2010[47:32]),
		.n_p_out(sn_2010[31:16]),
		
		.s_b_in(sn_3020[15:0]),
		.s_d_in(sn_3020[47:32]),
		.s_p_in(sn_3020[31:16]),
		.s_b_out(ns_2030[15:0]),
		.s_d_out(ns_2030[47:32]),
		.s_p_out(ns_2030[31:16]),
		
		.w_b_mux(cb_config20_ws[23:20]),
		.w_d_mux(cb_config20_ws[19:16]),
		.w_p_mux(cb_config20_ws[15:12]),
		
		.s_b_mux(cb_config20_ws[11:8]),
		.s_d_mux(cb_config20_ws[7:4]),
		.s_p_mux(cb_config20_ws[3:0]),
		
		.e_b_mux(cb_config20_en[23:20]),
		.e_d_mux(cb_config20_en[19:16]),
		.e_p_mux(cb_config20_en[15:12]),
		
		.n_b_mux(cb_config20_en[11:8]),
		.n_d_mux(cb_config20_en[7:4]),
		.n_p_mux(cb_config20_en[3:0])		
		);

pe_single_cycle_latency pe21(
		.clk(clk),
		.rst(rst),
		.en(en),

		.d_im(coeff_valid21),
		.p_im(p_im21),
		.b_im(b_im21),
		
		.w_in(we_2021),
		.w_out(ew_2120),
		.e_in(ew_2221),
		.e_out(we_2122),
		.n_in(ns_1121),
		.n_out(sn_2111),
		.s_in(sn_3121),
		.s_out(ns_2131),

		.alumode(alumode21),
		.inmode(inmode21),
		.opmode(opmode21),
		.sel(dir_sel21),
		.dsel(dsel21),
		.psel(psel21),
		.bsel(bsel21)
		);	

CB cb22(
		.w_b_in(we_2122[15:0]),
		.w_d_in(we_2122[47:32]),
		.w_p_in(we_2122[31:16]),
		.w_b_out(ew_2221[15:0]),
		.w_d_out(ew_2221[47:32]),
		.w_p_out(ew_2221[31:16]),
		
		.e_b_in(ew_2322[15:0]),
		.e_d_in(ew_2322[47:32]),
		.e_p_in(ew_2322[31:16]),
		.e_b_out(we_2223[15:0]),
		.e_d_out(we_2223[47:32]),
		.e_p_out(we_2223[31:16]),
		
		.n_b_in(ns_1222[15:0]),
		.n_d_in(ns_1222[47:32]),
		.n_p_in(ns_1222[31:16]),
		.n_b_out(sn_2212[15:0]),
		.n_d_out(sn_2212[47:32]),
		.n_p_out(sn_2212[31:16]),
		
		.s_b_in(sn_3222[15:0]),
		.s_d_in(sn_3222[47:32]),
		.s_p_in(sn_3222[31:16]),
		.s_b_out(ns_2232[15:0]),
		.s_d_out(ns_2232[47:32]),
		.s_p_out(ns_2232[31:16]),
		
		.w_b_mux(cb_config22_ws[23:20]),
		.w_d_mux(cb_config22_ws[19:16]),
		.w_p_mux(cb_config22_ws[15:12]),
		
		.s_b_mux(cb_config22_ws[11:8]),
		.s_d_mux(cb_config22_ws[7:4]),
		.s_p_mux(cb_config22_ws[3:0]),
		
		.e_b_mux(cb_config22_en[23:20]),
		.e_d_mux(cb_config22_en[19:16]),
		.e_p_mux(cb_config22_en[15:12]),
		
		.n_b_mux(cb_config22_en[11:8]),
		.n_d_mux(cb_config22_en[7:4]),
		.n_p_mux(cb_config22_en[3:0])		
		);
	
pe_single_cycle_latency pe23(
		.clk(clk),
		.rst(rst),
		.en(en),
		
		.d_im(coeff_valid23),		
		.p_im(p_im23),
		.b_im(b_im23),
		
		.w_in(we_2223),
		.w_out(ew_2322),
		.e_in(ew_2423),
		.e_out(we_2324),
		.n_in(ns_1323),
		.n_out(sn_2313),
		.s_in(sn_3323),
		.s_out(ns_2333),
		
		.alumode(alumode23),
		.inmode(inmode23),
		.opmode(opmode23),
		.sel(dir_sel23),		
		.dsel(dsel23),
		.psel(psel23),
		.bsel(bsel23)
		);	

CB cb24(
		.w_b_in(we_2324[15:0]),
		.w_d_in(we_2324[47:32]),
		.w_p_in(we_2324[31:16]),
		.w_b_out(ew_2423[15:0]),
		.w_d_out(ew_2423[47:32]),
		.w_p_out(ew_2423[31:16]),
		
		.e_b_in(ew_br24[15:0]),
		.e_d_in(ew_br24[47:32]),
		.e_p_in(ew_br24[31:16]),
		.e_b_out(we_24br[15:0]),
		.e_d_out(we_24br[47:32]),
		.e_p_out(we_24br[31:16]),
		
		.n_b_in(ns_1424[15:0]),
		.n_d_in(ns_1424[47:32]),
		.n_p_in(ns_1424[31:16]),
		.n_b_out(sn_2414[15:0]),
		.n_d_out(sn_2414[47:32]),
		.n_p_out(sn_2414[31:16]),
		
		.s_b_in(sn_3424[15:0]),
		.s_d_in(sn_3424[47:32]),
		.s_p_in(sn_3424[31:16]),
		.s_b_out(ns_2434[15:0]),
		.s_d_out(ns_2434[47:32]),
		.s_p_out(ns_2434[31:16]),
		
	   .w_b_mux(cb_config24_ws[23:20]),
		.w_d_mux(cb_config24_ws[19:16]),
		.w_p_mux(cb_config24_ws[15:12]),
		
		.s_b_mux(cb_config24_ws[11:8]),
		.s_d_mux(cb_config24_ws[7:4]),
		.s_p_mux(cb_config24_ws[3:0]),
		
		.e_b_mux(cb_config24_en[23:20]),
		.e_d_mux(cb_config24_en[19:16]),
		.e_p_mux(cb_config24_en[15:12]),
		
		.n_b_mux(cb_config24_en[11:8]),
		.n_d_mux(cb_config24_en[7:4]),
		.n_p_mux(cb_config24_en[3:0])		
		);
//row 3		
pe_single_cycle_latency pe30(
		.clk(clk),
		.rst(rst),
		.en(en),
		
		.d_im(coeff_valid30),		
		.p_im(p_im30),
		.b_im(b_im30),
		
		.w_in(we_br30),
		.w_out(ew_30br),
		.e_in(we_3031),
		.e_out(ew_3130),
		.n_in(ns_2030),
		.n_out(sn_3020),
		.s_in(sn_4030),
		.s_out(ns_3040),
		
		.alumode(alumode30),
		.inmode(inmode30),
		.opmode(opmode30),
		.sel(dir_sel30),		
		.dsel(dsel30),
		.psel(psel30),
		.bsel(bsel30)
		);	

CB cb31(
		.w_b_in(we_3031[15:0]),
		.w_d_in(we_3031[47:32]),
		.w_p_in(we_3031[31:16]),
		.w_b_out(ew_3130[15:0]),
		.w_d_out(ew_3130[47:32]),
		.w_p_out(ew_3130[31:16]),
		
		.e_b_in(ew_3231[15:0]),
		.e_d_in(ew_3231[47:32]),
		.e_p_in(ew_3231[31:16]),
		.e_b_out(we_3132[15:0]),
		.e_d_out(we_3132[47:32]),
		.e_p_out(we_3132[31:16]),
		
		.n_b_in(ns_2131[15:0]),
		.n_d_in(ns_2131[47:32]),
		.n_p_in(ns_2131[31:16]),
		.n_b_out(sn_3121[15:0]),
		.n_d_out(sn_3121[47:32]),
		.n_p_out(sn_3121[31:16]),
		
		.s_b_in(sn_4131[15:0]),
		.s_d_in(sn_4131[47:32]),
		.s_p_in(sn_4131[31:16]),
		.s_b_out(ns_3141[15:0]),
		.s_d_out(ns_3141[47:32]),
		.s_p_out(ns_3141[31:16]),
		
		.w_b_mux(cb_config31_ws[23:20]),
		.w_d_mux(cb_config31_ws[19:16]),
		.w_p_mux(cb_config31_ws[15:12]),
		
		.s_b_mux(cb_config31_ws[11:8]),
		.s_d_mux(cb_config31_ws[7:4]),
		.s_p_mux(cb_config31_ws[3:0]),
		
		.e_b_mux(cb_config31_en[23:20]),
		.e_d_mux(cb_config31_en[19:16]),
		.e_p_mux(cb_config31_en[15:12]),
		
		.n_b_mux(cb_config31_en[11:8]),
		.n_d_mux(cb_config31_en[7:4]),
		.n_p_mux(cb_config31_en[3:0])		
		);
		
pe_single_cycle_latency pe32(
		.clk(clk),
		.rst(rst),
		.en(en),
		
		.d_im(coeff_valid32),		
		.p_im(p_im32),
		.b_im(b_im32),
		
		.w_in(we_3132),
		.w_out(ew_3231),
		.e_in(ew_3332),
		.e_out(we_3233),
		.n_in(ns_2232),
		.n_out(sn_3222),
		.s_in(sn_4232),
		.s_out(ns_3242),
		
		.alumode(alumode32),
		.inmode(inmode32),
		.opmode(opmode32),
		.sel(dir_sel32),		
		.dsel(dsel32),
		.psel(psel32),
		.bsel(bsel32)
		);	
		
CB cb33(
		.w_b_in(we_3233[15:0]),
		.w_d_in(we_3233[47:32]),
		.w_p_in(we_3233[31:16]),
		.w_b_out(ew_3332[15:0]),
		.w_d_out(ew_3332[47:32]),
		.w_p_out(ew_3332[31:16]),
		
		.e_b_in(ew_3433[15:0]),
		.e_d_in(ew_3433[47:32]),
		.e_p_in(ew_3433[31:16]),
		.e_b_out(we_3334[15:0]),
		.e_d_out(we_3334[47:32]),
		.e_p_out(we_3334[31:16]),
		
		.n_b_in(ns_2333[15:0]),
		.n_d_in(ns_2333[47:32]),
		.n_p_in(ns_2333[31:16]),
		.n_b_out(sn_3323[15:0]),
		.n_d_out(sn_3323[47:32]),
		.n_p_out(sn_3323[31:16]),
		
		.s_b_in(sn_4333[15:0]),
		.s_d_in(sn_4333[47:32]),
		.s_p_in(sn_4333[31:16]),
		.s_b_out(ns_3343[15:0]),
		.s_d_out(ns_3343[47:32]),
		.s_p_out(ns_3343[31:16]),
		
		.w_b_mux(cb_config33_ws[23:20]),
		.w_d_mux(cb_config33_ws[19:16]),
		.w_p_mux(cb_config33_ws[15:12]),
		
		.s_b_mux(cb_config33_ws[11:8]),
		.s_d_mux(cb_config33_ws[7:4]),
		.s_p_mux(cb_config33_ws[3:0]),
		
		.e_b_mux(cb_config33_en[23:20]),
		.e_d_mux(cb_config33_en[19:16]),
		.e_p_mux(cb_config33_en[15:12]),
		
		.n_b_mux(cb_config33_en[11:8]),
		.n_d_mux(cb_config33_en[7:4]),
		.n_p_mux(cb_config33_en[3:0])		
		);		
		
pe_single_cycle_latency pe34(
		.clk(clk),
		.rst(rst),
		.en(en),
		
		.d_im(coeff_valid34),		
		.p_im(p_im34),
		.b_im(b_im34),
		
		.w_in(we_3334),
		.w_out(ew_3433),
		.e_in(ew_br34),
		.e_out(we_34br),
		.n_in(ns_2434),
		.n_out(sn_3424),
		.s_in(sn_4434),
		.s_out(ns_3444),
		
		.alumode(alumode34),
		.inmode(inmode34),
		.opmode(opmode34),
		.sel(dir_sel34),		
		.dsel(dsel34),
		.psel(psel34),
		.bsel(bsel34)
		);	
//row 4
CB cb40(
		.w_b_in(we_br40[15:0]),
		.w_d_in(we_br40[47:32]),
		.w_p_in(we_br40[31:16]),
		.w_b_out(ew_40br[15:0]),
		.w_d_out(ew_40br[47:32]),
		.w_p_out(ew_40br[31:16]),
		
		.e_b_in(ew_4140[15:0]),
		.e_d_in(ew_4140[47:32]),
		.e_p_in(ew_4140[31:16]),
		.e_b_out(we_4041[15:0]),
		.e_d_out(we_4041[47:32]),
		.e_p_out(we_4041[31:16]),
		
		.n_b_in(ns_3040[15:0]),
		.n_d_in(ns_3040[47:32]),
		.n_p_in(ns_3040[31:16]),
		.n_b_out(sn_4030[15:0]),
		.n_d_out(sn_4030[47:32]),
		.n_p_out(sn_4030[31:16]),
		
		.s_b_in(sn_4030[15:0]),
		.s_d_in(sn_4030[47:32]),
		.s_p_in(sn_4030[31:16]),
		.s_b_out(ns_40br[15:0]),
		.s_d_out(ns_40br[47:32]),
		.s_p_out(ns_40br[31:16]),
		
		.w_b_mux(cb_config40_ws[23:20]),
		.w_d_mux(cb_config40_ws[19:16]),
		.w_p_mux(cb_config40_ws[15:12]),
		
		.s_b_mux(cb_config40_ws[11:8]),
		.s_d_mux(cb_config40_ws[7:4]),
		.s_p_mux(cb_config40_ws[3:0]),
		
		.e_b_mux(cb_config40_en[23:20]),
		.e_d_mux(cb_config40_en[19:16]),
		.e_p_mux(cb_config40_en[15:12]),
		
		.n_b_mux(cb_config40_en[11:8]),
		.n_d_mux(cb_config40_en[7:4]),
		.n_p_mux(cb_config40_en[3:0])		
		);

pe_single_cycle_latency pe41(
		.clk(clk),
		.rst(rst),
		.en(en),

		.d_im(coeff_valid41),
		.p_im(p_im41),
		.b_im(b_im41),
		
		.w_in(we_4041),
		.w_out(ew_4140),
		.e_in(ew_4241),
		.e_out(we_4142),
		.n_in(ns_3141),
		.n_out(sn_4131),
		.s_in(sn_br41),
		.s_out(ns_41br),

		.alumode(alumode41),
		.inmode(inmode41),
		.opmode(opmode41),
		.sel(dir_sel41),
		.dsel(dsel41),
		.psel(psel41),
		.bsel(bsel41)
		);	

CB cb42(
		.w_b_in(we_4142[15:0]),
		.w_d_in(we_4142[47:32]),
		.w_p_in(we_4142[31:16]),
		.w_b_out(ew_4241[15:0]),
		.w_d_out(ew_4241[47:32]),
		.w_p_out(ew_4241[31:16]),
		
		.e_b_in(ew_4342[15:0]),
		.e_d_in(ew_4342[47:32]),
		.e_p_in(ew_4342[31:16]),
		.e_b_out(we_4243[15:0]),
		.e_d_out(we_4243[47:32]),
		.e_p_out(we_4243[31:16]),
		
		.n_b_in(ns_3242[15:0]),
		.n_d_in(ns_3242[47:32]),
		.n_p_in(ns_3242[31:16]),
		.n_b_out(sn_4232[15:0]),
		.n_d_out(sn_4232[47:32]),
		.n_p_out(sn_4232[31:16]),
		
		.s_b_in(sn_br42[15:0]),
		.s_d_in(sn_br42[47:32]),
		.s_p_in(sn_br42[31:16]),
		.s_b_out(ns_42br[15:0]),
		.s_d_out(ns_42br[47:32]),
		.s_p_out(ns_42br[31:16]),
		
		.w_b_mux(cb_config42_ws[23:20]),
		.w_d_mux(cb_config42_ws[19:16]),
		.w_p_mux(cb_config42_ws[15:12]),
		
		.s_b_mux(cb_config42_ws[11:8]),
		.s_d_mux(cb_config42_ws[7:4]),
		.s_p_mux(cb_config42_ws[3:0]),
		
		.e_b_mux(cb_config42_en[23:20]),
		.e_d_mux(cb_config42_en[19:16]),
		.e_p_mux(cb_config42_en[15:12]),
		
		.n_b_mux(cb_config42_en[11:8]),
		.n_d_mux(cb_config42_en[7:4]),
		.n_p_mux(cb_config42_en[3:0])		
		);
	
pe_single_cycle_latency pe43(
		.clk(clk),
		.rst(rst),
		.en(en),
		
		.d_im(coeff_valid43),		
		.p_im(p_im43),
		.b_im(b_im43),
		
		.w_in(we_4243),
		.w_out(ew_4342),
		.e_in(ew_4443),
		.e_out(we_4344),
		.n_in(ns_3343),
		.n_out(sn_4333),
		.s_in(sn_br43),
		.s_out(ns_43br),
		
		.alumode(alumode43),
		.inmode(inmode43),
		.opmode(opmode43),
		.sel(dir_sel43),		
		.dsel(dsel43),
		.psel(psel43),
		.bsel(bsel43)
		);	

CB cb44(
		.w_b_in(we_4344[15:0]),
		.w_d_in(we_4344[47:32]),
		.w_p_in(we_4344[31:16]),
		.w_b_out(ew_4443[15:0]),
		.w_d_out(ew_4443[47:32]),
		.w_p_out(ew_4443[31:16]),
		
		.e_b_in(ew_br44[15:0]),
		.e_d_in(ew_br44[47:32]),
		.e_p_in(ew_br44[31:16]),
		.e_b_out(we_44br[15:0]),
		.e_d_out(we_44br[47:32]),
		.e_p_out(we_44br[31:16]),
		
		.n_b_in(ns_3444[15:0]),
		.n_d_in(ns_3444[47:32]),
		.n_p_in(ns_3444[31:16]),
		.n_b_out(sn_4434[15:0]),
		.n_d_out(sn_4434[47:32]),
		.n_p_out(sn_4434[31:16]),
		
		.s_b_in(sn_br44[15:0]),
		.s_d_in(sn_br44[47:32]),
		.s_p_in(sn_br44[31:16]),
		.s_b_out(ns_44br[15:0]),
		.s_d_out(ns_44br[47:32]),
		.s_p_out(ns_44br[31:16]),
		
	   .w_b_mux(cb_config44_ws[23:20]),
		.w_d_mux(cb_config44_ws[19:16]),
		.w_p_mux(cb_config44_ws[15:12]),
		
		.s_b_mux(cb_config44_ws[11:8]),
		.s_d_mux(cb_config44_ws[7:4]),
		.s_p_mux(cb_config44_ws[3:0]),
		
		.e_b_mux(cb_config44_en[23:20]),
		.e_d_mux(cb_config44_en[19:16]),
		.e_p_mux(cb_config44_en[15:12]),
		
		.n_b_mux(cb_config44_en[11:8]),
		.n_d_mux(cb_config44_en[7:4]),
		.n_p_mux(cb_config44_en[3:0])		
		);		
		
//assign data_out=dpb9[31:0];
//assign data_out=we_44br[31:0];
assign data_out=sn_01br[31:0];
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