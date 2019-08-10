plot (Mt_min :Mt_step:Mt_max,mean(etaSum,1),'-*g')
hold on
u6 = load('etaSum6.mat');
plot (Mt_min :Mt_step:Mt_max,mean(u6.etaSum,1),'-*r')
hold on
u3 =load('etaSum.mat');
plot (Mt_min :Mt_step:Mt_max,mean(u3.etaSum,1),'-*b')