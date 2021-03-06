function dx3=sanxi_dx(t,x3) 
s=9;%探测器大底面积
ss=114;%伞的有效面积
m3=1785;%探测器伞系减速阶段质量
ms=40;%伞的质量40kg
cd=1.44;
%cl=0.271;
cn=0.062;
ct=1.27;
dx3=[
    x3(3);                   %x'
    x3(4);                   %y'
    -6.67.*10.^(-11).*6.4219.*10.^(23).*x3(1)/(x3(1).^2+x3(2).^2).^(3/2)-0.5*(0.0158.*exp((3.397*10.^(6)-sqrt(x3(1).^2+x3(2).^2))/9354.5))*(x3(3).^2+x3(4).^2)*((s*cd+ss*ct)*x3(3)/sqrt(x3(3).^2+x3(4).^2)-ss*cn*x3(4)/sqrt(x3(3).^2+x3(4).^2))/(m3+ms);    %x''
    -6.67.*10.^(-11).*6.4219.*10.^(23).*x3(1)/(x3(1).^2+x3(2).^2).^(3/2)-0.5*(0.0158.*exp((3.397*10.^(6)-sqrt(x3(1).^2+x3(2).^2))/9354.5))*(x3(3).^2+x3(4).^2)*((s*cd+ss*ct)*x3(4)/sqrt(x3(3).^2+x3(4).^2)+ss*cn*x3(3)/sqrt(x3(3).^2+x3(4).^2))/(m3+ms);];         %y''
    %x(6)-x(3)+x(4)];        %z''
    %];
end