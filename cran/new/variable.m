R = 500;
BW = 120*1e3;
%M = 128;
K = 9;   % eta=7ue , eta_diffAnten = 3ue
phi = 1;
var_fadingDB =10; %db
var_fading = db2pow(var_fadingDB);
alpha = 3.8;%pathloss 
n0 = -170 ; %dbm
N0 = db2pow(n0);
Pc = 0.01; %watt
Pt = 13;
Pmax = db2pow(Pt)/1000;
Rt = 7*BW; %bit/s
r = zeros(1,K);
%v = zeros(M,K)
Mmin=100;
Mstep=100;
Mmax=100;
iter_max = 10;
count_max = 100;
eta = zeros(count_max,iter_max,floor((Mmax-Mmin)/Mstep));
omega_step = 0.05*Pmax;
ro_step = 0.05*Rt;
thresh = 1e-2;
