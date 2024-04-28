#Requirement
#
#G N U P L O T
#	Version 5.2 patchlevel 8    last modified 2019-12-01 
#
#	Copyright (C) 1986-1993, 1998, 2004, 2007-2019
#	Thomas Williams, Colin Kelley and many others
#============
#
#ln_dLdx_sampling_20231028N0_IMG_f^3_toPng.gp
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
	#f(x) = (Ax+B)^1*Q(0.2)
	#(A, B) = (50.9704, -98.8064)
	#rgb: rgbColors[2]
	#
	#plot './ln_dLdx_f^1*Q20%_A50.9704B-98.8064_IMG/ln_dLdx_f^1*Q20%_A50.9704B-98.8064_DATA.csv' using 1:($2-$3):($2+$3) with filledcurves notitle fillstyle solid 0.5 fillcolor rgb rgbColors[2], '' using 1:2 with lines title '{/Times {/:Italic f}({/:Italic x})^{1}{/:Italic Q}}' linecolor rgb rgbColors[2];
	#---
	#
	#f(x) = (Ax+B)^2*Q(0.2)
	#(A, B) = (2.9851, -1.91661)
	#rgb: rgbColors[3]
	#
	#replot './ln_dLdx_f^2*Q20%_A2.9851B-1.91661_IMG/ln_dLdx_f^2*Q20%_A2.9851B-1.91661_DATA.csv' using 1:($2-$3):($2+$3) with filledcurves notitle fillstyle solid 0.5 fillcolor rgb rgbColors[3], '' using 1:2 with lines title '{/Times {/:Italic f}({/:Italic x)^{2}{/:Italic Q}}' linecolor rgb rgbColors[3];
	#---
#
#f(x) = (Ax+B)^3*Q(0.2)
#(A, B) = (0.950117, 0.819635)
#rgb: rgbColors[4]
#
	#replot './ln_dLdx_f^3*Q20%_A0.950117B0.819635_IMG/ln_dLdx_f^3*Q20%_A0.950117B0.819635_DATA.csv' using 1:($2-$3):($2+$3) with filledcurves notitle fillstyle solid 0.5 fillcolor rgb rgbColors[4], '' using 1:2 with lines title '{/Times {/:Italic f}({/:Italic x})^{3}{/:Italic Q}}' linecolor rgb rgbColors[4];
#
plot './ln_dLdx_f^3*Q20%_A0.950117B0.819635_IMG/ln_dLdx_f^3*Q20%_A0.950117B0.819635_DATA.csv' using 1:($2-$3):($2+$3) with filledcurves notitle fillstyle solid 0.5 fillcolor rgb rgbColors[4], '' using 1:2 with lines title '{/Times {/:Italic f}({/:Italic x})^{3}{/:Italic Q}}' linecolor rgb rgbColors[4];
#---
	#
	#f(x) = (Ax+B)^-1*Q(0.2)
	#(A, B) = (A -0.0896782, B 0.452324)
	#rgb: rgbColors[5]
	#
	#replot './ln_dLdx_f^-1*Q20%_A-0.0896782B0.452324_IMG/ln_dLdx_f^-1*Q20%_A-0.0896782B0.452324_DATA.csv' using 1:($2-$3):($2+$3) with filledcurves notitle fillstyle solid 0.5 fillcolor rgb rgbColors[5], '' using 1:2 with lines title '{/Times {/:Italic f}({/:Italic x})^{-1}{/:Italic Q}}' linecolor rgb rgbColors[5];
	#---
#
#sample data
#rgb: rgbColors[1]
# Curve 0 of 1, 100 points
# Curve title: "f(x)*Q(0.2): f(x) = (3x-2)^2, Q(p) = 1+p(2u-1), u = [0, 1], x = 2 to 5"
#
#plot with y error bars
replot './ln_dLdx_sampling_20231028N0_result_IMG/ln_dLdx_sampling_20231028N0_result_DATA.csv' using 1:2:3 with yerrorbars notitle pointtype -1 linecolor rgb '#000000', '' using 1:2 with points title '{/Times Sample}' pointtype 1 linecolor rgb rgbColors[1];
#============
#
#output: png
#sample and f^3 -> output
#------------
set terminal png size 600,600;
set output './ln_dLdx_sampling_20231028N0_f^3_IMG.png';
#
set sample 1000;
set key font 'Times,18';
set key right;
#
set xrange [-2.0**-1:2.0**3];
set yrange [0.0:2.0**11];
set xtics offset 0.0,-0.3;
set xlabel offset 0.0,-0.8;
set ylabel offset -1.5,0.0;
#
replot;
#============
#
#to reset terminal
set output;
#
