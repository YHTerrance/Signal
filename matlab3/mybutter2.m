T_s = 0.002;
f_1 = 100;
M = 1000;
n = [1:M];

%(a)
x = cos(2 * pi * (n - 1) * T_s) + 2 * cos(2 * pi * f_1 * (n - 1) * T_s);
subplot(3, 1, 1);
plot(n, x);
title('(a)');
xlabel('n');
ylabel('x[n]');

%(b)
L = 16;
f_c = 0.1;
[b, a] = butter(L, f_c);
[H, w] = freqz(b, a);
y = filter(b, a, x);
subplot(3, 1, 2);
plot(n, y);
title('(b)');
xlabel('n');
ylabel('y[n]');


%(c)
L = 16;
f_low = 150 * T_s;
f_high = 250 * T_s;
[b, a] = butter(L, [f_low f_high]);
[H, w] = freqz(b, a);
y = filter(b, a, x);
subplot(3, 1, 3);
plot(n, y);
title('(c)');
xlabel('n');
ylabel('y[n]');





