clc
clear all
close all
run variable
for iter =1:iter_max
    counterM =1;
    for M=Mmin:Mstep:Mmax
        run channelGain
        %run precoding
        pOpt = zeros(1,K);
        ro = ones(1,K)*Rt*15;
        omega = ones(1,1)*Pmax/10;
        If = zeros(1,K);
        q =0;
        for count =1:count_max
            for k=1:K
               pOpt(k) = max(0,BW*(1+ro(k))/((If(k)/0.693+q+omega)*0.693)); 
            end
            run update_var
            run rate
            run InterFerence
            eta(count,iter,counterM) = sum(r)/(sum(pOpt)+1*Pc);
            if (count>1 && abs(eta(count,iter)-eta(count-1,iter))/abs(eta(count-1,iter))<thresh ...
                    && sum(pOpt)<Pmax) %&& ...
                       % r>0.1*Rt)
                eta(count_max,iter) = eta(count, iter);
                count
                break
            end
            q = eta(count,iter);
            count
            M
            iter
        end
        counterM = counterM+1;
    end
end
 ettta4 = mean(eta,2);
 eta14 = permute(ettta4,[3,1,2]);
 plot(Mmin:Mstep:Mmax, eta14(:,count_max) ,'-* b')
  plot(1:count_max, eta(:,1,1) ,'-* b')