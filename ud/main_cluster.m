clc
clear all
close all
run var

counterM =1;
for Cmax=Mmin:Mstep:Mmax
         for iter =1:iter_max
        lambda= ones(K,S)*Rt/100;
        mu = ones(K,S)*Pmax/10;
        ku = ones(M,S)*Cmax/10000;
        run channel
        run precoding
        pOpt = ones(K,S)*Pmax/10;
        Intf = zeros(K,S);
        q =0;
        for count =1:count_max
            run InterFerence
            for s=1:S
                for k=1:K
                    temp = ku(:,s);
                    pOpt(k,s) = max(1e-8,(BW*(1+lambda(k,s)-sum(temp))/0.693/(mu(k,s)+ q)));
                    if pOpt(k,s) > Pmax
                        pOpt(k,s) = Pmax;
                    end
                end
            end
            run InterFerence
            run rate
            
            %Poptimal(count,iter,counterM,:,:) =pOpt;
            pOpt1 = pOpt.^0.5;
            for s=1:S
                for mm=1:M
                    Prrh(mm,s) =0;
                    for k=1:K
                        Prrh(mm,s)= Prrh(mm,s)+pOpt(k,s)*abs(H(M*(s-1)+mm,K*(s-1)+k))^2;
                    end
                    for ss=1:S
                        if ss ~= s
                            for k=1:K
                              Prrh(mm,s)= Prrh(mm,s)+pOpt(k,ss)*abs(H(M*(s-1)+mm,K*(ss-1)+k))^2;
                            end
                        end
                    end
                    Prrh(mm,s)= BW*N0 + Prrh(mm,s);
                    Crrh(mm,s) = log2((1+Prrh(mm,s))/var_q);
                end
            end
            run update_var
            eta(count,iter,counterM) = sum(sum(r))/(sum(sum(pOpt))+Pc);
            rrate(count,iter,counterM) = sum(sum(r));
            q = eta(count,iter,counterM);
            count
           Cmax
            iter
            if count >1 && eta(count,iter,counterM)== eta(count-1,iter,counterM) 
                eta(count_max,iter,counterM)= eta(count,iter,counterM); 
               % break
            end
        end
     end
     counterM = counterM+1;
end

ettta = mean(eta(:,:,:),2);
eta1 = permute(ettta,[3,1,2]);
% ratte = mean(rrate(:,:,:),2);
% rate2 = permute(ratte,[3,1,2]);
plot(1:count_max, eta1 ,'-* b')
figure;
plot(Mmin:Mstep:Mmax,eta1(:,count_max),'-*r')
%rate2(:,count_max)
eta1(:,count_max)
