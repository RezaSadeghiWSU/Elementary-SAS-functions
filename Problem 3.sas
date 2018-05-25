/*---------------------------------------------
 *                                                  
 *                 Problem 3                      
 *                                                  
 *--------------------------------------------*/

/* Label the colors */
proc format;
	value rowfmt		1="Black"
						2="Brown"
						3="Red"
						4="Blonde";
	value colfmt		1="Brown"
						2="Blue"
						3="Hazel"
						4="Green";
run;
quit;

/* Enter data */
data color;
do row=1 to 4;
	do col=1 to 4;
	input count @@;
	output;
	end;
end;

/* Assign the format */
label row="Hair Color" col="Eye Color";
format row rowfmt. col colfmt.;

cards;
68 29 15 5
119 84 54 29
26 17 14 14
7 94 10 16
;

proc print data=color;
title "Problem 3: Hair and Eye Color Data";
run;

/* Create a table */
proc freq data=color;
	weight count;
	table row*col;
run;
quit;

/* Generate the contingency table and do a chi-square test */
proc freq data=color;
title2 "Chi-square Test for Hair and Eye Color";
	weight count;
	table row*col / chisq norow nocol;
run;
quit;

/*Define the axis characteristics */
axis1 value=none label=none;
axis2 label=(angle=90 "Frequency");
axis3 label=none;

/* Define the legend options */
legend1 frame;

/* Generate a bar chart */
proc gchart data=color;
title2 "Frequenct of Eye Color by Hair Color";
	vbar3d col / subgroup=col group=row sumvar=count
	legend=legend1 gspace=6 space=0 discrete
	maxis=axis1 raxis=axis2 gaxis=axis3;
	pattern1 color=stbr;
	pattern2 color=blue;
	pattern3 color=libg;
	pattern4 color=stolg;
run;
quit;
