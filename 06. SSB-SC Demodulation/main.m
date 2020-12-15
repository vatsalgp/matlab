N=1024;
fs=2048;
ts=1/fs;
fc=600;
t=(0:N-1)/fs;
fm1=200;
vm1=1;
m=vm1*cos(2*pi*fm1*t);
mh=vm1*cos((2*pi*fm1*t)-pi/2);
usb=m.*2.*cos(2*pi*fc*t)-mh.*2.*sin(2*pi*fc*t);
lsb=m.*2.*cos(2*pi*fc*t)+mh.*2.*sin(2*pi*fc*t);
temp=usb.*cos(2*pi*fc*t);
[num,den]= butter(5,2*fc/fs);
z=filtfilt(num,den,temp)*2;
sbu=2/N*abs(fft(usb));
sb1=2/N*abs(fft(lsb));
freq=fs*(0:N/2)/N;
close all;
figure(1);
subplot(2,2,1);
plot(10*t(1:200),usb(1:200),'b');
xlabel('Time');
ylabel('Amplitude');
title('Time domain representation of USB');
axis([0 1 -2 2 ])
subplot(2,2,2);
plot(10*t(1:200),lsb(1:200),'r');
xlabel('Time');
ylabel('Amplitude');
title('Time domain representation of LSB');
axis([0 1 -2 2 ])
subplot(2,2,3);
plot(freq,sbu(1:N/2+1));
xlabel('Time');
ylabel('Amplitude');
title('Frequency domain representation of USB');
axis([0 1000 -0.1 2])
subplot(2,2,4);
plot(freq,sb1(1:N/2+1));
xlabel('Time');
ylabel('Amplitude');
title('Frequency domain representation of LSB');
axis([0 1000 -0.1 2])
figure(2);
plot(t,z);
xlabel('Time');
ylabel('Amplitude');
title('Demodulated output');
N=length(z);
z=fftshift(fft(z,N));
figure(3);
f=fs*[-N/2:1:N/2-1]/N;
plot(f,abs(z));
xlabel('DFT values');
ylabel('Absolute Frequency');
title('Demodulated SSB in Frequency Domain');

