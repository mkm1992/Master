mu_step = 0.1*Pmax/sqrt(count);
ku_step = .1*Cmax/sqrt(count);
lambda_step = 0.1*Rt/sqrt(count);
for ki=1:K
    lambda(ki)= max(0,lambda(ki) - lambda_step* (r(ki) - Rt));

end

for mi=1:M
   Prrh(mi) = norm(v(mi,:)* ((pOpt').^0.5))^2+var_q;
   Crrh(mi) = log2(Prrh(mi)/var_q);
   mu(mi)= max(0,mu(mi) -mu_step* (Pmax -Prrh(mi)));
   ku(mi)= max(0,ku(mi) -ku_step* (Cmax - Crrh(mi)));
end