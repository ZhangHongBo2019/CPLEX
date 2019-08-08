/*********************************************
 * OPL 12.6.1.0 Model
 * Author: Administrator
 * Creation Date: 2018-9-7 at обнГ1:43:09
 *********************************************/
{string} Products={"gas","chloride"};
{string} Components={"nitrogen","hydrogen","chlorine"};

float demand[Products][Components]=[[1,3,0],[1,4,1]];
float profit[Products]=[40,50];
float stock[Components]=[50,180,40];

dvar float+ Production[Products];

constraint ct;
maximize
  sum(p in Products)profit[p]*Production[p];
subject to{
ct=forall(c in Components)
sum(p in Products)demand[p][c]*Production[p]<=stock[c];
}