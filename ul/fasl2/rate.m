for i=1:K
   r(i) = BW* log2( 1+ pOpt(i) * (abs( (v(:,i)')*G(:,i) )^2 ) / ( BW*N0+Intf(i) ) );
   gamma(i)= pOpt(i) * (abs( (v(:,i)')*G(:,i) )^2 ) / ( norm(v(:,i))^2*(BW*N0+sigma_q)+Intf(i) );
    if r<0
        r =0;
    end
    
end
