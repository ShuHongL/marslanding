function T4=huoxing1(h,theta0)
%%����
%t1_-��һ�׶�Ԥ����ʱ��仯��Χ,����ʵ��ʱ���ֶ�����ʱ�䷶Χ
%t2_-��һ�׶�Ԥ����ʱ��仯��Χ
%t3_-��һ�׶�Ԥ����ʱ��仯��Χ
%t4_-��һ�׶�Ԥ����ʱ��仯��Χ
%h-���չ�������������ľ��룬Ӱ��T4������T4ֵ�仯��ֻ���ҵ���СT4
%theta0-�ѹ���ٶȽ�,Ӱ��T4������T4ֵ�仯��ֻ���ҵ���СT4
%%���
%T4-����������ʱ��
%%��½׼���׶�0-1
[ind,T1,X1t,Y1t,Vx1t,Vy1t]=zhuolu(6500,h,theta0);
if ind==0
    T4=10000;
else
    %%��������1-2
    [ind2,T2,X2t,Y2t,Vx2t,Vy2t]=qidong(T1,1600,X1t(ind),Y1t(ind),Vx1t(ind),Vy1t(ind));
    if ind2==0
        T4=10000;
    else
       %%ɡϵ����2-3
       [ind3,T3,X3t,Y3t,Vx3t,Vy3t]=sanxi(T2,200,X2t(ind2),Y2t(ind2),Vx2t(ind2),Vy2t(ind2));
       if ind3==0
           T4=10000;
       else
           %%��������3-4
           [ind4,T4,X4t,Y4t,Vx4t,Vy4t]=dongli(T3,200,X3t(ind3),Y3t(ind3),Vx3t(ind3),Vy3t(ind3)); 
       end
    end
end

end