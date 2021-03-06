clc;
Fm=input('Enter frequency of the message signal: ');
Fc=input('Enter frequency of the carrier signal: ');
Vm=input('Enter amplitude of the message signal: ');
Vc=input('Enter amplitude of the carrier signal: ');
Fs=input('Enter sampling time Fs: ');
t=(0:1/Fs:1);
vm=Vm*cos(2*pi*Fm*t);
vc1=Vc*cos(2*pi*Fc*t);
vc2=Vc*sin(2*pi*Fc*t);
i=vm.*vc1;
q=imag(hilbert(vm)).*vc2;
x1=i+q;
x2=i-q;
 subplot(2,2,1);
plot(t,x1);
ylabel('Amplitude');
xlabel('Time');
title('Modulated Signal(LSB)');
hold on;
 N1=length(x1);
X1=fftshift(fft(x1,N1));
f1=Fs*[-N1/2:1:N1/2-1]/N1;
subplot(2,2,2);
plot(f1,abs(X1));
xlabel('Frequency');
ylabel('Amplitude');
title('Frequency Domain(LSB)');
 subplot(2,2,3);
plot(t,x2);
ylabel('Amplitude');
xlabel('time');
title('Modulated Signal(USB)');
hold on;
 N2=length(x2);
X2=fftshift(fft(x2,N2));
f2=Fs*[-N2/2:1:N2/2-1]/N2;
subplot(2,2,4);
plot(f2,abs(X2));
xlabel('Frequency');
ylabel('Amplitude');
title('Frequency Domain(USB)');

