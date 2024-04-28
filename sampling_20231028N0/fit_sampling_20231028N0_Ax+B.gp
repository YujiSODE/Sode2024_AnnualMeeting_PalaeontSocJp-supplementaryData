#Requirement
#
#G N U P L O T
#	Version 5.2 patchlevel 8    last modified 2019-12-01 
#
#	Copyright (C) 1986-1993, 1998, 2004, 2007-2019
#	Thomas Williams, Colin Kelley and many others
#============
#
#fit_sampling_20231028N0_Ax+B.gp
#
#---
#
#name of output log
fName='./Ax+B_fit_sampling_20231028N0';
fName=fName.strftime("_%Y-%b-%d-%H:%M:%S.log",time(0.0));
set fit logfile fName;
#---
#
#fitting
A=1.0;
B=1.0;
f(x)=A*x+B;
#
fit f(x) './sampling_(3x-2)^2*Qp20%_2023-Oct-27-15:18:41_full.data' via A,B;
#
#to show file name of the output log
print fName;
#
plot './sampling_(3x-2)^2*Qp20%_2023-Oct-27-15:18:41_full.data' title '{/Times Sample}' with points,f(x) title '{/Times {/:Italic f}({/:Italic x}) = A{/:Italic x}+B}' with lines;
#
pause -1;
#
