clc 
clear
close all
%% Initializing
run var1
warning('off')
%%
for counter= 1:counter_max
    numb = 1;
    for Mt = Mt_min :Mt_step:Mt_max
        eta0 = 0;
        Ms = Mt;
        p_max =p_max_tot;
        clear q
        q = abs(randn(S,Ms))*sqrt(var_q);
        %%
        ro = 0.1;
        qhi = eye(Ms);
        vars = {'h','G','G_hat','gg1','w2','ww2','W','gg','m','A','x'};
        clear (vars{:})
        h = zeros(Ms,U,S);
        G= zeros(S,Ms,U);
        G_hat=zeros(S,Ms,U);
         W =zeros(S,Ms,U);
        for i=1:S
            h(:,:,i) = abs(randn(Ms,U))*1e-3;
            G(i,:,:) = qhi*h(:,:,i); 
            x = abs(randn(1,Ms,U));
            G_hat(i,:,:) = G(i,:,:)+ sqrt(err).*x;
            gg =  G_hat(i,:,:);
            A = permute(gg,[3,2,1]);
            gg1 = permute(gg,[2,3,1]);
            m = (A*gg1+ro*eye(U));
            W(i,:,:)= gg1/m;
        end
        %%
        for k =1:Lmax
            cvx_begin
               variable pOpt(S,U)
               [error, R, R1, P1, Prrh, CP] = etta_fin( pOpt, eta0, Ms,  S, U, err, q,G_hat,W);
               maximize error
               subject to
                 Prrh(:,:) <= p_max
                 pOpt(:,:) > 0 
                 R(:,:) > Rate_min  
                 CP(:,:)<2000
            cvx_end

            for i=1:S
                for j=1:Ms
                    Cr(i,j,k,counter,numb) = log(Prrh(i,j)/q(i,j));
                end
            end

            eta0 = R1/P1;
            R_s(:,:,k,counter,numb) =R;
            R1_s(k,counter,numb) =R1;
            p_s(k,counter,numb) =P1;
            pr_s(1:S,1:Ms,k,counter,numb)=Prrh ;  
            eta_sum(k,counter,numb)= eta0;
            etaSum(counter,numb)= eta0;
            %eta0
            %counter
            Ms
            k
            counter
            if abs(error) < toler
                break
            end
            end
        numb = numb +1;
    end
end
plot (Mt_min :Mt_step:Mt_max,mean(etaSum,1),'-*r')
