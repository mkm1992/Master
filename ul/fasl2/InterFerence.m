Intf = zeros(1,K);
Intf1 = zeros(1,K);
for k=1:K
   intf(k) = 0;
   intf1(k) = 0;
   for kk=1:K
       if kk ~=k
         Intf(k) = Intf(k)+ pOpt(kk)*abs((v(:,k)')*G(:,kk))^2;
         Intf1(k) = Intf1(k)+ Pmax*abs((v(:,k)')*G(:,kk))^2;
       end
   end
end