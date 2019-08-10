R = 500;
S = 2;
BW = 180*1e3;%10*1e6;
K = 3;   
n0 = -174;%-174 ; %dbm
N0 = db2pow(n0)/1000;
Pc1 = 20; %watt
Pc  = db2pow(Pc1)/1000;
Pt = 23;
Pmax = db2pow(Pt)/1000;
Rt = 1*BW;%0.1*BW; 
r = zeros(1,K);
Mmin=20;
Mstep=2;
Mmax=20;
iter_max =1;
count_max = 1000000;
eta = zeros(count_max,iter_max,floor((Mmax-Mmin)/Mstep));
mu_step = 0.01*Pmax;
lambda_step = 0.01*Rt;
thresh = 1e-10;
v = 0;
Poptimal= zeros(count_max,iter_max,floor((Mmax-Mmin)/Mstep),K);