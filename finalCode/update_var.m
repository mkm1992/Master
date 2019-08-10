mu_step = 0.1*Pmax/sqrt(count);
lambda_step = 1*Rt/sqrt(count);
for ki=1:K
    lambda(ki)= max(0,lambda(ki) - lambda_step* (r(ki) - Rt));

end

for mi=1:M
   tempp = norm(v(mi,:)* ((pOpt').^0.5))^2;
   mu(mi)= max(0,mu(mi) -mu_step* (Pmax -tempp));
end