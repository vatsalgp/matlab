% PSK modulation
 
clc;
close all;
Tb=1;
t=0:Tb/100:Tb;
fc=2;
c=sqrt(2/Tb)*sin(2*pi*fc*t);
N=8;
m=rand(1,N);
t1=0;t2=Tb
for i=1:N
 t=[t1:.01:t2]
 if m(i)>0.5
  m(i)=1;
  m_s=ones(1,length(t));
 else
  m(i)=0;
  m_s=-1*ones(1,length(t));
 end
 message(i,:)=m_s;
 bpsk_sig(i,:)=c.*m_s;
 subplot(5,1,2);
 axis([0 N -2 2]);
 plot(t,message(i,:),'r');
 title('message signal(POLAR form)');
 xlabel('t--->');
 ylabel('m(t)');
 grid on; 
 hold on;
 subplot(5,1,4);
 plot(t,bpsk_sig(i,:));
 title('BPSK signal');
 xlabel('t--->');
 ylabel('s(t)');
 grid on; 
 hold on;
 t1=t1+1.01; 
 t2=t2+1.01;
end
hold off
subplot(5,1,1);
stem(m);
title('binary data bits');
xlabel('n--->');
ylabel('b(n)');
grid on;
subplot(5,1,3);
plot(t,c);
title('carrier signal');
xlabel('t--->');
ylabel('c(t)');
grid on;
 
% PSK Demodulation
t1=0;t2=Tb
 for i=1:N
 t=[t1:.01:t2]
 %correlator
 x=sum(c.*bpsk_sig(i,:));
 %decision device
 if x>0
  demod(i)=1;
 else
  demod(i)=0;
 end
 t1=t1+1.01;
 t2=t2+1.01;
end
%plot the demodulated data bits
subplot(5,1,5);
stem(demod);
title('demodulated data');
xlabel('n--->');
ylabel('b(n)');
grid on

