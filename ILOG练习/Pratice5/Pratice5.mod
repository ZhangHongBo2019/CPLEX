/*********************************************
 * OPL 12.6.1.0 Model
 * Author: Administrator
 * Creation Date: 2018-4-19 at 下午8:19:55
 *********************************************/
//使用数组
{string} Products={"gas","chloride"};
{string} Components={"nitrogen","hydrogen","chlorine"};
float demand[Products][Components]=[[1,3,0],[1,4,1]];
float profit[Products]=[40,50];
float stock[Components]=[50,180,40];
dvar float+ production[Products];
maximize 
sum(p in Products)profit[p]*production[p];
constraint ct;
subject to {
ct=forall(c in Components)
sum(p in Products)demand[p][c]*production[p]<=stock[c];
}

 