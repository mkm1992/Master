clc
clear all
close all
run var

    counterM =1;
    for S=Smin:Sstep:Smax
       for iter =1:iter_max 
        
        lambda= ones(K,S)*Rt/1;
        mu = ones(M,S)*Pmax/100;
        ku = ones(M,S)*Cmax/10;
        run channel
        run precoding
        pOpt = ones(K,S)*Pmax/10;
        Intf = zeros(K,S);
        q =0;
        for count =1:count_max
            run InterFerence
            for s=1:S
                for k=1:K
                    temp =0;
                    xe = 0;
                    for m=1:M
                        temp = temp +mu(m,s)*abs(v(m+M*(s-1),k+K*(s-1)))^2;
                        xe = xe+ ku(m,s)/0.693 *abs(v(m+M*(s-1),k+K*(s-1)))^2 / (Pmax);
                    end
                    ze= q*(norm(v(M*(s-1)+1:M*s,k+K*(s-1))))^2 +temp;

                    pOpt(k,s) = max(0,(BW*(1+lambda(k,s))/0.693/(ze+xe))-( Intf1(k,s)+BW*N0)/...
                        (norm(((v(M*(s-1)+1:M*s,k))'*H(M*(s-1)+1:M*s,k+K*(s-1)))^2)) );
                    if pOpt(k,s) > Pmax
                        pOpt(k,s) = Pmax;
                    end
                end
            end
            run InterFerence
            run rate
            
           % Poptimal(count,iter,counterM,:,:) =pOpt;
            pOpt1 = pOpt.^0.5;
            for s=1:S
                for mm=1:M
                    Prrh(mm,s) = abs(norm(v(mm+M*(s-1),K*(s-1)+1:K*s)*(pOpt1(:,s)))^2)+var_q;
                    Crrh(mm,s) = log2(Prrh(mm,s)/var_q);
                end
            end
            run update_var
            eta(count,iter,counterM) = sum(sum(r))/(sum(sum(Prrh))+Pc);
            q = eta(count,iter,counterM);
            count
            S
            iter
            if count >1 && eta(count,iter,counterM)== eta(count-1,iter,counterM) 
                eta(count_max,iter,counterM)= eta(count,iter,counterM); 
               % break
            end
        end
        
       end
    counterM = counterM+1;
    eta(count_max,iter,counterM-1)= (eta(count_max,iter,counterM-1)+eta(count_max-1,iter,counterM-1))/2;
end
ettta = mean(eta(:,:,:),2);
eta1 = permute(ettta,[3,1,2]);
plot(1:count_max, eta1 ,'-* b')
figure;
plot(Smin:Sstep:Smax,eta1(:,count_max),'-*r')
eta1(:,count_max)