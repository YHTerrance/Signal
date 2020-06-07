%(a)

b0 = 0.09;
b1 = [1 -1];
b2 = [1 1];
a0 = [1 -0.3-0.4i];
a1 = [1 -0.3+0.4i];
a2 = [1 -0.1-0.1i];
a3 = [1 -0.1+0.1i];
b = b0 * conv(conv(b1, b1), conv(b2, b2));
a = conv(conv(a0, a1), conv(a2, a3));

[r, p, k] = residuez(b, a);

N = 30;
n = [0:N-1];
impulse = (n == 0);
h_pfe = zeros(1,N);
for i = 1:size(r)
  % repeated roots are not detected exactly:
  if i>1 && abs(p(i)-p(i-1))<1E-7
    %disp("Same pole");
    h_pfe = h_pfe + (r(i) * (n+1) * p(i).^n);  
  else
     %disp("Different pole");
     h_pfe = h_pfe + (r(i) * p(i).^n);
  end
end
h_pfe = h_pfe + k * impulse;
subplot(4, 2, 1);
stem(n, real(h_pfe));
title('(a)');
xlabel('n');
ylabel('h[n]');

%(b)

subplot(4, 2, 2);
zplane(b, a);

%(c)

[H, w] = freqz(b, a);
subplot(4, 2, 3);
plot(w / pi, 20 * log10(abs(H)));
title('(c)');
xlabel('Normalized frequency (\times\pi rad/sample)');
ylabel('H(e^{jw}) Magnitude(dB)');

subplot(4, 2, 4);
theta = unwrap(angle(H)) * 180 / pi;
plot(w / pi, theta);
title('(c)');
xlabel('Normalized frequency (\times\pi rad/sample)');
ylabel('\angle H(e^{jw}) Phase(degrees)');

%(d)

bRoots = roots(b);
aRoots = roots(a);
sos = zp2sos(bRoots, aRoots, 1)
b1 = 0.3 * sos(1, 1:3);
a1 = sos(1, 4:6);
b2 = 0.3 * sos(2, 1:3);
a2 = sos(2, 4:6);

%(e)

[H1, w] = freqz(b1, a1);
subplot(4, 2, 5);
plot(w / pi, 20 * log10(abs(H1)));
title('(e)');
xlabel('Normalized frequency (\times\pi rad/sample)');
ylabel('|H_1(e^{jw})| Magnitude(dB)');

[H2, w2] = freqz(b2, a2);
subplot(4, 2, 6);
plot(w / pi, 20 * log10(abs(H2)));
title('(e)');
xlabel('Normalized frequency (\times\pi rad/sample)');
ylabel('|H_2(e^{jw})| Magnitude(dB)');

H3 = abs(H1) .* abs(H2);
subplot(4, 2, 7);
plot(w / pi, 20 * log10(abs(H3)));
title('(e)');
xlabel('Normalized frequency (\times\pi rad/sample)');
ylabel('|H_1(e^{jw}||H_2(e^{jw})| Magnitude(dB)');

%(f)

impulse = (n==0);
y = filter(b, a, impulse);
subplot(4, 2, 8);
stem(n, y);
title('(f)');
xlabel('n');
ylabel('y[n]');
