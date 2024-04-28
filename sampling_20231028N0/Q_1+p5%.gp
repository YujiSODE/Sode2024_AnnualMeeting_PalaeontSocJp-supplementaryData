#Requirement
#
#G N U P L O T
#	Version 5.2 patchlevel 8    last modified 2019-12-01 
#
#	Copyright (C) 1986-1993, 1998, 2004, 2007-2019
#	Thomas Williams, Colin Kelley and many others
#============
#
#Q_1+p5%.gp
#
set xrange [0.0:9.0];
set yrange [0.90:1.10];
#
set key title '{/Times {/:Italic Q}({/:Italic p}) = 1+{/:Italic p}(2{/:Italic u}-1)}';
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
#a pseudo random number in the range of (-1.0, 2.0)
v(s)=-1.0+3.0*rand(s);
#
u=0.0;
#
#a pseudo random number in the range of [1.0-p, 1.0+p]
Q(p)=(u=v(0),(u<0.0||u>1.0)?Q(p):1.0+p*(2.0*u-1.0));
#
plot Q(0.05);
pause -1;
#
#to reset terminal
set output;
#
