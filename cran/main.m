clc
clear all
close all
run variable
for iter =1:iter_max
    counterM =1;
    for M=Mmin:Mstep:Mmax
        lambda= ones(1,K)*Rt;
        mu = ones(1,M)*Pmax/100;
        run chGain
        run precoding
        pOpt = ones(1,K)*Pmax/10;
        
        Intf = zeros(1,K);
        q =0;
        for count =1:count_max
            run InterFerence
            for k=1:K
                temp =0;
                for m=1:M
                    temp = temp +mu(m)*abs(v(m,k))^2;
                end
                ze= q*(norm(v(:,k)))^2 +temp;
                pOpt(k) = max(0,(BW*(1+lambda(k))/0.693/ze)-( Intf1(k)+BW*N0)/(norm(((v(:,k)')*G(:,k))^2)));
                if pOpt(k) > Pmax
                    pOpt(k) = Pmax;
                end
            end
            run InterFerence
            run rate
            run update_var
            Poptimal(count,iter,counterM,:) =pOpt;
            pOpt1 = pOpt.^0.5;
            for mm=1:M
                Prrh(mm) = norm(v(mm,:)*pOpt1')^2;
            end
            
            eta(count,iter,counterM) = sum(r)/(sum(Prrh)+Pc);
%%

% %             if (count>1 && abs(eta(count,iter)-eta(count-1,iter))/abs(eta(count-1,iter))<thresh)
% %                 
% % % %                         r(1)>0.1*Rt && r(2)>0.1*Rt && r(3)>0.1*Rt)
% %                 eta(count_max,iter,counterM) = eta(count, iter,counterM);
% % % % %                 count
% %                 break3.2
% %             end
%%
            q = eta(count,iter,counterM);
            count
            M
            iter
        end
        counterM = counterM+1;
    end
end
ettta = mean(eta,2);
eta1 = permute(ettta,[3,1,2]);
plot(1:count_max, eta1 ,'-* b')
plot(Mmin:Mstep:Mmax,eta1(:,count_max),'-*r')
eta1(:,count_max)