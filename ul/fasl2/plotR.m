plot(Mmin:Mstep:Mmax,a1,'-*r')
hold on
plot(Mmin:Mstep:Mmax,a2,'-*k')
legend('\sigma_q = 10^{-8}','\sigma_q = 10^{-4}')
title('EE vs. Number of RRHs')
xlabel('Number of RRHs')
ylabel('EE (bit/J)')