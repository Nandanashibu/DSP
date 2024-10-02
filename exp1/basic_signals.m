clc;
clear all;
close all;

% Subplot 1: Unit Impulse Signal
subplot(3,3,1);
t = -5:1:5;
y = [zeros(1,5),ones(1,1),zeros(1,5)]; % Unit Impulse
stem(t,y, 'filled'); % Discrete Plot
xlabel("Time (s)");
ylabel("Amplitude");
title("Unit Impulse Signal");

% Subplot 2: Bipolar Pulse Signal
subplot(3,3,2);
t2 = 0:0.01:1;
f = 5;
y2 = square(2*pi*f*t2); % Bipolar Pulse Signal
stem(t2,y2); % Discrete Plot
hold on;
plot(t2,y2); % Continuous Plot
xlabel("Time (s)");
ylabel("Amplitude");
title("Bipolar Pulse Signal");
legend("Discrete","Continuous");

% Subplot 3: Unipolar Pulse Signal
subplot(3,3,3);
t3 = 0:0.01:1;
f = 5;
y3 = abs(square(2*pi*f*t3)); % Unipolar Pulse
stem(t3,y3); % Discrete Plot
hold on;
plot(t3,y3); % Continuous Plot
xlabel("Time (s)");
ylabel("Amplitude");
title("Unipolar Pulse Signal");
legend("Discrete","Continuous");

% Subplot 4: Unit Ramp Signal
subplot(3,3,4);
t4 = -5:1:5;
y4 = t4 .* (t4>=0); % Unit Ramp Signal
stem(t4,y4, 'filled'); % Discrete Plot
hold on;
plot(t4,y4); % Continuous Plot
xlabel("Time (s)");
ylabel("Amplitude");
title("Unit Ramp Signal");
legend("Discrete","Continuous");

% Subplot 5: Triangular Signal
subplot(3,3,5);
t5 = 0:0.025:1;
f = 10;
y5 = sawtooth(2*pi*f*t5, 0.5); % Triangular Signal
stem(t5,y5); % Discrete Plot
hold on;
plot(t5,y5); % Continuous Plot
xlabel("Time (s)");
ylabel("Amplitude");
title("Triangular Signal");
legend("Discrete","Continuous");

% Subplot 6: Sine Wave
subplot(3,3,6);
t6 = 0:0.001:1;
f = 10;
y6 = sin(2*pi*f*t6); % Sine Wave
stem(t6,y6); % Discrete Plot
hold on;
plot(t6,y6); % Continuous Plot
xlabel("Time (s)");
ylabel("Amplitude");
title("Sine Wave");
legend("Discrete","Continuous");

% Subplot 7: Cosine Wave
subplot(3,3,7);
t7 = 0:0.001:1;
f = 10;
y7 = cos(2*pi*f*t7); % Cosine Wave
stem(t7,y7); % Discrete Plot
hold on;
plot(t7,y7); % Continuous Plot
xlabel("Time (s)");
ylabel("Amplitude");
title("Cosine Wave");
legend("Discrete","Continuous");

% Subplot 8: Exponential Signal
subplot(3,3,8);
t8 = -5:1:5;
y8 = exp(t8); % Exponential Signal
stem(t8,y8, 'filled'); % Discrete Plot
hold on;
plot(t8,y8); % Continuous Plot
xlabel("Time (s)");
ylabel("Amplitude");
title("Exponential Signal");
legend("Discrete","Continuous");

% Subplot 9: Unit Step Signal
subplot(3,3,9);
t9 = -5:1:5;
y9 = [zeros(1,5),ones(1,6)]; % Unit Step Signal
stem(t9,y9, 'filled'); % Discrete Plot
xlabel("Time (s)");
ylabel("Amplitude");
title("Unit Step Signal");
