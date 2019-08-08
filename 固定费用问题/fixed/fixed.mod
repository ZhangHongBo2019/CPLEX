/*********************************************
 * OPL 12.6.1.0 Model
 * Author: Administrator
 * Creation Date: 2018-9-13 at ����2:12:49
 *********************************************/
//�̶���������
{string} Machines=...;
{string} Products=...;
{string} Resources=...;
int capacity[Resources]=...;
int RentCost[Machines]=...;
int Maxproduction=max(r in Resources)capacity[r];
tuple ProductType{
int profit;
{string} use;
int consump[Resources];
}
ProductType product[Products]=...;//�˴���Ҫ���˼�ʡ�Ժţ���Ȼ������Ѷ�������ݵĴ���
dvar boolean Rent[Machines];
dvar int+ produce[Products];
constraint ct1;
constraint ct2;
maximize
  sum(p in Products)produce[p]*product[p].profit
  -sum(m in Machines)RentCost[m]*Rent[m];
subject to{
ct1=forall(r in Resources)
sum(p in Products)produce[p]*product[p].consump[r]<=capacity[r];
ct2=forall(p in Products,m in product[p].use)
produce[p]<=Maxproduction*Rent[m];
}