
K_p1 = [eta13(1,count_max),eta15(1,count_max),eta1(1,count_max),eta14(1,count_max),eta2(1,count_max)];
K_p2 = [eta13(4,count_max),eta15(4,count_max),eta1(4,count_max),eta14(4,count_max),eta2(4,count_max)];
K_p3 = [eta13(7,count_max),eta15(7,count_max),eta1(7,count_max),eta14(7,count_max),eta2(7,count_max)];
K_p4 = [eta13(10,count_max),eta15(10,count_max),eta1(10,count_max),eta14(10,count_max),eta2(10,count_max)];
plot(11:-2:3,K_p4,'-*k')
hold on
plot(11:-2:3,K_p3,'-*b')
hold on
plot(11:-2:3,K_p2,'-*g')
hold on
plot(11:-2:3,K_p1,'-*r')
title('EE versus Number of UE ')
xlabel(' Number of UEs')
ylabel('Energy efficiency (bit/J)')