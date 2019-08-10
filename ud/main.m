clc
clear all
close all
run var

    counterM =1;
    for Cmax1=Mmin:Mstep:Mmax
        Cmax2 = Cmax1;
        for iter =1:iter_max
        lambda1= ones(K,S1)*Rt/1;
        mu1 = ones(M,S1)*Pmax/100;
        ku1 = ones(M,S1)*Cmax1/10;
        lambda2= ones(K,S2)*Rt/100;
        mu2 = ones(K,S2)*Pmax/10;
        ku2 = ones(M,S2)*Cmax2/10000;
        run channel
        run channel1
        run precoding
        run precoding1
        pOpt1 = ones(K,S1)*Pmax/10;
        Intf11 = zeros(K,S1);
        pOpt2 = ones(K,S2)*Pmax/10;
        Intf22 = zeros(K,S2);
        q1 =0;
        q2=0;
        for count =1:count_max
            run InterFerence
            run InterFerence1
            for s=1:S2
                for k=1:K
                    temp2 = ku2(:,s);
                    pOpt2(k,s) = max(1e-8,(BW*(1+lambda2(k,s)-sum(temp2))/0.693/(mu2(k,s)+ q2)));
                    if pOpt2(k,s) > Pmax
                        pOpt2(k,s) = Pmax;
                    end
                end
            end
             for s=1:S1
                for k=1:K
                    temp =0;
                    xe = 0;
                    for m=1:M
                        temp = temp +mu1(m,s)*abs(v1(m+M*(s-1),k+K*(s-1)))^2;
                        xe = xe+ ku1(m,s)/0.693 *abs(v1(m+M*(s-1),k+K*(s-1)))^2 / (Pmax);
                    end
                    ze= q1*(norm(v1(M*(s-1)+1:M*s,k+K*(s-1))))^2 +temp;

                    pOpt1(k,s) = max(0,(BW*(1+lambda1(k,s))/0.693/(ze+xe))-( Intf11(k,s)+BW*N0)/...
                        (norm(((v1(M*(s-1)+1:M*s,k))'*H1(M*(s-1)+1:M*s,k+K*(s-1)))^2)) );
                    if pOpt1(k,s) > Pmax
                        pOpt1(k,s) = Pmax;
                    end
                end
            end
            run InterFerence
            run rate
            run InterFerence1
            run rate1
            pOpt11 = pOpt1.^0.5;
            for s=1:S1
                for mm=1:M
                    Prrh1(mm,s) = abs(norm(v1(mm+M*(s-1),K*(s-1)+1:K*s)*(pOpt11(:,s)))^2)+var_q1;
                    Crrh1(mm,s) = log2(Prrh1(mm,s)/var_q1);
                end
            end
            %Poptimal(count,iter,counterM,:,:) =pOpt;
            pOpt22 = pOpt2.^0.5;
            for s=1:S2
                for mm=1:M
                    Prrh2(mm,s) =0;
                    for k=1:K
                        Prrh2(mm,s)= Prrh2(mm,s)+pOpt2(k,s)*abs(H2(M*(s-1)+mm,K*(s-1)+k))^2;
                    end
                    for ss=1:S2
                        if ss ~= s
                            for k=1:K
                              Prrh2(mm,s)= Prrh2(mm,s)+pOpt2(k,ss)*abs(H2(M*(s-1)+mm,K*(ss-1)+k))^2;
                            end
                        end
                    end
                    Prrh2(mm,s)= BW*N0 + Prrh2(mm,s);
                    Crrh2(mm,s) = log2((1+Prrh2(mm,s))/var_q2);
                end
            end
            run update_var
            run update_var1
            eta(count,iter,counterM) = (sum(sum(r1))+sum(sum(r2)))/(sum(sum(pOpt2))+2*Pc+sum(sum(Prrh1)));
           % rrate(count,iter,counterM) = sum(sum(r));
            q1 = sum(sum(r1))/(sum(sum(Prrh1))+Pc);
            q2 = sum(sum(r2))/(sum(sum(pOpt2))+Pc);
            count
            Cmax1
            iter
           % eta
%             if count >1 && eta(count,iter,counterM)== eta(count-1,iter,counterM) 
%                 eta(count_max,iter,counterM)= eta(count,iter,counterM); 
%                % break
%             end
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
