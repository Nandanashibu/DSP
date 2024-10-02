clc;
clear all;
close all;

% Continuous Signal
subplot(2,2,1);
t = 0:0.01:1;
f = 10;
y = sin(2*pi*f*t);
plot(t, y);
grid(true);
xlabel("Time");
ylabel("Amplitude");
title("Continuous Signal");

% Under Sampled Signal (fs = 0.5 * f)
subplot(2,2,2);
fs1 = 0.5 * f; % undersampled
t1 = 0:1/fs1:1;
y1 = sin(2*pi*f*t1);
stem(t1, y1);
hold on;
plot(t1, y1);
grid(true);
xlabel("Time");
ylabel("Amplitude");
title("Under Sampled Signal");

% Nyquist Sampled Signal (fs = 2 * f)
subplot(2,2,3);
fs2 = 2 * f; % Nyquist rate
t2 = 0:1/fs2:1;
y2 = sin(2*pi*f*t2);
stem(t2, y2);
hold on;
plot(t2, y2);
grid(true);
xlabel("Time");
ylabel("Amplitude");
legend("Discrete", "Continuous");
title("Nyquist Sampled Signal");

% Over Sampled Signal (fs = 10 * f)
subplot(2,2,4);
fs3 = 10 * f; % oversampled
t3 = 0:1/fs3:1;
y3 = sin(2*pi*f*t3);
stem(t3, y3);
hold on;
plot(t3, y3);
grid(true);
xlabel("Time");
ylabel("Amplitude");
legend("Discrete", "Continuous");
title("Over Sampled Signal");
