input @1 COL1 4.2	@7 COL2 3.1; 
Add_result = COL1+COL2;
Sub_result = COL1-COL2;
Mult_result = COL1*COL2;
Div_result = COL1/COL2;
Expo_result = COL1**COL2;
datalines;
11.21 5.3
3.11  11
;
PROC PRINT DATA=MYDATA1;
RUN;