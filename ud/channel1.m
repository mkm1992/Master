G2 = zeros(M,K);
for s= 1:S2
    for i=1:M
        for j=1:K
           d(i,j,s)= randi(R,1,1);
           if d(i,j,s)==0
               d(i,j,s) = randi(R,1,1);
           end
           var_fading = db2pow(10);
           ke = lognrnd(0,var_fading);
           loss(i,j,s) = ke*1/(d(i,j,s)^3.8);
           G2(i,j,s) = (loss(i,j,s)^0.5)/sqrt(2)*(randn(1)+1i*randn(1));
        end
    end
end

    for i=1:M*(S2)
        for j=1:K*(S2)
           dd(i,j)= randi(R,1,1)+500;
           if dd(i,j)==0
               dd(i,j) = randi(R,1,1)+500;
           end
           var_fading = db2pow(10);
           ke = lognrnd(0,var_fading);
           loss1(i,j) = ke*1/(dd(i,j)^3.8);
           H2(i,j) = (loss1(i,j)^0.5)/sqrt(2)*(randn(1)+1i*randn(1));
        end
    end

    for s=1:S2
       H2(M*(s-1)+1:M*s,K*(s-1)+1:K*s)= G2(:,:,s);
    end