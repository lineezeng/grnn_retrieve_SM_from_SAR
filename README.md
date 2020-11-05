# grnn_retrieve_SM_from_SAR
Please use the m file ‘grnncontrol.m’ to calculate the cross-validation results (MAE, RMSE, and R2) of 15 BSSM-backscatters models under different ‘spread’ parameters. And ‘grnncontrol_rf.m’ is to calculate the cross validations of 15 BSSM-backscatter-roughness models under different ‘spread’ parameters. 
‘tenfold_grnn1.m’ to ‘tenfold_grnn10.m’ is the 10-fold cross-validation results by GRNN calculation. Each cross validation is random and the final result is the optimum of ten 10-fold cross-validation results.
For each BSSM-backscatter model or BSSM-backscatter-roughness model, the valid ranges of ‘spread’ parameters are a bit different. In the files of ‘grnncontrol.m’ and ‘grnncontrol_rf.m’, the spread range is based on the empirical results of trials. 

‘tenfold_regr_rf.m’ and ‘tenfold_regr.m’ are the traditional regression function using or not using roughness effect. 

‘raw data2020.xlsx’ in the all m files consist of No. series, latitude, longitude, root-mean-square height (S), correlation length (L), hh-polarization backscattering coefficient, hh-polarization backscattering coefficient, hv-polarization backscattering coefficient, vh-polarization backscattering coefficient (from the left to the right). 
Please use the supplementary table S1 to get the ‘raw data2020.xlsx’. 
