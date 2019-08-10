for i=1:K
   r(i) = BW* log2( 1+ pOpt(i) * (abs( (v(:,i)')*G(:,i) )^2 ) / ( BW*N0+Intf1(i) ) );
   gamma(i)= pOpt(i) * (abs( (v(:,i)')*G(:,i) )^2 ) / ( BW*N0+Intf1(i) );
    if r<0
        r =0;
    end
    
end
