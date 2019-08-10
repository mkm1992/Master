R = 500;
S = 2;
BW = 120*1e3;%10*1e6;  
n0 = -174;%-174 ; %dbm
N0 = db2pow(n0)/1000;
Pc1 = 10; %watt
Pc  = db2pow(Pc1)/1000;
Pt = 23;
Pmax = db2pow(Pt)/1000;
Rt = 1*BW;%0.1*BW; 
Ut = 2;
K = Ut;
r = zeros(1,K);
%%
M = 10;
Cmin=1;
Cstep=1;
Cmmax=8;
Umin =2;
Umax = 20;
Ustep = 2;

%Us = floor((Ut_max-Ut_min)/Ut_step)+1;
%%
iter_max = 100;
count_max = 20;
thresh = 1e-10;
var_q = 1e-4;
Cmax = 5;
%%
eta = zeros(count_max,iter_max,floor((Cmmax-Cmin)/Cstep)+1);
Poptimal= zeros(count_max,iter_max,floor((Cmmax-Cmin)/Cstep)+1,K, S);
%eta = zeros(count_max,iter_max,floor((Umax-Umin)/Ustep)+1);
%Poptimal= zeros(count_max,iter_max,floor((Umax-Umin)/Ustep)+1,K, S);
%Ropt = zeros(count_max,iter_max, floor((Mmax-Mmin)/Mstep)+1,K, S);
%Copt = zeros(count_max,iter_max, floor((Mmax-Mmin)/Mstep)+1,K, S);