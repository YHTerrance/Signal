%Section a

n1 = 39;
x1 = [0 1:20 flip(1:19)];
subplot(4,2,1); stem(0:n1, x1, 'fill');
xlabel('n'); ylabel('x1[n]');

n2 = 10;
x2 = [0 ones(1, 10)];
subplot(4, 2, 2); stem(0:n2 ,x2, 'fill');
xlabel('n'); ylabel('x2[n]');

%Section b

y1 = conv(x1', x2');
subplot(4, 2, 3); stem(0:n1+n2, y1, 'fill');
xlabel('n'); ylabel('y1[n]');

%Section c

y2 = myConv(x1', x2', n1, n2);
subplot(4, 2, 4); stem(0:n1+n2, y2, 'fill');
xlabel('n'); ylabel('y2[n]');

if (y1 == y2)
    disp("y1 == y2 The two convolutions are equal!");
end

%Section d

n1 = 5;
x1 = [0 3.^[1:n1]];

subplot(4,2,5); stem(0:n1, x1, 'fill');
xlabel('n'); ylabel('x1[n]');

n2 = 5;
x2 = [0 2.^[1:n2]];

subplot(4,2,6); stem(0:n2, x2, 'fill');
xlabel('n'); ylabel('x2[n]');

y1 = conv(x1', x2');

subplot(4, 2, 7); stem(0:n1+n2, y1, 'fill');
xlabel('n'); ylabel('y1[n]');

y2 = myConv(x1', x2', n1, n2);

subplot(4, 2, 8); stem(0:n1+n2, y2, 'fill');
xlabel('n'); ylabel('y2[n]');

if (y1 == y2)
    disp("y1 == y2 The two convolutions are equal!");
end


function y = myConv(x1, x2, n1, n2)
    bigM = [zeros(n1 + n2- 1, n2)];
    for i = 1:n2
       bigM((1:n1) + (i - 1), i) = x1(2:(n1 + 1), 1); 
    end
    y = [0 ; 0 ; bigM * x2(2:n2+1, 1)];
end
