
x_rrh = randi(R,1,M);
y_rrh = randi(R,1,M);
for i=1:M
   x_rrh(i) = i*R/M;
   y_rrh(i) = i*R/M;
end
x_ue =randi(R,1,K);
y_ue =randi(R,1,K);
d = zeros(M,K);
loss1 = zeros(M,K);
loss = zeros(M,K);
G = zeros(M,K);
for i=1:M
    for j=1:K
       d(i,j)= sqrt((x_ue(j)-x_rrh(i))^2+ (y_ue(j)-y_rrh(i))^2);
       if d(i,j)==0
           d(i,j) = randi(R,1,1);
       end
       %loss1(i,j)= 30.6+36.7*log10(d(i,j));
       %loss(i,j)=1/db2pow(loss1(i,j));
       var_fading = db2pow(10);
       ke = lognrnd(0,var_fading);
       loss(i,j) = ke*1/(d(i,j)^3.8);
       G(i,j) = (loss(i,j)^0.5)/sqrt(2)*(randn(1)+1i*randn(1));
    end
end
