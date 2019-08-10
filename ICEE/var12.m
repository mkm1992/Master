%Ms = 36;
S = 4;
U = 8;
BW = 1e7 ;
fc = 2*1e9; 
N0 = -174 ; % dbm
n0 = db2pow(N0)/1000;
Pmax = 23; % dbm
p_max_tot = db2pow(Pmax)/1000;
ro = 0.1;
Rate_min = 1e4;
toler = 0.001*Rate_min;
err = 0.01;
var_q = 1e-8;   % var_q = 1e-4;
%%
Mt_min =30;
Mt_max = 30;
Mt_step = 20;
Ut_min =1;
Ut_max = 10;
Ut_step = 2;
U = floor((Ut_max-Ut_min)/Ut_step)+1;
%%
Lmax =20;
counter_max = 30;  %counter_max = 30;

%%
num_iter = zeros(counter_max,floor((Mt_max-Mt_min)/Mt_step)+1);
eta_sum = zeros(Lmax,counter_max,U);
R_s =zeros(S,U,Lmax,counter_max,floor((Mt_max-Mt_min)/Mt_step)+1);
R1_s =zeros(Lmax,counter_max,floor((Mt_max-Mt_min)/Mt_step)+1);
p_s =zeros(Lmax,counter_max,floor((Mt_max-Mt_min)/Mt_step)+1);
pr_s =zeros(S,Mt_max,Lmax,counter_max,floor((Mt_max-Mt_min)/Mt_step)+1);
 Cr= zeros(S,Mt_max,Lmax,counter_max,floor((Mt_max-Mt_min)/Mt_step)+1);
 etaSum=zeros(counter_max,U);