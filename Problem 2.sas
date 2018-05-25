/*---------------------------------------------
 *                                                  
 *                 Problem 2                     
 *                                                  
 *--------------------------------------------*/

/* Read in data from a text file */
data crickets;
	infile "F:\Intro SAS\Problem 2.txt";
	input chirps temperature;
proc print data=crickets;
title "Problem 2: Cricket Chirps and Temperature";
run;

/* Run a simple linear regression */
proc reg data=crickets plots=diagnostics;
title2 "Regression Analysis for Cricket Chirps/Minute and Temperature";
	model temperature = chirps / cli clm;
run;
quit;
