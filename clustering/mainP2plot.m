x = rate2;
y =eta1(:,count_max);
a1= x;
a2 = y;
for j=2:size(a1)
    for i=2:size(a2)
        
        if(a1(i-1)>a1(i))
           a1(i)=a1(i-1)+a1(i);
           a1(i-1)=a1(i)-a1(i-1);
           a1(i)=a1(i)-a1(i-1);
            a2(i)=a2(i-1)+a2(i);
           a2(i-1)=a2(i)-a2(i-1);
           a2(i)=a2(i)-a2(i-1);
        end
    end
end
% j=1;
%     for i=1:30
%         if  10^4 < a1(i) && a1(i)< 1535417 && a2(i)< 2.7*1e7
%            a1(i) =[];
%            a2(i)=[];\
%         else
%             
%             b1(j)=a1(i);
%             b2(j)=a2(i);
%             j = j+1;
%         end
%     end
%     b2(12)=0;
%      b2(4)=b2(4);
%      
%      b2(6)=b2(6);
plot(a1,a2,'-*r')    
