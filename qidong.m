%气动减速阶段 1-2
function [ind2,T2,X2t,Y2t,Vx2t,Vy2t]=qidong(T1,t_,X1,Y1,Vx1,Vy1)
%%符号意义
%输入
%t_为气动减速阶段消耗的时间，需要进行更新
%t1-着陆准备阶段结束时间
%X1-着陆准备阶段结束x轴方向位移
%Y1-着陆准备阶段结束y轴方向位移
%Vx1-着陆准备阶段结束x轴方向速度
%Vy1-着陆准备阶段结束y轴方向速度
%输出
%t-整个过程时间变化
%T2-着陆准备阶段到气动减速阶段结束总共消耗的时间
%r2t-着陆器到火心的距离
%fai2t-探测器火心连线与y轴正向夹角
%V2t-探测器速度
%theta2t-速度角
R=3397000;
[t2,x]=ode45('qidong_dx',(0:0.01:t_),[X1 Y1 Vx1 Vy1]);
%%位移
X2t=x(:,1);
Y2t=x(:,2);
r2t=sqrt(x(:,1).^2+x(:,2).^2);
fai2t=atan(X2t./Y2t);
%%速度
Vx2t=x(:,3);
Vy2t=x(:,4);
V2t=sqrt(x(:,3).^2+x(:,4).^2);
theta2t=atan(Vy2t./Vx2t);
%
%%时间
   ind1=find(abs(r2t(:)-R-8000)<3000);%找出距离火面高度为5-11km高度的索引
   for i=1:size(ind1,1)
       ind2=0;
       if(abs(V2t(ind1(i))/340-1.75)<0.75)
           ind2=ind1(i);
           break;
       end
   end
   if ind2==0
        T2=0;
   else
       T2=T1+(ind2/100);
   end
end