x_base = 0;
y_base = 0;
teta_ue = randi(360,1,K);
r_ue = randi(R,1,K);
x_ue = zeros(1,K);
y_ue = zeros(1,K);
for i=1:K
    x_ue(i) = r_ue(i)*cos(teta_ue(i));
    y_ue (i)= r_ue(i)*sin(teta_ue(i));
end

d_ue = zeros(1,K);
beta = zeros(1,K); 
for i=1:K
   ke = lognrnd(0,var_fading);
   d_ue(i)= sqrt((x_ue(i)-x_base)^2+ (y_ue(i)-y_base)^2);
   beta(i)= ke*phi/(d_ue(i)^alpha);
end
H = normrnd(0,1,[M,K])+1i*normrnd(0,1,[M,K]);
D = diag(beta);
G = H*(D^0.5);
