%��½׼���׶�0-1
function [ind,T1,X1t,Y1t,Vx1t,Vy1t]=zhuolu(t1,h,theta0)
%���
%T1-��һ�׶�������������ʱ��(���Ż�������ָ��)
%r1t-��½�������ĵľ���
%fai1t-̽���������������y�������γɵļн�
%V1t-���ٶ�
%thetat-�ٶȽǷ�Χ(-pi/2,pi/2)
%����
%t1-����t,���ڽ�΢�ַ���
%theta0��ʼ�ٶȷ�������и���
%��һ�׶δ�ͣ���������㿪ʼ��쵽���չ��
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
%theta0-��ʼ�ٶȽ�,
rx0=r0*sin(fai);
ry0=r0*cos(fai);
Vx0=V0.*cos(theta0);
Vy0=V0.*sin(theta0);
[t,x]=ode45('zhuolu_dx',(0:0.01:t1),[rx0,ry0,Vx0,Vy0]);%t1��һ�׶���ֹʱ�� 
%tf=t(size(t,2)-1,1);%��½�׶�ʱ��
%%λ��
X1t=x(:,1);%��½�׶�x(t)
Y1t=x(:,2);%��½�׶�y(t)
r1t=sqrt(X1t.^2+Y1t.^2);%r-�����ĵľ���
fai1t=atan(X1t./Y1t);%��һ�׶ν���켣����һ����y������н�
%%�ٶ�
Vx1t=x(:,3);
Vy1t=x(:,4);
V1t=sqrt(Vx1t.^2+Vy1t.^2);%��½�׶��ٶ�
theta1t=atan(Vy1t./Vx1t);%��һ�׶��ٶ���x�������
%%ʱ��

indx=min(find((abs(r1t-R-125000)<100)));
if indx<180000
   ind=0;
else
    ind=indx;
end
    
T1=ind/100;


end