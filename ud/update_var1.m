mu_step2 = 0.01*Pmax/sqrt(count);
ku_step2 = 1*Cmax2/sqrt(count);
lambda_step = 0.1*Rt/sqrt(count);
for s=1:S2
    for ki=1:K
        lambda2(ki,s)= max(0,lambda2(ki,s) - lambda_step* (r2(ki,s) - Rt));
         mu2(ki,s)= max(0,mu2(ki,s) -mu_step2* (Pmax -pOpt2(ki,s)));
    end
end
for s=1:S2
    for mm=1:M
        Prrh2(mm,s) =0;
        for k=1:K
            Prrh2(mm,s)= Prrh2(mm,s)+pOpt2(k,s)*abs(H2(M*(s-1)+mm,K*(s-1)+k))^2;
        end
        for ss=1:S2
            if ss ~= s
                for k=1:K
                  Prrh2(mm,s)= Prrh2(mm,s)+pOpt2(k,ss)*abs(H2(M*(s-1)+mm,K*(ss-1)+k))^2;
                end
            end
        end
        Prrh2(mm,s)= BW*N0 + Prrh2(mm,s);
        Crrh2(mm,s) = log2((1+Prrh2(mm,s))/var_q2);
         ku2(mm,s)= max(0,ku2(mm,s) -ku_step2* (Cmax2 - Crrh2(mm,s)));
    end
end