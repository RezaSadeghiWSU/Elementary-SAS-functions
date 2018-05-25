Libname wine 'F:\Intro SAS'; 
PROC IMPORT OUT=wine.content DATAFILE= "F:\Intro SAS\Problem 4.xlsx"
            DBMS=xlsx REPLACE;
  SHEET="Alcohol";
  GETNAMES=YES;
run;

proc print data=wine.content;
title "Alcohol Content of Various Wines by Region";
run;

/* Put this where you want the Word document to start*/
ods rtf file="F:\Intro SAS\Problem 4 Output.doc";
proc sort data=wine.content out=wine.sortedcontent;
	by Region;
run;

/* Get means by Region */
proc means data=wine.sortedcontent maxdec=2;
	by Region;
	var Alcohol_Content;
run;

/* Run a one-way ANOVA */
proc glm data=wine.content plots=diagnostics;
	class Region;
	model Alcohol_Content=Region;
	lsmeans Region / adjust=tukey cl;
run;
quit;
ods rtf close;
/* Put this where you want the document to end */

