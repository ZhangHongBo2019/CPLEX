/*********************************************
 * OPL 12.6.1.0 Model
 * Author: Administrator
 * Creation Date: 2018-4-19 at обнГ7:49:37
 *********************************************/
range kinds=1..2;
dvar float product[kinds];
maximize 40*product[1]+50*product[2];
subject to {
product[1]+product[2]<=50;
3*product[1]+4*product[2]<=180;
product[2]<=40;
}