plot(Cmin:Cstep:Cmmax,a2,'-*r')
hold on
plot(Cmin:Cstep:Cmmax,a1,'-*b')
xlabel('Maximum Capacity of Fronthaul link(bit/s/Hz)')
ylabel('EE(bit/J)')
legend('10 RRHs per Cluster','5 RRHs per Cluster')
title('EE vs. Cmax')