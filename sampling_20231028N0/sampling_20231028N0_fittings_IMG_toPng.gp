#Requirement
#
#G N U P L O T
#	Version 5.2 patchlevel 8    last modified 2019-12-01 
#
#	Copyright (C) 1986-1993, 1998, 2004, 2007-2019
#	Thomas Williams, Colin Kelley and many others
#============
#
#sampling_20231028N0_fittings_IMG_toPng.gp
#
#
set xrange [0.0:6.0];
set yrange [0.0:200];
#
set xlabel '{/Times=30 {/:Italic x}}';
set ylabel '{/Times=30 {/:Italic y}}';
#
set tics font 'Times,20';
set key font 'Times,16';
#
set key left Left vertical;
#---
#
set sample 1000;
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
#f(x) = (Ax+B)^1
#(A, B) = (50.9704, -98.8064)
A1=50.9704;
B1=-98.8064;
#rgb: rgbColors[2]
#
plot A1*x+B1 with lines title '{/Times {/:Italic f}({/:Italic x})^{1}}' linecolor rgb rgbColors[2];
#---
#
#f(x) = (Ax+B)^2
#(A, B) = (2.9851, -1.91661)
A2=2.9851;
B2=-1.91661;
#rgb: rgbColors[3]
#
replot (A2*x+B2)**2 with lines title '{/Times {/:Italic f}({/:Italic x})^{2}}' linecolor rgb rgbColors[3];
#---
#
#f(x) = (Ax+B)^3
#(A, B) = (0.950117, 0.819635)
A3=0.950117;
B3=0.819635;
#rgb: rgbColors[4]
replot (A3*x+B3)**3 with lines title '{/Times {/:Italic f}({/:Italic x})^{3}}' linecolor rgb rgbColors[4];
#---
#
#f(x) = (Ax+B)^-1
#(A, B) = (A -0.0896782, B 0.452324)
A4=-0.0896782;
B4=0.452324;
#rgb: rgbColors[5]
replot (A4*x+B4)**-1 with lines title '{/Times {/:Italic f}({/:Italic x})^{-1}}' linecolor rgb rgbColors[5];
#---
#
#sample data
#rgb: rgbColors[1]
# Curve 0 of 1, 100 points
# Curve title: "f(x)*Q(0.2): f(x) = (3x-2)^2, Q(p) = 1+p(2u-1), u = [0, 1], x = 2 to 5"
#
replot './sampling_(3x-2)^2*Qp20%_2023-Oct-27-15:18:41_full.data' using 1:2 with points title '{/Times Sample}' pointtype 1 linecolor rgb rgbColors[1];
#---
#
#============
#
#output: png
#------------
set terminal png size 600,600;
set output './sampling_20231028N0_fittings_IMG.png';
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
