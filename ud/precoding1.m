v2 = zeros(M*S,K*S);
% for i=1:K
%     g = G(:,i);
%     v(:,i) = conj(g)/norm(g);
% end
ro = 0;
v2 = H2*(H2'*H2+ro*eye(K*S2))^(-1);
v2(:,:) = v2(:,:)/norm(v2(:,:));
