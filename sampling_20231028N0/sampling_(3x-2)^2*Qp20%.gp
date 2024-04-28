#Requirement
#
#G N U P L O T
#	Version 5.2 patchlevel 8    last modified 2019-12-01 
#
#	Copyright (C) 1986-1993, 1998, 2004, 2007-2019
#	Thomas Williams, Colin Kelley and many others
#============
#
#sampling_\(3x-2\)\^2\*Qp20%.gp
#
#--- title ---
fName='./sampling_(3x-2)^2*Qp20%';
#
#--- timestamp ---
fName=fName.strftime("_%Y-%b-%d-%H:%M:%S",time(0.0));
#
#--- full or partial ---
fName=fName.'_full.data';
#
set table fName;
#
set xrange [0.0:9.0];
#---
#
#function f(x)
#f(x) = (ax+b)^n
f(x)=(3.0*x-2.0)**2;
#
#a pseudo random number in the range of (-1.0, 2.0)
v(s)=-1.0+3.0*rand(s);
#
u=0.0;
#
#a pseudo random number in the range of [1.0-p, 1.0+p]
#Q(p) = 1+p(2u-1) and u = [0, 1]
Q(p)=(u=v(0),(u<0.0||u>1.0)?Q(p):1.0+p*(2.0*u-1.0));
#---
#
set sample 100;
set xrange [2.0:5.0];
plot f(x)*Q(0.2) title 'f(x)*Q(0.2): f(x) = (3x-2)^2, Q(p) = 1+p(2u-1), u = [0, 1], x = 2 to 5';
#---
#
unset table;
#
#to reset terminal
set output;
#
print fName;
#
