/*********************************************
 * OPL 12.6.1.0 Model
 * Author: Administrator
 * Creation Date: 2018-9-7 at обнГ1:30:55
 *********************************************/
dvar float+ gas;
dvar float+ chloride;
constraint ct1;
constraint ct2;
constraint ct3;
maximize
  40*gas+50*chloride;
subject to{
ct1=gas+chloride<=50;
ct2=3*gas+4*chloride<=180;
ct3=chloride<=40;
}