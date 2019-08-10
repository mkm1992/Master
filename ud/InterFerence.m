Intf1 = zeros(K,S1);
Intf11 = zeros(K,S1);
for s = 1:S1
    for k=K*(s-1)+1:K*s
       Intf1(k,s) = 0;
       Intf11(k,s) = 0;
       for kk=K*(s-1)+1:K*s
           if kk ~=k
             Intf1(k-(s-1)*K,s) = Intf1(k-(s-1)*K,s)+ pOpt1(kk-(s-1)*K,s)*abs((v1(M*(s-1)+1:M*s,kk)')*H1(M*(s-1)+1:M*s,k))^2;
             Intf11(k-(s-1)*K,s) = Intf11(k-(s-1)*K,s)+ Pmax*abs((v1(M*(s-1)+1:M*s,kk)')*H1(M*(s-1)+1:M*s,k))^2;
           end
       end
       
       for ss =1:S1
           for kk=K*(ss-1)+1:K*ss
            if ss~=s
             Intf1(k-(s-1)*K,s) = Intf1(k-(s-1)*K,s)+ pOpt1(kk-(ss-1)*K,ss)*abs((v1(M*(ss-1)+1:M*ss,kk)')*H1(M*(ss-1)+1:M*ss,k))^2;
             Intf11(k-(s-1)*K,s) = Intf11(k-(s-1)*K,s)+ Pmax*abs((v1(M*(ss-1)+1:M*ss,kk)')*H1(M*(ss-1)+1:M*ss,k))^2; 
            end
           end
       end
       Intf11(k-(s-1)*K,s) = Intf11(k-(s-1)*K,s) + var_q1* (norm(H1(:,k) ) )^2;
       Intf1(k-(s-1)*K,s) = Intf1(k-(s-1)*K,s) + var_q1* (norm(H1(:,k) ) )^2;
       
       for t=1:S2
            for L=K*(t-1)+1:K*t
                    bb =  randi(R,1,K)+500;
                    var_fading = db2pow(10);
                    ke = lognrnd(0,var_fading);
                    lo = ke*1./(bb.^3.8);
                     b1 = (lo.^0.5)/sqrt(2)*(randn(1)+1i*randn(1));
                    Intf11(k-(s-1)*K,s) = Intf11(k-(s-1)*K,s) + pOpt2(L-(t-1)*K,t)* (norm(b1 ) )^2;
                    Intf1(k-(s-1)*K,s) = Intf1(k-(s-1)*K,s) + pOpt2(L-(t-1)*K,t)* (norm(b1 ) )^2;
            end
       end
       
    end
end

