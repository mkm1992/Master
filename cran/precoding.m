v = zeros(M,K);
% for i=1:K
%     g = G(:,i);
%     v(:,i) = conj(g)/norm(g);
% end
 ro = 0.1;
 v = G*(G'*G+ro*eye(K))^(-1);
 for i=1:K
     v(:,i) = v(:,i)/norm(v(:,i));
 end