R = 500;
S1=2;
S2=2;
S=S1+S2;
BW = 120*1e3;  
n0 = -174;%-174 ; %dbm
N0 = db2pow(n0)/1000;
Pc1 = 10; %watt
Pc  = db2pow(Pc1)/1000;
Pt = 10;
Pmax = db2pow(Pt)/1000;
Rt = .1*BW;%0.1*BW; 
Ut = 3;
K = Ut;
r = zeros(1,K);
%%
M = 20;
Mmin=2;
Mstep=2;
Mmax=20;

%%
iter_max =100;
count_max = 20;
thresh = 1e-10;
var_q1=1e-4;
var_q2 = 1e-2;
Cmax1= 5;
Cmax2 = 20;
%%
eta = zeros(count_max,iter_max,floor((Mmax-Mmin)/Mstep)+1);
Poptimal= zeros(count_max,iter_max,floor((Mmax-Mmin)/Mstep)+1,K, S);
%%
% Umin =2;
% Umax = 20;
% Ustep = 2;
% Smin=1;
% Sstep=1;
% Smax=10;
% Pmin=1;
% Pstep=1;
% Pmmax=30;
% Pmm=10^-15;
%Us = floor((Ut_max-Ut_min)/Ut_step)+1;
%rrate= zeros(count_max,iter_max,floor((Mmax-Mmin)/Mstep)+1);
%eta = zeros(count_max,iter_max,floor((Pmmax-Pmin)/Pstep)+1);
%rrate= zeros(count_max,iter_max,floor((Pmmax-Pmin)/Pstep)+1);
%eta = zeros(count_max,iter_max,floor((Umax-Umin)/Ustep)+1);
%Poptimal= zeros(count_max,iter_max,floor((Umax-Umin)/Ustep)+1,K, S);
%Ropt = zeros(count_max,iter_max, floor((Mmax-Mmin)/Mstep)+1,K, S);
%Copt = zeros(count_max,iter_max, floor((Mmax-Mmin)/Mstep)+1,K, S);