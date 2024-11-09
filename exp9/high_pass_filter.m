
clc;
clear all;
close all;
wc=0.5*pi;
N=input('enter the order of the filter: ');
alpha=(N-1)/2;
eps=0.001;
n=0:1:N-1;
hd=(sin(pi*(n-alpha+eps))-sin(wc*(n-alpha+eps)))./(pi*(n-alpha+eps));
wr=boxcar(N);
w1=hamming(N);
w2=hanning(N);

hn=hd.*wr';
h1=hd.*w1';
h2=hd.*w2';
w=0:0.01:pi;

h=freqz(hn,1,w);
h1=freqz(h1,1,w);
h2=freqz(h2,1,w);

subplot(231);
plot(w/pi, 10*log10(abs(h)));
title('low pass filter using rectangular window');
xlabel('normalized frequency');
ylabel('Magnitude in dB');
subplot(234);
stem(wr);
title('Rectangular Window sequence');
xlabel('No. of samples');
ylabel('Amplitude');

subplot(232);
plot(w/pi, 10*log10(abs(h1)));
title('low pass filter using Hamming window');
xlabel('normalized frequency');
ylabel('Magnitude in dB');
subplot(235);
stem(w1);
title('Hamming Window sequence');
xlabel('No. of samples');
ylabel('Amplitude');

subplot(233);
plot(w/pi, 10*log10(abs(h2)));
title('low pass filter using Hanning window');
xlabel('normalized frequency');
ylabel('Magnitude in dB');
subplot(236);
stem(w2);
title('Hanning Window sequence');
xlabel('No. of samples');
ylabel('Amplitude');

