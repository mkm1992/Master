clc
clear all
close all
run variable
for iter =1:iter_max
    counterM =1;
    for Cm=Cmin:Cstep:Cmax
        lambda= ones(1,K)*Rt/10;
        mu = ones(1,M)*Pmax/10;
        ku = ones(1,M)*Cm/10;
        run chGain
        run precoding
        pOpt = ones(1,K)*Pmax/10;
        
        Intf = zeros(1,K);
        q =0;
        for count =1:count_max
            run InterFerence
            for k=1:K
                temp =0;
                xe = 0;
                for m=1:M
                    temp = temp +mu(m)*abs(v(m,k))^2;
                    xe = xe+ ku(m)/0.693 *abs(v(m,k))^2 / (Pmax);
                end
                ze= q*(norm(v(:,k)))^2 +temp;
          
                pOpt(k) = max(0,(BW*(1+lambda(k))/0.693/(ze+xe))-( Intf1(k)+BW*N0)/(norm(((v(:,k)')*G(:,k))^2)));
                if pOpt(k) > Pmax
                    pOpt(k) = Pmax;
                end
            end
            run InterFerence
            run rate
            
            Poptimal(count,iter,counterM,:) =pOpt;
            pOpt1 = pOpt.^0.5;
            for mm=1:M
                Prrh(mm) = abs(norm(v(mm,:)*pOpt1')^2)+var_q;
                Crrh(mm) = log2(Prrh(mm)/var_q);
            end
            Cf(count,iter,counterM,:) =Crrh;
            run update_var
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
%plot(1:count_max, eta1 ,'-* b')
figure;
plot(Cmin:Cstep:Cmax,eta1(:,count_max),'-*r')
eta1(:,count_max)