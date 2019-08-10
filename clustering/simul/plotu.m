a = [1.302 2.046 2.436 2.803 3.062 3.199 3.381 3.492 3.572 3.39]*1e8;
b =[1.509 2.312 3.22 3.813 4.016 4.506 4.826 5.025 5.469 5.706]*1e7;
plot(2:2:20,a,'-* r')
hold on
plot(2:2:20,b,'-o b')
  xlabel('Number of UEs per Cluster')
  ylabel('EE (bit/J)')
  legend('\sigma_q = 1e-6 ', '\sigma_q = 1e-4')
  title('EE vs. Number of UEs per Cluster')