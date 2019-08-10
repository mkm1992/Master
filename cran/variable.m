R = 500;
BW = 120*1e3;%10*1e6;
K = 3;   
n0 = -150;%-174 ; %dbm
N0 = db2pow(n0)/1000;
Pc = 0.01; %watt
Pt = 10;
Pmax = db2pow(Pt)/1000;
Rt = 6*BW;%0.1*BW; 
r = zeros(1,K);
Mmin=10;
Mstep=10;
Mmax=10;
iter_max =1;
count_max = 50;
eta = zeros(count_max,iter_max,floor((Mmax-Mmin)/Mstep));
mu_step = 0.01*Pmax;
lambda_step = 0.01*Rt;
thresh = 1e-10;
v = 0;
Poptimal= zeros(count_max,iter_max,floor((Mmax-Mmin)/Mstep),K);