clc;
Fm=input('Enter frequency of the message signal: ');
Fc=input('Enter frequency of the carrier signal: ');
Vm=input('Enter amplitude of the message signal: ');
Vc=input('Enter amplitude of the carrier signal: ');
Fs=input('Enter sampling time Fs: ');
freq_dev=input('Enter the frequency deviation freq_dev: ');
t=0:1/Fs:0.08;
vm=Vm*cos(2*pi*Fm*t);
vc=Vc*cos(2*pi*Fc*t);
vfm=Vc*cos((2*pi*Fc*t)+(freq_dev/Fm)*sin(2*pi*Fm*t));
 
subplot(3,1,1);
plot(t,vm);
ylabel('Amplitude');
xlabel('time');
title('Message Signal');
hold on;
 
subplot(3,1,2);
plot(t,vc);
ylabel('Amplitude');
xlabel('time');
title('Carrier Signal');
hold on;
 
subplot(3,1,3);
plot(t,vfm);
ylabel('Amplitude');
xlabel('time');
title('Modulated Signal');
hold on;

