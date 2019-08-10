for s=1:S
 for i=1:K
   r(i,s) = BW* log2( 1+ pOpt(i,s) * (abs( (v(M*(s-1)+1:M*s,i+K*(s-1))')*H(M*(s-1)+1:M*s,i+K*(s-1)) )^2 ) /...
       ( BW*N0+Intf1(i,s) ) );
   gamma(i,s)= pOpt(i,s) * (abs( (v(M*(s-1)+1:M*s,i+K*(s-1))')*H(M*(s-1)+1:M*s,i+K*(s-1)) )^2 ) / ( BW*N0+Intf1(i,s) );
    if r<0
        r =0;
    end
    
 end
end