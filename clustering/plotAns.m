%m=load('x77.mat');
plot(Umin:Ustep:Umax,m.x77,'-*b')
hold on
%c=load('ue50.mat');
plot(Umin:Ustep:Umax,c.eta1(:,count_max),'-*k')
hold on
%a1=load('ue30.mat');
plot(Umin:Ustep:Umax,a1.z,'-*r')
xlabel('Number of UEs per Cluster')
ylabel('EE (bit/j)')
title('EE vs. number of UEs for different number of RRHs')
legend('70 RRHs per Cluster','50 RRHs per Cluster', '30 RRHs per Cluster')