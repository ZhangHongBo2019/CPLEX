/*********************************************
 * OPL 12.6.1.0 Model
 * Author: Administrator
 * Creation Date: 2018-4-19 at 下午8:51:31
 *********************************************/
//分离数据
{string} Products=...;
{string} Components=...;
float demand[Products][Components]=...;
float profit[Products]=...;
float stock[Components]=...;
dvar float+ production[Products];
maximize 
sum(p in Products)profit[p]*production[p];
constraint ct;
subject to {
ct=forall(c in Components)
sum(p in Products)demand[p][c]*production[p]<=stock[c];
}