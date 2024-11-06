clc;
clear all;
close all;

% Input the sequences and block size
x = input('Enter 1st sequence (input signal): ');
h = input('Enter 2nd sequence (impulse response): ');
N = input('Enter the fragmented block size: ');

% Perform overlap-save convolution
y = ovrlsav(x, h, N);

% Display the results
disp('Using Overlap and Save method:');
disp(y);

% Verification using MATLAB's circular convolution function
disp('Verification with cconv:');
disp(cconv(x, h, length(x) + length(h) - 1));

% Overlap-Save Convolution Function
function y = ovrlsav(x, h, N)
    % Ensure block size N is greater than the length of h
    if (N < length(h))
        error('Block size N must be greater than the length of h');
    end

    % Lengths of input sequence and impulse response
    Nx = length(x);  % Length of input sequence
    M = length(h);   % Length of impulse response (filter)
    M1 = M - 1;      % Overlap length (M-1)
    L = N - M1;      % Length of the non-overlapping part

    % Zero-pad the input sequence and impulse response
    x = [zeros(1, M1), x, zeros(1, N-1)];  % Pre-pad input with M-1 zeros
    h = [h, zeros(1, N - M)];              % Zero-pad impulse response to length N

    % Number of blocks to process
    K = floor((Nx + M1 - 1) / L);  % Calculate the number of blocks

    % Initialize output matrix to store each block's result
    Y = zeros(K + 1, N);

    % Process each block
    for k = 0:K
        % Extract the current block of the input sequence
        xk = x(k * L + 1 : k * L + N);

        % Perform circular convolution with the impulse response h
        Y(k + 1, :) = cconv(xk, h, N);
    end

    % Discard the overlapped parts (first M-1 samples from each block)
    Y = Y(:, M:N)';

    % Flatten the matrix Y to form the final output sequence
    y = (Y(:))';
end
