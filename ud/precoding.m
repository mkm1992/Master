v1 = zeros(M*S,K*S);
% for i=1:K
%     g = G(:,i);
%     v(:,i) = conj(g)/norm(g);
% end
ro = 0;
v1 = H1*(H1'*H1+ro*eye(K*S1))^(-1);
v1(:,:) = v1(:,:)/norm(v1(:,:));
