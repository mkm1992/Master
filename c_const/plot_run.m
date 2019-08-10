plot(Mmin:Mstep:Mmax,xx,'-*k')
hold on
plot(Mmin:Mstep:Mmax,eta1(:,count_max),'-*r')
legend('\sigma_q^2 = 1e-4','\sigma_q^2 = 1e-2')
xlabel('Number od RRHs')
ylabel('Energy Efficiency(bit/J)')
title('EE vs. Number of RRHs for different \sigma_q')
