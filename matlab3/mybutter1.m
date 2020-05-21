f_s = 10;
T_s = 1 / f_s;
N = 100;
n = [1:100];
x = cos(2 * pi * (n - 1) * T_s);
subplot(4, 3, [1, 3]);
plot(n, x);
title('(a)');
xlabel('n');
ylabel('x[n]');

%(b)
L = 3;
f_c = 0.1;
[b, a] = butter(L, f_c);
[H, w] = freqz(b, a);
subplot(4, 3, 4);
plot(w / pi, 20 * log10(abs(H)));
title('(b)');
xlabel('Normalized frequency (\times\pi rad/sample)');
ylabel('H(e^{jw}) Magnitude(dB)');

subplot(4, 3, 5);
theta = unwrap(angle(H)) * 180 / pi;
plot(w / pi, theta);
title('(b)');
xlabel('Normalized frequency (\times\pi rad/sample)');
ylabel('\angle H(e^{jw}) Phase(degrees)');

subplot(4, 3, 6);
y = filter(b, a, x);
plot(n, y);
title('(b)');
xlabel('n');
ylabel('y[n]');


%(c)
L = 7;
f_c = 0.1;
[b, a] = butter(L, f_c);
[H, w] = freqz(b, a);
subplot(4, 3, 7);
plot(w / pi, 20 * log10(abs(H)));
title('(c)');
xlabel('Normalized frequency (\times\pi rad/sample)');
ylabel('H(e^{jw}) Magnitude(dB)');

subplot(4, 3, 8);
theta = unwrap(angle(H)) * 180 / pi;
plot(w / pi, theta);
title('(c)');
xlabel('Normalized frequency (\times\pi rad/sample)');
ylabel('\angle H(e^{jw}) Phase(degrees)');

subplot(4, 3, 9);
y = filter(b, a, x);
plot(n, y);
title('(c)');
xlabel('n');
ylabel('y[n]');


%(d)
L = 3;
f_c = 0.5;
[b, a] = butter(L, f_c);
[H, w] = freqz(b, a);
subplot(4, 3, 10);
plot(w / pi, 20 * log10(abs(H)));
title('(d)');
xlabel('Normalized frequency (\times\pi rad/sample)');
ylabel('H(e^{jw}) Magnitude(dB)');

subplot(4, 3, 11);
theta = unwrap(angle(H)) * 180 / pi;
plot(w / pi, theta);
title('(d)');
xlabel('Normalized frequency (\times\pi rad/sample)');
ylabel('\angle H(e^{jw}) Phase(degrees)');

subplot(4, 3, 12);
y = filter(b, a, x);
plot(n, y);
title('(d)');
xlabel('n');
ylabel('y[n]');

