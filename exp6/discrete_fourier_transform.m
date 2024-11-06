% Clear workspace, command window, and close figures
clc;
clear;
close all;

% Input sequence and N-point DFT length
x = input("Enter sequence: "); 
N = input("Enter the N-point DFT length: ");

% Zero-padding if length of x is less than N
x = [x zeros(1, N - length(x))];

% Manual DFT computation
X = zeros(1, N);  % Initialize result array
for k = 0:N-1
    for n = 0:N-1
        X(k+1) = X(k+1) + x(n+1) * exp(-1j * 2 * pi * n * k / N);
    end
end

% Display computed DFT
disp('Computed DFT (X):');
disp(X);

% Display rounded DFT values
disp('Rounded DFT (round(X)):');
disp(round(X));

% Verification with MATLAB's FFT function
disp('FFT using MATLAB fft(x):');
disp(fft(x));

% Magnitude and phase of DFT
magX = abs(X);
phaseX = angle(X);

% Frequency axis
k = 0:N-1;

% Plot magnitude and phase
figure;

% Magnitude plot
subplot(2,1,1);
stem(k, magX, 'filled');  % Stem plot for magnitude
hold on;
plot(k, magX, 'r');       % Line plot for smoother visualization
title('Magnitude Plot');
xlabel('Frequency index (k)');
ylabel('Magnitude');
grid on;

% Phase plot
subplot(2,1,2);
stem(k, phaseX, 'filled');  % Stem plot for phase
hold on;
plot(k, phaseX, 'r');       % Line plot for smoother visualization
title('Phase Plot');
xlabel('Frequency index (k)');
ylabel('Phase (radians)');
grid on;
