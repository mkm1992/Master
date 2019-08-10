Intf = zeros(1,K);
Intf1 = zeros(1,K);
for k=1:K
   Intf(k) = 0;
   Intf1(k) = 0;
   for kk=1:K
       if kk ~=k
         Intf(k) = Intf(k)+ pOpt(kk)*abs((v(:,kk)')*G(:,k))^2;
         Intf1(k) = Intf1(k)+ Pmax*abs((v(:,kk)')*G(:,k))^2;
       end
   end
   Intf1(k) = Intf1(k) + var_q* (norm(G(:,k) ) )^2;
   Intf(k) = Intf(k) + var_q* (norm(G(:,k) ) )^2;
end

