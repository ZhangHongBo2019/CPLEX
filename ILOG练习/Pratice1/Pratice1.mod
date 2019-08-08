/*********************************************
 * OPL 12.6.1.0 Model
 * Author: Administrator
 * Creation Date: 2018-4-19 at обнГ7:02:55
 *********************************************/
dvar float x1 in 0..40;
dvar float x2;
dvar float x3;

maximize x1 + 2*x2 +3*x3;

subject to{
	-x1 + x2 + x3 <= 20;
	x1 - 3*x2 + x3 <= 30;
}