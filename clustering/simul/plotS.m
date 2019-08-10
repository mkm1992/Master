 a110=load('M110.mat');
 plot(Smin:Sstep:Smax,a110.eta1(:,count_max),'-*r')
 hold on
% a80=load('M80.mat');
 plot(Smin:Sstep:Smax,eta1(:,count_max),'-*k')
 hold on
 a50=load('M50.mat');
  plot(Smin:Sstep:Smax,a50.ans,'-*b')
  xlabel('Number of Clusters')
  ylabel('EE (bit/J)')
  legend('110 RRHs per Cluster ', '80 RRHs per Cluster', '50 RRHs per Cluster')
  title('EE vs. Number of Clusters')