%着陆准备阶段0-1
function [ind,T1,X1t,Y1t,Vx1t,Vy1t]=zhuolu(t1,h,theta0)
%输出
%T1-第一阶段整个过程所用时间(待优化，性能指标)
%r1t-着陆器到火心的距离
%fai1t-探测器与火心连线在y轴正向形成的夹角
%V1t-合速度
%thetat-速度角范围(-pi/2,pi/2)
%输入
%t1-给定t,用于解微分方程
%theta0初始速度方向，需进行更新
%第一阶段从停泊轨道近火点开始变轨到风险轨道
R=3397000;
G=6.67*10^(-11);
M=6.4219*10^(23);
%h=50000;
ra=3677000;
fai=0;
%va=4965;
rb=62397000;
r0=ra;%(va.*ra).^2/(G*M);
%T1=0;
%V0=(va.*ra)/r0;
V0=((R+h).*sqrt(2.*G.*M.*r0.*sin(pi/2+fai+theta0)/((R+h).*((R+h)+r0.*sin(pi/2+fai+theta0)))))/(r0.*sin(pi/2+fai+theta0));
%theta0-初始速度角,
rx0=r0*sin(fai);
ry0=r0*cos(fai);
Vx0=V0.*cos(theta0);
Vy0=V0.*sin(theta0);
[t,x]=ode45('zhuolu_dx',(0:0.01:t1),[rx0,ry0,Vx0,Vy0]);%t1第一阶段终止时间 
%tf=t(size(t,2)-1,1);%着陆阶段时间
%%位移
X1t=x(:,1);%着陆阶段x(t)
Y1t=x(:,2);%着陆阶段y(t)
r1t=sqrt(X1t.^2+Y1t.^2);%r-到火心的距离
fai1t=atan(X1t./Y1t);%第一阶段降落轨迹上任一点与y轴正向夹角
%%速度
Vx1t=x(:,3);
Vy1t=x(:,4);
V1t=sqrt(Vx1t.^2+Vy1t.^2);%着陆阶段速度
theta1t=atan(Vy1t./Vx1t);%第一阶段速度与x轴正向角
%%时间

indx=min(find((abs(r1t-R-125000)<100)));
if indx<180000
   ind=0;
else
    ind=indx;
end
    
T1=ind/100;


end