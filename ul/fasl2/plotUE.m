% plot(Kmin:Kstep:Kmax,m60*100,'-*k')
% hold on
% plot(Kmin:Kstep:Kmax,a.a*100,'-o r')
% xlabel('Number of UEs')
% ylabel('EE (bit/J)')
% title('EE vs. Number of UEs')
% legend('60RRHs','30RRHs')


% plot(Mmin:Mstep:Mmax,b,'-*b')
% hold on
% plot(Mmin:Mstep:Mmax,a.a,'-*r')

plot(Mmin:Mstep:Mmax,c,'-*r')
hold on
plot(Mmin:Mstep:Mmax,a.a,'-*b')
xlabel('Number of RRHs')
ylabel('EE (bit/J)')
title('EE vs. Number of RRHs')
legend('\sigma_q = 10^{-6}','\sigma_q = 10^{-4}')
