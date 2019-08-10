Intf2 = zeros(K,S2);
Intf22 = zeros(K,S2);
for s = 1:S2
    for k=K*(s-1)+1:K*s
       Intf2(k,s) = 0;
       Intf22(k,s) = 0;
       for kk=K*(s-1)+1:K*s
           if kk ~=k
             Intf2(k-(s-1)*K,s) = Intf2(k-(s-1)*K,s)+ pOpt2(kk-(s-1)*K,s)*abs((v2(M*(s-1)+1:M*s,k)')*H2(M*(s-1)+1:M*s,kk))^2;
             Intf22(k-(s-1)*K,s) = Intf22(k-(s-1)*K,s)+ Pmax*abs((v2(M*(s-1)+1:M*s,k)')*H2(M*(s-1)+1:M*s,kk))^2;
           end
       end
       
       for ss =1:S2
           for kk=K*(ss-1)+1:K*ss
            if ss~=s
             Intf2(k-(s-1)*K,s) = Intf2(k-(s-1)*K,s)+ pOpt2(kk-(ss-1)*K,ss)*abs((v2(M*(s-1)+1:M*s,k)')*H2(M*(s-1)+1:M*s,kk))^2;
             Intf22(k-(s-1)*K,s) = Intf22(k-(s-1)*K,s)+ Pmax*abs((v2(M*(s-1)+1:M*s,k)')*H2(M*(s-1)+1:M*s,kk))^2; 
            end
           end
       end
       Intf22(k-(s-1)*K,s) = Intf22(k-(s-1)*K,s) + (var_q2+BW*N0)* (norm(v2(M*(s-1)+1:M*s,k) ) )^2;
       Intf2(k-(s-1)*K,s) = Intf2(k-(s-1)*K,s) + (var_q2+BW*N0)* (norm(v2(M*(s-1)+1:M*s,k) ) )^2;
       for t=1:S1
           for L=1:M
               ff =  randi(R,1,M)+500;
                var_fading = db2pow(10);
                ke = lognrnd(0,var_fading);
                 lo = ke*1./(ff.^3.8);
                 f1 = (lo.^0.5)/sqrt(2)*(randn(1)+1i*randn(1));
               pOpt11 = pOpt1.^0.5;
               Intf22(k-(s-1)*K,s) = Intf22(k-(s-1)*K,s) + ((norm(v2(M*(s-1)+1:M*s,k) ) )^2)*...
                   abs(norm(v1(L+M*(s-1),K*(s-1)+1:K*s)*(pOpt11(:,s)))^2);
               Intf2(k-(s-1)*K,s) = Intf2(k-(s-1)*K,s) + ((norm(v2(M*(s-1)+1:M*s,k) ) )^2)*...
                   abs(norm(v1(L+M*(s-1),K*(s-1)+1:K*s)*(pOpt11(:,s)))^2);
           end
       end
       
    end
end
