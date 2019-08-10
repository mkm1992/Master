mu_step1 = 0.01*Pmax/sqrt(count);
ku_step1 = .1*Cmax1/sqrt(count);
lambda_step1 = 0.01*Rt/sqrt(count);
for s=1:S1
    for ki=1:K
        lambda1(ki,s)= max(0,lambda1(ki,s) - lambda_step1* (r1(ki,s) - Rt));

    end

    for mi=1:M
       Prrh1(mi,s) = norm(v1(mi+M*(s-1),K*(s-1)+1:K*s)* ((pOpt1(:,s)).^0.5))^2+var_q1;
       Crrh1(mi,s) = log2(Prrh1(mi,s)/var_q1);
       mu1(mi,s)= max(0,mu1(mi,s) -mu_step1* (Pmax -Prrh1(mi,s)));
       ku1(mi,s)= max(0,ku1(mi,s) -ku_step1* (Cmax1 - Crrh1(mi,s)));
    end
end