plot(Kmin:Kstep:Kmax,eta1(:,count_max,1),'-*r')
hold on
plot(Kmin:Kstep:Kmax,a2,'-*k')
plot(Kmin:Kstep:Kmax,a3,'-*b')
legend('15RRHs','20 RRHs', '25 RRHs')
title('EE vs. Number of UEs')
xlabel('Number of UEs')
ylabel('EE (bit/J)')