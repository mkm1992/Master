v = zeros(M*S,K*S);
% for i=1:K
%     g = G(:,i);
%     v(:,i) = conj(g)/norm(g);
% end
ro = 0;
v = H*(H'*H+ro*eye(K*S))^(-1);
v(:,:) = v(:,:)/norm(v(:,:));
