for s=1:S1
 for i=1:K
   r1(i,s) = BW* log2( 1+ pOpt1(i,s) * (abs( (v1(M*(s-1)+1:M*s,i+K*(s-1))')*H1(M*(s-1)+1:M*s,i+K*(s-1)) )^2 ) /...
       ( BW*N0+Intf11(i,s) ) );
   gamma1(i,s)= pOpt1(i,s) * (abs( (v1(M*(s-1)+1:M*s,i+K*(s-1))')*H1(M*(s-1)+1:M*s,i+K*(s-1)) )^2 ) / ( BW*N0+Intf11(i,s) );
    if r1<0
        r1 =0;
    end
   
 end
end