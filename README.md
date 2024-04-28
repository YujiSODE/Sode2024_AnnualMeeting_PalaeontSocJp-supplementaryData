# Sode2024_AnnualMeeting_PalaeontSocJp-supplementaryData
Supplementary data: Applicability of Random Simulation to the Evaluation of Interpolation  (Sode, 2024).
___
GitHub: https://github.com/YujiSODE/Sode2024_AnnualMeeting_PalaeontSocJp-supplementaryData  
>Copyright (c) 2024 Yuji SODE \<yuji.sode@gmail.com\>  
______
Results are based on results by [MCSS](https://github.com/YujiSODE/monteCarloSimulationSummarizer).
______
## Result
```
	R* = ln(1+dL/dx), where dx = max(x*)-min(x*) and dL = (maximum length)-(minimum length) = L1+L2+L3-max(L)
```
<img width=300 src='https://github.com/YujiSODE/Sode2024_AnnualMeeting_PalaeontSocJp-supplementaryData/blob/main/ln_dLdx_sampling_20231028N0_IMG.png'>  

**Figure 1. Graphs showing frequency distributions of `ln(1+dL/dx)`.**  
This graph shows frequency distributions of `ln(1+dL/dx)`, which are defined using three random points on a given function `f(x)` or generated sample data.  
Every line is result of given function `f(x)`. Every point is result of generated sample data. Each graph represents average of a hundred sets of results.  
Filled areas or error bars represent standard deviations.
___
## [Sample data 01](https://github.com/YujiSODE/Sode2024_AnnualMeeting_PalaeontSocJp-supplementaryData/tree/main/sampling_20231028N0)
```
sample data: 100 points
	f(x)*Q(0.2): f(x) = (3x-2)^2, Q(p) = 1+p(2u-1), u = [0, 1], x = 2 to 5
```
<img width=300 src='https://github.com/YujiSODE/Sode2024_AnnualMeeting_PalaeontSocJp-supplementaryData/blob/main/sampling_20231028N0/sampling_20231028N0_fittings_IMG.png'>  

**Figure. 2. Graphs showing sample data and results of curve fitting.**  
Every point is plot of the generated data set from a model which is `(3x-2)^2` with 20 percent of deviation.  
Every line is result of curve fitting using the least squares method.
___

