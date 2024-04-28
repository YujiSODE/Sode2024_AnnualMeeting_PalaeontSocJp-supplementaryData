#Requirement
#
#G N U P L O T
#	Version 5.2 patchlevel 8    last modified 2019-12-01 
#
#	Copyright (C) 1986-1993, 1998, 2004, 2007-2019
#	Thomas Williams, Colin Kelley and many others
#============
#
#ln_dLdx_f^3*Q20%_A0.950117B0.819635_IMG_toPng.gp
#
set datafile separator ' ,';
#
set xlabel '{/Times=30 ln(1+{/:Italic dL}/{/:Italic dx})}';
set ylabel '{/Times=30 Frequencies}';
#
set tics font 'Times,20';
set key font 'Times,20';
#
set key title '{/Times {/:Italic f}({/:Italic x}) = A{/:Italic x}+B}';
set key right;
#---
#
#---
set tmargin at screen 0.95;
set lmargin at screen 0.25;
set rmargin at screen 0.95;
set bmargin at screen 0.20;
set ylabel offset -3.5,0.0;
#---
#
#============
#
#rgb color scale
#	result in `rgbScaleGen.tcl`
#	- Sode, Y. 2019. getColorSection/rgbScaleGen.tcl. the MIT License (See http://opensource.org/licenses/mit-license.php): https://github.com/YujiSODE/getColorSection
#
array rgbColors[5]=["#0000ff","#3366cc","#66cc99","#99cb65","#cc6532"];
#============
#
#rgb: rgbColors[1]
#A and B
#(A,B) := (0.950117, 0.819635)
#
plot './ln_dLdx_f^3*Q20%_A0.950117B0.819635_DATA.csv' using 1:($2-$3):($2+$3) with filledcurves notitle fillstyle solid 0.5 fillcolor rgb rgbColors[1], '' using 1:2 with lines title '{/Times {/:Italic f}({/:Italic x})^{3}}' linecolor rgb rgbColors[1];
#---
#
#============
#
#output: png
#------------
set terminal png size 600,600;
set output './ln_dLdx_f^3*Q20%_A0.950117B0.819635_IMG.png';
#
set sample 1000;
#
set xtics offset 0.0,-0.3;
#
set xlabel offset 0.0,-0.8;
set ylabel offset -1.5,0.0;
#
replot;
#------------
#
#output: png with axes of log x and log y
#------------
set terminal png size 600,600;
set output './ln_dLdx_f^3*Q20%_A0.950117B0.819635_log_IMG.png';
#
set sample 1000;
set key left;
#
set logscale x 2;
set logscale y 2;
set format x '2^{%L}';
set format y '2^{%L}';
#
set xtics offset 0.0,-0.3;
#
set xlabel offset 0.0,-0.8;
set ylabel offset -1.5,0.0;
#
replot;
#------------
#
#to reset terminal
set output;
#
