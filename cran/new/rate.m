for i=1:K
   h = H(:,i); 
   r(i) = BW* log2(1+M*beta(i)*pOpt(i)*abs(h.'*h)/(beta(i)*(sum(pOpt)-pOpt(i))+BW*N0));
end
