R = 500;
BW = 120*1e3;
K =2;   
n0 = -174;%-174 ; %dbm
N0 = db2pow(n0)/1000;
Pc = 0.01; %watt
Pt = 10;
Pmax = db2pow(Pt)/1000;
Rt = 6*BW;%0.1*BW; 
r = zeros(1,K);
sigma_q = 1e-6;
M = 40;
Mmin=10;
Mstep=1;
Mmax=20;
Kmin=1;
Kstep=1;
Kmax=2;
Cmax = 5;
iter_max =100;
count_max = 50;
eta = zeros(count_max,iter_max,floor((Mmax-Mmin)/Mstep), floor((Kmax-Kmin)/Kstep));
mu_step = 0.01*Pmax;
lambda_step = 0.01*Rt;
thresh = 1e-10;
v = 0;
Poptimal= zeros(count_max,iter_max,floor((Mmax-Mmin)/Mstep),K, floor((Kmax-Kmin)/Kstep));