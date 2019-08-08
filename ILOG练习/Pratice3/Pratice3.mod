/*********************************************
 * OPL 12.6.1.0 Model
 * Author: Administrator
 * Creation Date: 2018-4-19 at 下午7:35:54
 *********************************************/
//使用数组使模型的可读性更好
{string} Products={"gas","chloride"};
dvar float production[Products];
maximize 40*production["gas"]+50*production["chloride"];
subject to{
production["gas"]+production["chloride"]<=50;
3*production["gas"]+4*production["chloride"]<=50;
production["chloride"]<=40;
}
