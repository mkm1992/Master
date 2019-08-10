for i=1:K
    g = G(:,i);
    v(:,i) = g/norm(g);
end
