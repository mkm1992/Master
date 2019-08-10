function [error, R, R1, P1, Prrh,CP] = etta_fin( pOpt, eta0, Ms,  S, U, err,q,G_hat,W)
Cr = cvx(0);
BW = cvx(10 * 10^6) ;
N0 = -174 ; % dbm
n0 = cvx(10^(N0/10)/1000);
Pmax = 23; % dbm
pm = (10^(Pmax/10))/1000;
p_max = pm;
R= cvx(zeros(S,U));
I1 = 0;
Pus = cvx(zeros(S,U,U));
IIu = cvx(zeros(S,U));
Iu = cvx(zeros(S,U));
for i=1:S
    for j=1:U
        Pus(i,j,j) = sqrt(pOpt(i,j));
        g1 = G_hat(i,:,j);
        w1 = W(i,:,j);
        I1 = pOpt(i,j)*abs(g1*w1').^2+I1;
        w2 = permute(W(i,:,j),[2 3 1]);
        IIu(i,j) = cvx(0);
        for ii = 1:S
            for jj = 1:U
                g12 = 0.16*G_hat(ii,:,j);
                ww2 = permute(W(ii,:,jj),[2 3 1]);
                IIu(i,j) = q(ii,jj)*(abs(g12*ww2)^2)+IIu(i,j);
                if ii ~= i
                     IIu(i,j)= p_max*(abs(g12*ww2)^2)+IIu(i,j);
                end
            end
        end
       Iu(i,j) =  p_max*sum(abs(g1*w2).^2)+IIu(i,j);
    end
end
 
for i=1:S
    for j=1:U
        g1 = G_hat(i,:,j);
        w1 = W(i,:,j);
        R(i,j)= BW*log(1+ pOpt(i,j)*abs(g1*w1')^2/(Iu(i,j) + BW*n0 ));
    end
end
%PU = cvx(zeros(S,Ms));
Prrh = cvx(zeros(S,Ms));
for i=1:S
    for j=1:Ms
        w22 = W(i,j,:);
        wrrh = permute(w22,[3,2,1]);
  %      PU = permute(Pus(i,:,:),[2,3,1]);
        Prrh (i,j)= cvx(0);
%        Prrh(i,j)= (abs(wrrh)'*PU*PU*abs(wrrh));
        for tt = 1:U
         Prrh(i,j)= (wrrh(tt).^2).*pOpt(i,tt)+Prrh(i,j);
        end
        Prrh(i,j) = q(i,j)+Prrh(i,j);
    end
end

R1 = sum(sum(R));
P1 = sum(sum(Prrh));
error =  R1 - eta0 * P1;
 for i=1:S
        for j=1:Ms
            CP(i,j) = (Prrh(i,j)/q(i,j));
        end
    end
end