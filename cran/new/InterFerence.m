for k=1:K
   for kk=1:K
       if kk ~=k
         If(k) = If(k)+ BW*(1+ro(kk))/(sum(pOpt)-pOpt(kk)+ BW*N0/beta(kk));
       end
   end
end