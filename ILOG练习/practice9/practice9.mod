/*********************************************
 * OPL 12.6.1.0 Model
 * Author: Administrator
 * Creation Date: 2018-4-20 at ����9:07:22
 *********************************************/
/*������ֲ��ϵĸ���*/
int nbMetals=...;
int nbRaw=...;
int nbScrap=...;
int nbIngo=...;
/*���ֲ��ϸ����ķ�Χ*/
range Metals=1..nbMetals;
range Raws=1..nbRaw;
range Scraps=1..nbScrap;
range Ingos=1..nbIngo;
/*������ֲ��ϵķ���*/
float costMetals[Metals]=...;
float costRaws[Raws]=...;
float costScraps[Scraps]=...;
float costIngos[Ingos]=...;
/*���ֽ����ĺ����ٷֱ�*/
float low[Metals]=...;
float up[Metals]=...;
/*ÿ�ֲ������������İٷֱ�*/
float percRaw[Metals][Raws]=...;
float percScrap[Metals][Scraps]=...;
float percIngo[Metals][Ingos]=...;
 int alloy=...;
 /*�������*/
dvar float+ w[Metals];
dvar float+ r[Raws];
dvar float+ s[Scraps];
dvar int+   i[Ingos];
/*����һ���м����*/
dvar float m[j in Metals] in low[j]*alloy..up[j]*alloy;
constraint ct1;
constraint ct2;
/*Ŀ�꺯��*/
minimize 
sum(j in Metals)costMetals[j]*w[j]+sum(j in Raws)costRaws[j]*r[j]+sum(j in Scraps)s[j]*costScraps[j]
+sum(j in Ingos)costIngos[j]*i[j];
subject to{
ct1=forall(j in Metals)
      m[j]==w[j]+sum(k in Raws)percRaw[j][k]*r[k]+sum(k in Scraps)percScrap[j][k]*s[k]
+sum(k in Ingos)percIngo[j][k]*i[k];
ct2=sum(j in Metals)m[j]==alloy;
}




