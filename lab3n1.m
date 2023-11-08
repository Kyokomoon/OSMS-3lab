pi = 3.14;
N = 100;
t = (0:N-1)/N;
s1 = cos(2 * pi * 11*t);
s2 = cos(2 * pi * 15*t);
s3 = cos(2 * pi * 23*t);

a = 2*s1+4*s2 + s3;
b = s1 + s2 + s3;
cors1a = 0;
for n = 1:N
    cors1a = cors1a + (s1(n) * a(n));
end
cors1b = 0;
for n = 1:N
    cors1b = cors1b + (s1(n) * b(n));
end
normcors1 = 0;
for n = 1:N
    normcors1 = normcors1 + (s1(n) * s1(n));
end
normcora = 0;
for n = 1:N
    normcora = normcora + (a(n) * a(n));
end
normcorb = 0;
for n = 1:N
    normcorb = normcorb + (b(n) * b(n));
end
normcors1a = (cors1a/sqrt(normcors1*normcora));
normcors1b = (cors1b/sqrt(normcors1*normcorb));
dis = sprintf("\n---------------------\nОбычная корреляция\n---------------------\n\\ |   A    |    B   |\ns1|%8.4f|%8.4f|\n",cors1a, cors1b);
disp(dis);
dis = sprintf("\n--------------------------\nНормализованная корреляция\n--------------------------\n\\ |   A    |    B   |\ns1|%8.4f|%8.4f|\n",normcors1a, normcors1b);
disp(dis);



subplot(5, 1, 1);
plot(t,s1);
xlabel("Time (sec)");
ylabel("Amplitude");
title("s1 = cos(2 * pi * 11*t1)");
subplot(5, 1, 2);
plot(t,s2);
xlabel("Time (sec)");
ylabel("Amplitude"); 
title("s2 = cos(2 * pi * 16*t2)");
subplot(5, 1, 3);
plot(t,s3);
xlabel("Time (sec)");
ylabel("Amplitude"); 
title("s3 = cos(2 * pi * 23*t3)");
subplot(5, 1, 4);
plot(t,a);
xlabel("Time (sec)");
ylabel("Amplitude"); 
title("a = 2*s1+4*s2 + s3");
subplot(5, 1, 5);
plot(t,b);
xlabel("Time (sec)");
ylabel("Amplitude"); 
title("b = s1 + s2 + s3;");


