function T4=huoxing1(h,theta0)
%%输入
%t1_-第一阶段预定义时间变化范围,依照实际时间手动给定时间范围
%t2_-第一阶段预定义时间变化范围
%t3_-第一阶段预定义时间变化范围
%t4_-第一阶段预定义时间变化范围
%h-风险轨道近火点距离火面的距离，影响T4，根据T4值变化，只到找到最小T4
%theta0-脱轨点速度角,影响T4，根据T4值变化，只到找到最小T4
%%输出
%T4-整个过程总时间
%%着陆准备阶段0-1
[ind,T1,X1t,Y1t,Vx1t,Vy1t]=zhuolu(6500,h,theta0);
if ind==0
    T4=10000;
else
    %%气动减速1-2
    [ind2,T2,X2t,Y2t,Vx2t,Vy2t]=qidong(T1,1600,X1t(ind),Y1t(ind),Vx1t(ind),Vy1t(ind));
    if ind2==0
        T4=10000;
    else
       %%伞系减速2-3
       [ind3,T3,X3t,Y3t,Vx3t,Vy3t]=sanxi(T2,200,X2t(ind2),Y2t(ind2),Vx2t(ind2),Vy2t(ind2));
       if ind3==0
           T4=10000;
       else
           %%动力减速3-4
           [ind4,T4,X4t,Y4t,Vx4t,Vy4t]=dongli(T3,200,X3t(ind3),Y3t(ind3),Vx3t(ind3),Vy3t(ind3)); 
       end
    end
end

end