for s=1:S2
 for i=1:K
   r2(i,s) = BW* log2( 1+ pOpt2(i,s) * (abs( (v2(M*(s-1)+1:M*s,i+K*(s-1))')*H2(M*(s-1)+1:M*s,i+K*(s-1)) )^2 ) /...
       ( Intf22(i,s) ) );
   gamma2(i,s)= pOpt2(i,s) * (abs( (v2(M*(s-1)+1:M*s,i+K*(s-1))')*H2(M*(s-1)+1:M*s,i+K*(s-1)) )^2 ) / ( Intf22(i,s) );
    if r2<0
        r2 =0;
    end
    
 end
end
%BW*(N0+var_q)*(norm(v(M*(s-1)+1:M*s,i+K*(s-1))))^2 +