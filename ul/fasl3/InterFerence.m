Intf = zeros(K,S);
Intf1 = zeros(K,S);
for s = 1:S
    for k=K*(s-1)+1:K*s
       Intf(k,s) = 0;
       Intf1(k,s) = 0;
       for kk=K*(s-1)+1:K*s
           if kk ~=k
             Intf(k-(s-1)*K,s) = Intf(k-(s-1)*K,s)+ pOpt(kk-(s-1)*K,s)*abs((v(M*(s-1)+1:M*s,k)')*H(M*(s-1)+1:M*s,kk))^2;
             Intf1(k-(s-1)*K,s) = Intf1(k-(s-1)*K,s)+ Pmax*abs((v(M*(s-1)+1:M*s,k)')*H(M*(s-1)+1:M*s,kk))^2;
           end
       end
       
       for ss =1:S
           for kk=K*(ss-1)+1:K*ss
            if ss~=s
             Intf(k-(s-1)*K,s) = Intf(k-(s-1)*K,s)+ pOpt(kk-(ss-1)*K,ss)*abs((v(M*(s-1)+1:M*s,k)')*H(M*(s-1)+1:M*s,kk))^2;
             Intf1(k-(s-1)*K,s) = Intf1(k-(s-1)*K,s)+ Pmax*abs((v(M*(s-1)+1:M*s,k)')*H(M*(s-1)+1:M*s,kk))^2; 
            end
           end
       end
       Intf1(k-(s-1)*K,s) = Intf1(k-(s-1)*K,s) + (var_q+BW*N0)* (norm(v(M*(s-1)+1:M*s,k) ) )^2;
       Intf(k-(s-1)*K,s) = Intf(k-(s-1)*K,s) + (var_q+BW*N0)* (norm(v(M*(s-1)+1:M*s,k) ) )^2;
    end
end
