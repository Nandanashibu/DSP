clc;
clear all; close all;

% Input sequences
x = input("Enter the first sequence: ");
h = input("Enter the second sequence: ");

% Determine the length for circular convolution
N = max(length(x), length(h));

% Zero-padding the sequences to the same length
xn = [x, zeros(1, N-length(x))];
hn = [h, zeros(1, N-length(h))];

% FFT of the zero-padded sequences
Xn = fft(xn);
Hn = fft(hn);

% Circular Convolution
lhs = cconv(xn, hn, N);         % Direct circular convolution
rhs = ifft(Xn .* Hn);           % Circular convolution via frequency domain

% Display results
disp('LHS (Direct Circular Convolution):');
disp(lhs);

disp('RHS (Using FFT and IFFT):');
disp(rhs);

% Verify if both results are the same
if isequal(round(lhs, 10), round(rhs, 10))  % Comparing rounded values for numerical stability
    disp('Circular Convolution verified');
else
    disp('Circular Convolution not verified');
end
