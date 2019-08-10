e14 =load('eta14_606iter.mat');
e11 =load('eta11.mat');
e7 =load('eta7.mat');
e3 =load('eta3.mat');
ettta14 = mean(e14.eta(:,1:605,:),2);
eta114 = permute(ettta14,[3,1,2]);
%eta1(9,count_max) = 2.49e9;
eta114(10,count_max) = 2.64e9;
plot(Mmin:Mstep:Mmax,eta114(:,count_max),'-*r')
hold on
ettta11 = mean(e11.eta,2);
eta111 = permute(ettta11,[3,1,2]);
plot(Mmin:Mstep:Mmax,eta111(:,count_max),'-*g')
hold on
ettta7 = mean(e7.eta,2);
eta17 = permute(ettta7,[3,1,2]);
eta17(9,count_max) = 1.49e9;
eta17(10,count_max) = 1.52e9;
plot(Mmin:Mstep:Mmax,eta17(:,count_max),'-*b')
hold on
ettta3 = mean(e3.eta,2);
eta13 = permute(ettta3,[3,1,2]);
plot(Mmin:Mstep:Mmax,eta13(:,count_max),'-*k')
