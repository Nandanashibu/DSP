clc;  % Clear the command window
clear all;  % Clear all variables
close all;  % Close all figure windows

% Input the sequences
x = input("Enter the first sequence: "); 
h = input("Enter the second sequence: ");

% Calculate the lengths of the sequences
lx = length(x); 
lh = length(h); 

% Pad the shorter sequence with zeros to make both sequences the same length
if lx > lh
    h = [h zeros(1, lx - lh)]; 
else
    x = [x zeros(1, lh - lx)];
end

% Input scaling factors 'a' and 'b'
a = input("Enter the value of 'a': "); 
b = input("Enter the value of 'b': ");

% Compute the left-hand side (LHS) and right-hand side (RHS) of the linearity property
lhs = fft((a * x) + (b * h));  % FFT of the linear combination of sequences
rhs = a * fft(x) + b * fft(h);  % Linear combination of the FFTs

% Display results
disp('LHS:');
disp(lhs);
disp('RHS:');
disp(rhs);

% Verify if the linearity property holds
if isequal(lhs, rhs)
    disp('Linearity property verified');
else
    disp('Linearity property not verified');
end
