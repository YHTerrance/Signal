N = 501;
N1 = (N - 1) / 2;
T = 50;
Ts = T / N1;
n = [-N1:N1];
k = [-N1:N1];

%(a)

x = sin(n .* pi * Ts) ./ (n .* pi * Ts);
x((N - 1) / 2 + 1) = 1;
%at (n,x) = (0, 0) the limit exists as sin(0) / 0, but the program
%considers it as NaN because it saw it as 0 / 0
subplot(3,2,1); plot(n, x);
title('(a)')
xlabel('n')
ylabel('x[n]')

%(b)

X = fft(x);
X = fftshift(X);
f = 2 .* pi .* k ./ N;
subplot(3,2,2); plot(f, abs(X));
title('(b)')
xlabel('frequency w');
ylabel('|X_k|');

%(c)

n2 = 1:1:N;
k2 = 1:1:N;
w_n = exp(-1j * 2 * pi / N);
nk = (n2 - 1)' * (k2 - 1);
w_nnk = w_n .^ nk;
X2 = x * w_nnk;
X2_end = X2((N - 1) / 2 + 2:end);
X2_start = X2(1:(N - 1) / 2 + 1);
X2 = cat(2, X2_end, X2_start);
f = 2 .* pi .* k ./ N;
subplot(3, 2, 3); plot(f, abs(X2));
title('(c)')
xlabel('frequency w');
ylabel('|X_k(e^{jw})|');

%(d)

Tw = T / 2;
boundary = floor(Tw / (2 * Ts));
w = (1 + cos((2*pi*Ts/Tw) .* abs(n))) ./ 2;
w((N + 1) / 2 + boundary + 1 : end) = 0;
w(1 : (N + 1) / 2 - boundary - 1) = 0;
subplot(3, 2, 4); plot(n, w);
title('(d)')
xlabel('n');
ylabel('w[n]');

%(e)

y = x .* w;
subplot(3, 2, 5); plot(n, y);
title('(e)')
xlabel('n');
ylabel('y[n]');

%(f)

Y = fft(y);
Y = fftshift(Y);
f = 2 .* pi .* k ./ N;
subplot(3,2,6); plot(f, abs(Y));
title('(f)')
xlabel('frequency w');
ylabel('|Y_k|');



