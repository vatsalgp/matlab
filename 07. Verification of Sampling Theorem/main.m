clc; 
close all;  
t=0.05;
ts=0:0.00005:t; 
fs=input('Enter sampling frequency : '); 
x=cos(2*pi*fs*ts); 
subplot(2,2,1); 
plot(ts,x); 
xlabel('time'); 
ylabel('amplitude'); 
title('Message Signal'); 
f1=1.5*fs; 
t1=0:1/f1:t; 
x1=cos(2*pi*fs*t1); 
subplot(2,2,2); 
plot(ts,x,'r'); 
hold on; 
stem(t1,x1); 
hold off; 
xlabel('Time'); 
ylabel('Amplitude'); 
title('Under Sampling'); 
f2=2*fs; 
t2=0:1/f2:t; 
x2=cos(2*pi*fs*t2); 
subplot(2,2,3); 
plot(ts,x,'r'); 
hold on; 
stem(t2,x2); 
hold off; 
xlabel('time'); 
ylabel('Amplitude'); 
title('Sampling'); 
f3=4.5*fs; 
t3=0:1/f3:t; 
x3=cos(2*pi*fs*t3); 
subplot(2,2,4); 
plot(ts,x,'r'); 
hold on; 
stem(t3,x3); 
hold off; 
xlabel('Time'); 
ylabel('Amplitude'); 
title('Oversampling'); 

