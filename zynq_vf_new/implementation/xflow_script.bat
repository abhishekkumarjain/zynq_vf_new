@ECHO OFF
@REM ###########################################
@REM # Script file to run the flow 
@REM # 
@REM ###########################################
@REM #
@REM # Command line for ngdbuild
@REM #
ngdbuild -p xc7z020clg484-1 -nt timestamp -bm vf.bmm "C:/Users/khoa002/Dropbox/hyperzynq-master/zynq_vf_new/implementation/vf.ngc" -uc vf.ucf vf.ngd 

@REM #
@REM # Command line for map
@REM #
map -o vf_map.ncd -w -pr b -ol high -timing -detail vf.ngd vf.pcf 

@REM #
@REM # Command line for par
@REM #
par -w -ol high vf_map.ncd vf.ncd vf.pcf 

@REM #
@REM # Command line for post_par_trce
@REM #
trce -e 3 -xml vf.twx vf.ncd vf.pcf 

