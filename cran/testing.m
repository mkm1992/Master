eta(count_max,:,5);
for i=1:200
    if eta(count_max,i,5)<-1e11
        disp(i)
    end
end