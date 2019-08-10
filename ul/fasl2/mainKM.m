clc
clear all
close all
run variable

    counterM =1;
    for M=Mmin:Mstep:Mmax
       counterK=1;
       sigma_q = 1e-8;
       for K1=Kmin:Kstep:Kmax
           sigma_q = sigma_q*10000;
        for iter =1:iter_max 
        lambda= ones(1,K)*Rt;
        mu = ones(1,K)*Pmax/100;
        kr = ones(1,M)*Cmax/1;
        run chGain
        run precoding
        pOpt = ones(1,K)*Pmax/10;
        
        Intf = zeros(1,K);
        q =0;
        for count =1:count_max
            run InterFerence
            for k=1:K
                pOpt(k) = max(0,((BW*(1+lambda(k))-sum(kr))/0.693/(q+ mu(k))));
                if pOpt(k) > Pmax
                    pOpt(k) = Pmax;
                end
            end
            run InterFerence
            run rate
            run update_var
            %Poptimal(count,iter,counterM,counterK,:) =pOpt;
            pOpt1 = pOpt.^0.5;
           
            eta(count,iter,counterM,counterK) = sum(r)/(sum(pOpt)+Pc);
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
            K
            M
            iter
        
        end
        end
        counterK = counterK+1;
       end
       counterM = counterM+1;
      end  


ettta = mean(eta,2);
eta1 = permute(ettta,[3,1,4,2]);
%plot(1:count_max, eta1 ,'-* b')
figure;
plot(Mmin:Mstep:Mmax,eta1(:,count_max,1),'-*r')
 hold on
plot(Mmin:Mstep:Mmax,eta1(:,count_max,2),'-*k')
% plot(Kmin:Kstep:Kmax,eta1(:,count_max,3),'-*b')
eta1(:,count_max)