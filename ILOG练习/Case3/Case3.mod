/*********************************************
 * OPL 12.6.1.0 Model
 * Author: Administrator
 * Creation Date: 2018-9-7 at ÏÂÎç2:05:29
 *********************************************/
dvar float+ x11;
dvar float+ x12;
dvar float+ x21;
dvar float+ x22;
dvar float+ x31;
dvar float+ x32;
constraint ct1;
constraint ct2;
constraint ct3;
constraint ct4;
constraint ct5;
minimize
  0.6*x11+0.8*x12+0.8*x21+0.9*x22+0.3*x31+0.4*x32;
 subject to{
 ct1=x11+x12>=100;
 ct2=x21+x22>=200;
 ct3=x31+x32>=300;
 ct4=0.5*x11+0.4*x21+0.3*x31<=20;
 ct5=0.2*x11+0.4*x21+0.6*x31<=40; 
 }