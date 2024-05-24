%let pgm=utl-appending-sas-datasets-keeping-the-longest-variable-lengths-to-avoid-truncation;

Appending sas datasets keeping the longest variable lengths regardless of the order of the union avoiding truncation


inspired by
https://goo.gl/Ikes5g
https://communities.sas.com/t5/Base-SAS-Programming/Choose-maximum-variable-length-with-set/m-p/323794

https://communities.sas.com/t5/user/viewprofilepage/user-id/12447


/**************************************************************************************************************************/
/*                                   |                               |                                                    */
/*     INPUT                         |        PROCESS                |  OUTPUT (Longer length regardless of umion order)  */
/*                                   |                               |                                                    */
/*   WORK.HAVE1                      | UNION HAVE1 THEN HAVE2;       |                                                    */
/*                                   |                               |                                                    */
/*  #    Variable    Type    Len     | proc sql;                     | Variable    Type    Len                            */
/*                                   |   create table want as        |                                                    */
/*  1    SEX         Char      1     |   select * from have1         | SEX         Char      5                            */
/*  2    AGE         Num       8     |   union corr all              | AGE         Num       8                            */
/*                                   |   select * from have2         |                                                    */
/*   WORK.HAVE2                      |   ;                           |                                                    */
/*                                   | quit;                         |                                                    */
/*  #    Variable    Type    Len     |                               |                                                    */
/*                                   | proc contents data=want;      |                                                    */
/*  1    SEX         Char      5     | run;                          |                                                    */
/*  2    AGE         Num       4     |                               |                                                    */
/*                                   | UNION HAVE2 THEN HAVE1;       |                                                    */
/*                                   |                               |                                                    */
/*  data have1(keep=sex age);        | proc sql;                     | Variable    Type    Len                            */
/*    set sashelp.class;             |   create table want as        |                                                    */
/*  run;                             |   select * from have2         | SEX         Char      5                            */
/*                                   |   union corr all              | AGE         Num       8                            */
/*  data have2(keep=sex age);        |   select * from have1         |                                                    */
/*    length sex $5;                 |   ;                           |                                                    */
/*    length age 4.;                 | quit;                         |                                                    */
/*    set sashelp.class;             |                               |                                                    */
/*  run;                             | proc contents data=want;      |                                                    */
/*                                   | run;                          |                                                    */
/*                                   |                               |                                                    */
/**************************************************************************************************************************/

/*              _
  ___ _ __   __| |
 / _ \ `_ \ / _` |
|  __/ | | | (_| |
 \___|_| |_|\__,_|

*/
