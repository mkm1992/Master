mu_step = 0.01*Pmax/sqrt(count);
ku_step = .1*Cmax/sqrt(count);
lambda_step = 0.01*Rt/sqrt(count);
for s=1:S
    for ki=1:K
        lambda(ki,s)= max(0,lambda(ki,s) - lambda_step* (r(ki,s) - Rt));

    end

    for mi=1:M
       Prrh(mi,s) = norm(v(mi+M*(s-1),K*(s-1)+1:K*s)* ((pOpt(:,s)).^0.5))^2+var_q;
       Crrh(mi,s) = log2(Prrh(mi,s)/var_q);
       mu(mi,s)= max(0,mu(mi,s) -mu_step* (Pmax -Prrh(mi,s)));
       ku(mi,s)= max(0,ku(mi,s) -ku_step* (Cmax - Crrh(mi,s)));
    end
end