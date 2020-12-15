clc;
fm=input('Enter frequency of the message signal: ');
fs=input('Enter frequency of the sawtooth signal: ');
Vm=input('Enter amplitude of the message signal: ');
t=0:0.001:1;
s=sawtooth(2*pi*fs*t+pi);
m=Vm*sin(2*fm*pi*t);
n=length(s);
for i=1:n
    if(m(i)>=s(i))
        pwm(i)=1;
    else
        pwm(i)=0;
    end
end
plot(t,pwm,'-r',t,m,'--k',t,s,'--b');
grid;
title('PWM Wave');
axis([0 1 -1.5 1.5]);

