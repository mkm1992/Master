% plot(Mmin:Mstep:Mmax,ue4.x1,'-*r')
% hold on
% plot(Mmin:Mstep:Mmax,ue2,'-*b')
% legend('4UEs in each Cluster','2UEs in each Cluster')
% title('EE vs. Number of RRHs in each Cluster for 3 Clusters')
% xlabel('Number of RRHs in each Cluster')
% ylabel('EE (bit/J)')

% plot(Mmin:Mstep:Mmax,y1.y1,'-*r')
% hold on
% plot(Mmin:Mstep:Mmax,y2,'-*b')
% legend('100 RRHs in each Cluster','50 RRHs in each Cluster')
% title('EE vs. Number of RRHs in each Cluster for 2 Clusters')
% xlabel('Number of UEs in each Cluster')
% ylabel('EE (bit/J)')

plot(Mmin:Mstep:Mmax,z2,'-*b')
hold on
plot(Mmin:Mstep:Mmax,z.z,'-*r')
legend('4 Clusters','2 Clusters')
title('EE vs. Maximum Capacity of Fronthaul Link ')
 xlabel('Maximum Capacity of Fronthaul Link')
 ylabel('EE (bit/J)')