# LOG: `ln_dLdx_f^3*Q20%_A0.950117B0.819635_MCSS1701754869_LOG.md`
- Timestamp: `Tue Dec 05 14:41:09 JST 2023`
- Time code: `1701754869`
___
## Metadata
- Resampling: `100`
- Random_range: `2,5`
- Format_string: `%.1f`
### Notes
- constants: `(A,B) := (0.950117,0.819635)`
- function: `F(x) := (Ax+B)^3*Q, where Q = 1+p(2u-1) and p = 0.2`
- title: `f(x)^3*Q`
- fittingLog: `(Ax+B)^3_fit_sampling_20231028N0_2023-Oct-28-23:22:58.log`
- def: `ln(1+dL/dx) = ln(1+(mid(L)+min(L))/dx), where dL = L1+L2+L3-max(L), dx = max(x)-min(x), and Li = sqrt(dxi^2+dyi^2)`
- sampling: `1.0E4 X 1.0E2`
### Sources
- `ln_dLdx_f^3*Q20%_fit_TEMP.tcl`
- `(Ax+B)^3_fit_sampling_20231028N0_2023-Oct-28-23:22:58.log`
### Machine_epsilon
- Machine_epsilon: `1.1102230246251565e-16`
___
# INFO: [`ln_dLdx_f^3*Q20%_A0.950117B0.819635_MCSS1701754869_INFO.csv`](ln_dLdx_f^3*Q20%_A0.950117B0.819635_MCSS1701754869_INFO.csv)
|"names"|"values"|"std"|
|---:|---:|---:|
|"sample_size"|10000.0|0.0|
|"x_min"|1.299|0.3033466530542111|
|"x_max"|7.357|0.7003974340733736|
|"x_range"|6.058|0.7883213209412169|
|"score_25"|2.894|0.15163752633810468|
|"score_50"|4.138|0.1426870560338112|
|"score_75"|5.356|0.16100693253159107|
|"avg"|3.9269368|0.0040036972508879715|
|"sample_std"|0.36069769718963085|0.005215628427746016|
|"CV"|0.09185212842165628|0.001321071082724387|
|"3rd_moment"|0.017735298820348577|0.008053850870059848|
|"4th_moment"|0.15437464257215147|0.031676696667145544|
|"skewness"|0.37518886248901473|0.1618638344673734|
|"kurtosis"|9.064133760053076|1.4990537001134203|
|"kurtosis_normal"|6.064133760053077|1.4990537001134203|
___
# DATA: [`ln_dLdx_f^3*Q20%_A0.950117B0.819635_MCSS1701754869_DATA.csv`](ln_dLdx_f^3*Q20%_A0.950117B0.819635_MCSS1701754869_DATA.csv)
|"x"|"frequencies"|"std"|
|---:|---:|---:|
|0.7|1.0|0.0|
|0.8|1.0|0.0|
|0.9|1.0|0.0|
|1.0|1.1111111111111112|0.33333333333333337|
|1.1|1.0|0.0|
|1.2|1.1111111111111112|0.3233808333817773|
|1.3|1.0909090909090908|0.29424494316824984|
|1.4|1.2692307692307692|0.45234432086120485|
|1.5|1.2894736842105263|0.5150646633160448|
|1.6|1.1621621621621623|0.37368387661182234|
...
|9.9|1.0|0.0|