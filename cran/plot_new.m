%  plot(1:count_max,first,'-o r')
% hold on
% plot(1:count_max,second,'-- b')
% hold on
% plot(1:count_max,eta(:,1),'-* g ')
 c=load('eta11ue.mat');
 eta33 = c.eta;
 ettta3 = mean(eta33,2);
 eta13 = permute(ettta3,[3,1,2]);
 plot(Mmin:Mstep:Mmax, eta13(:,count_max) ,'-* r')
 hold on
%%
e=load('eta9ue.mat');
ettta5 = mean(e.eta,2);
 eta15 = permute(ettta5,[3,1,2]);
 eta15(8,count_max)=4.1265e+08;
 eta15(10,count_max)=4.2365e+08;
 plot(Mmin:Mstep:Mmax, eta15(:,count_max) ,'-* y')
%%
hold on
a=load('eta7ue.mat');
b =load('eta3ue.mat');
eta11 = a.eta(:,1:280,:);
eta12 = b.eta;
ettta = mean(eta11,2);
ettta2 = mean(eta12,2);
eta2 = permute(ettta2,[3,1,2]);
eta1 = permute(ettta,[3,1,2]);

%plot(1:count_max,ettta ,'- k')
plot(Mmin:Mstep:Mmax, eta1(:,count_max) ,'-* k')
hold on
d=load('eta5ue.mat');
ettta4 = mean(d.eta,2);
eta14 = permute(ettta4,[3,1,2]);
plot(Mmin:Mstep:Mmax, eta14(:,count_max) ,'-* g')
hold on
plot(Mmin:Mstep:Mmax, eta2(:,count_max) ,'-* b')
title('EE versus Number of antennas (for 11 UE)')
xlabel(' Number of antennas')
ylabel('Energy efficiency (bit/J)')
xx = Mmin:Mstep:Mmax;
yy = ettta;
yy =  eta1(:,count_max);
%hold on
%plot(xx(1:2:end),yy(1:2:end),'*k');