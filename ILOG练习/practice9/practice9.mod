/*********************************************
 * OPL 12.6.1.0 Model
 * Author: Administrator
 * Creation Date: 2018-4-20 at 下午9:07:22
 *********************************************/
/*定义各种材料的个数*/
int nbMetals=...;
int nbRaw=...;
int nbScrap=...;
int nbIngo=...;
/*各种材料个数的范围*/
range Metals=1..nbMetals;
range Raws=1..nbRaw;
range Scraps=1..nbScrap;
range Ingos=1..nbIngo;
/*定义各种材料的费用*/
float costMetals[Metals]=...;
float costRaws[Raws]=...;
float costScraps[Scraps]=...;
float costIngos[Ingos]=...;
/*各种金属的含量百分比*/
float low[Metals]=...;
float up[Metals]=...;
/*每种材料所含金属的百分比*/
float percRaw[Metals][Raws]=...;
float percScrap[Metals][Scraps]=...;
float percIngo[Metals][Ingos]=...;
 int alloy=...;
 /*定义变量*/
dvar float+ w[Metals];
dvar float+ r[Raws];
dvar float+ s[Scraps];
dvar int+   i[Ingos];
/*定义一个中间变量*/
dvar float m[j in Metals] in low[j]*alloy..up[j]*alloy;
constraint ct1;
constraint ct2;
/*目标函数*/
minimize 
sum(j in Metals)costMetals[j]*w[j]+sum(j in Raws)costRaws[j]*r[j]+sum(j in Scraps)s[j]*costScraps[j]
+sum(j in Ingos)costIngos[j]*i[j];
subject to{
ct1=forall(j in Metals)
      m[j]==w[j]+sum(k in Raws)percRaw[j][k]*r[k]+sum(k in Scraps)percScrap[j][k]*s[k]
+sum(k in Ingos)percIngo[j][k]*i[k];
ct2=sum(j in Metals)m[j]==alloy;
}




