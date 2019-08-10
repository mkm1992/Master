mu_step = 0.01*Pmax/sqrt(count);
ku_step = 1*Cmax/sqrt(count);
lambda_step = 0.1*Rt/sqrt(count);
for s=1:S
    for ki=1:K
        lambda(ki,s)= max(0,lambda(ki,s) - lambda_step* (r(ki,s) - Rt));
         mu(ki,s)= max(0,mu(ki,s) -mu_step* (Pmax -pOpt(ki,s)));
    end
end
for s=1:S
    for mm=1:M
        Prrh(mm,s) =0;
        for k=1:K
            Prrh(mm,s)= Prrh(mm,s)+pOpt(k,s)*abs(H(M*(s-1)+mm,K*(s-1)+k))^2;
        end
        for ss=1:S
            if ss ~= s
                for k=1:K
                  Prrh(mm,s)= Prrh(mm,s)+pOpt(k,ss)*abs(H(M*(s-1)+mm,K*(ss-1)+k))^2;
                end
            end
        end
        Prrh(mm,s)= BW*N0 + Prrh(mm,s);
        Crrh(mm,s) = log2((1+Prrh(mm,s))/var_q);
         ku(mm,s)= max(0,ku(mm,s) -ku_step* (Cmax - Crrh(mm,s)));
    end
end