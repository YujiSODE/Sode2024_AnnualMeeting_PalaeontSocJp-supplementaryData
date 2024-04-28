#!/bin/sh
# the next line restarts using tclsh \
exec tclsh "$0" ${1+"$@"}
##===================================================================
#
#MCSS
#ln_dLdx_f^3*Q20%_fit_TEMP.tcl
#
#=== MCSS ===
source -encoding utf-8 ../monteCarloSimulationSummarizer.tcl;
#
#=== notes ===
::MCSS::ADD_NOTE title {f(x)^3*Q};
#
::MCSS::ADD_NOTE sampling "1.0E4 X 1.0E2"
#
::MCSS::ADD_NOTE def {ln(1+dL/dx) = ln(1+(mid(L)+min(L))/dx), where dL = L1+L2+L3-max(L), dx = max(x)-min(x), and Li = sqrt(dxi^2+dyi^2)};
::MCSS::ADD_NOTE function {F(x) := (Ax+B)^3*Q, where Q = 1+p(2u-1) and p = 0.2}
::MCSS::ADD_NOTE fittingLog {(Ax+B)^3_fit_sampling_20231028N0_2023-Oct-28-23:22:58.log};
#
#A and B
::MCSS::ADD_NOTE constants "(A,B) := ([set A 0.950117],[set B 0.819635])";
#
#=== format ===
::MCSS::SET_FORMAT %.1f;
#
#=== range of random variable ===
::MCSS::SET_RANGE 2 5;
#
#=== additional sources ===
#
#this file
::MCSS::INCLUDE {ln_dLdx_f^3*Q20%_fit_TEMP.tcl};
#
#other source
::MCSS::INCLUDE {./sampling_20231028N0/(Ax+B)^3_fit_sampling_20231028N0_2023-Oct-28-23:22:58.log};
#
#=== data input ===
#command `::MCSS::INPUT` or Tcl script is available
#
proc f {A B x} {
	set A [expr {double($A)}];
	set B [expr {double($B)}];
	set x [expr {double($x)}];
	#
	return [expr {($A*$x+$B)**3}];
};
#
proc g {A B x {sgn {}}} {
	variable ::MCSS::EPSILON;
	set _epsilon $::MCSS::EPSILON;
	set sgn [expr {![llength $sgn]?1.0:double($sgn)}];
	#
	set _epsilon [expr {$sgn*$_epsilon}];
	#
	set F [f $A $B $x];
	set F [expr {$F!=0?$F:$_epsilon}];
	#
	return [expr {$F**-1}];
};
#
proc Q p {
	# - $p: 0.0 or positive value, generally $p is in the range of [0.0, 1.0]
	#
	set p [expr {$p<0.0?0.0:double($p)}];
	#
	#a pseudo-random floating-point value u is in the range of [0.0, 1.0]
	set u [expr {-1.0+3.0*rand()}];
	while {$u<0.0||$u>1.0} {
		set u [expr {-1.0+3.0*rand()}];
	};
	#
	#Q = 1+p(2u-1)
	return [expr {1.0+$p*(2.0*$u-1.0)}];
};
#------------------
#
#it returns the natural logarithm of 1+dL/dx, where L = L1+L2+L3-max(L)
proc get_lndLdx {x1 y1 x2 y2 x3 y3} {
	variable ::MCSS::EPSILON;
	set _epsilon $::MCSS::EPSILON;
	#
	set dx 0.0;
	set dL 0.0;
	#
	set x1 [expr {double($x1)}];
	set y1 [expr {double($y1)}];
	set x2 [expr {double($x2)}];
	set y2 [expr {double($y2)}];
	set x3 [expr {double($x3)}];
	set y3 [expr {double($y3)}];
	#
	set dx [expr {max($x1,$x2,$x3)-min($x1,$x2,$x3)}];
	set dx [expr {$dx!=0.0?$dx:$_epsilon}];
	#===
	#
	#vectors: a -> b -> c
	#
	#a := (p1 -> p2)
	set aX [expr {$x2-$x1}];
	set aY [expr {$y2-$y1}];
	set aL [expr {sqrt($aX**2+$aY**2)}];
	#
	#b := (p2 -> p3)
	set bX [expr {$x3-$x2}];
	set bY [expr {$y3-$y2}];
	set bL [expr {sqrt($bX**2+$bY**2)}];
	#
	#c := (p3 -> p1)
	set cX [expr {$x1-$x3}];
	set cY [expr {$y1-$y3}];
	set cL [expr {sqrt($cX**2+$cY**2)}];
	#
	set dL [expr {$aL+$bL+$cL-max($aL,$bL,$cL)}];
	#------
	#
	unset aX aY aL bX bY bL cX cY cL;
	#===
	#
	return [expr {log(1.0+$dL/$dx)}];
};
#------------------
#
set M 1.0E2;
set i 0;
set size 1.0E4;
set j 0;
#
set x1 0.0;
set x2 0.0;
set x3 0.0;
set y1 0.0;
set y2 0.0;
set y3 0.0;
#
#major sign
set sgn 0.0;
#
set result {};
#
while {$i<$M} {
	set j 0;
	set result {};
	#
	set x1 0.0;
	set x2 0.0;
	set x3 0.0;
	set y1 0.0;
	set y2 0.0;
	set y3 0.0;
	#
	#major sign
	set sgn 0.0;
	#
	while {$j<$size} {
		set sgn 0.0;
		#
		#x1
		set x1 [::MCSS::RANDOM];
		#
		#x2
		set x2 [::MCSS::RANDOM];
		#
		#x3
		set x3 [::MCSS::RANDOM];
		#
		#major sign
		set sgn [expr {getMajorSign($x1,$x2,$x3)}];
		#
		#y1
		set y1 [expr {[f $A $B $x1]*[Q 0.2]}];
		#
		#y2
		set y2 [expr {[f $A $B $x2]*[Q 0.2]}];
		#
		#y3
		set y3 [expr {[f $A $B $x3]*[Q 0.2]}];
		#
		lappend result [get_lndLdx $x1 $y1 $x2 $y2 $x3 $y3];
		#
		incr j 1;
	};
	#
	::MCSS::INPUT $result;
	#
	incr i 1;
};
#
#------------------
#
#=== output ===
puts stdout [::MCSS::OUTPUT "ln_dLdx_f^3*Q20%_A${A}B${B}"];
::MCSS::reset;
#
puts stdout "#---- end ---";
#
