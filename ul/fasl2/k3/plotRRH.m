plot(Mmin:Mstep:Mmax,b,'-* r')
hold on
plot(Mmin:Mstep:Mmax,c.a,'-o k')
xlabel('Number of RRHs')
ylabel('EE (bit/J)')
title('EE vs. Number of RRHs')
legend('6UEs','3UEs')
