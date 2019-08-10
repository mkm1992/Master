plot(Mmin:Mstep:Mmax,c.c1,'-*b')
hold on
plot(Mmin:Mstep:Mmax,c2,'-*r')
xlabel('Maximum Capacity of Fronthaul Link')
ylabel('EE(bit/J)')
legend('2 UEs per Cluster ', '3 UEs per Cluster')
title('EE vs. Cmax for 20 RRHs per Cluster')