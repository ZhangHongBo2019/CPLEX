/*********************************************
 * OPL 12.6.1.0 Model
 * Author: Administrator
 * Creation Date: 2018-9-10 at обнГ2:43:36
 *********************************************/
dvar float x1 in 0..40;
dvar float x2;
dvar float x3;
constraint ct1;
constraint ct2;

maximize
  x1+2*x2+3*x3;
subject to{
ct1=-x1+x2+x3<=20;
ct2=x1-3*x2+x3<=30;
}