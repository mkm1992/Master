mu_step = 0.1*Pmax/sqrt(count);
kr_step = 0.1*Cmax/sqrt(count);
lambda_step = 1*Rt/sqrt(count);
for ki=1:K
    lambda(ki)= max(0,lambda(ki) - lambda_step* (r(ki) - Rt));
    mu(ki)= max(0,mu(ki) -mu_step* (Pmax -pOpt(ki)));
    
end
for mi=1:M
    Crrh(mi) = 0;
    for kk=1:K
        Crrh(mi) = Crrh(mi)+pOpt(kk)*abs(G(mi,k))^2;
    end
	kr(mi)= max(0,kr(mi) -kr_step* (Cmax -Crrh(mi)));
end