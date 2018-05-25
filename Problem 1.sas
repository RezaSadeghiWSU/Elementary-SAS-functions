/*---------------------------------------------
 *                                                  
 *                 Problem 1                      
 *                                                  
 *--------------------------------------------*/

/* 
Scores on two exams
1=undergrad
2=grad
*/

data exams;
input id class gender $ exam1 exam2;
cards;
101 1 M 80 80
102 2 M 90 97
103 1 M 66 44
104 2 M 56 59
105 1 M 100 75
106 2 F 99 68
107 1 F 87 78
108 2 F 78 77
109 1 F 90 72
110 2 F 83 67
;

/* Print data */
proc print data=exams;
	title "Problem 1: Exam Scores"; 
run;

/* Print graduate students who received lower than an 80% only */
proc print data=exams;
	where class=2 AND (exam1<80 OR exam2<80);
title2 "Graduate Students Earning Less than an 80% On Either Exam";
run;

/* Get column totals for both exams by class */
proc sort data=exams out=sortedexams;
	by class;
run;
proc print data=sortedexams; 
	title2 "Total Exam Scores by Class";
	by class;
	sum exam1 exam2;
run;

/* Generate descrtiptive statistics */
proc means data=exams maxdec=2;
title2 "Descriptive Statistics for Exam Scores";
	var exam1 exam2;
run;
proc univariate data=exams;
	var exam1 exam2;
	histogram;
run;

/* Create a scatterplot of exam 1 vs exam 2 */
proc gplot data=exams;
title2 "Plot of Exam 1 Scores vs Exam 2 Scores";
	plot exam2*exam1;
	symbol1 value=dot;
run;
quit;

/* Find the correlation between exam 1 and exam 2 */
proc corr data=exams;
title2 "Correlation for Exam Scores";
	var exam1 exam2;
run;

/* Do a paired t-test with exam1 and exam2 */
proc ttest data=exams;
title2 "Paired t-test for Exam Scores";
	paired exam1*exam2;
run;
