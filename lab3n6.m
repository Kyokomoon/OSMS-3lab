N = 7;
a = [0.3 0.2 -0.1 4.2 -2 1.5 0];
b = [0.3 4 -2.2 1.6 0.1 0.1 0.2];
t = (1:N);
t2 = (0:N-1);
max_correlation = -1;
sdvig = 0;
corab = 0;
for n = 1:N
    corab = corab + (a(n) * b(n));
end
normcora = 0;
for n = 1:N
   normcora = normcora + (a(n) * a(n));
end
normcorb = 0;
for n = 1:N
   normcorb = normcorb + (b(n) * b(n));
end
normcorab = (corab/sqrt(normcora*normcorb));
dis = sprintf("\n---------------------\nОбычная корреляция\n---------------------\n A:B = %.4f",corab);
disp(dis);
dis = sprintf("\n---------------------\nНормализованная корреляция\n---------------------\n A:B = %.4f",normcorab);
disp(dis);


subplot(5, 1, 1);
plot(t,a);
xlabel("Номер элемента массива");
ylabel("Amplitude");
title("a = [0.3 0.2 -0.1 4.2 -2 1.5 0];");
subplot(5, 1, 2);
plot(t,b);
xlabel("Номер элемента массива");
ylabel("Amplitude"); 
title("b = [0.3 4 -2.2 1.6 0.1 0.1 0.2]");

correlation_values = [0.3 4.1 -2.2 1.6 0.1 0.1 0.2];
for n = 0:N-1
    
    shifted_b = circshift(b, [0, n]);
    

    corab = 0;
    for i = 1:N
        corab = corab + (a(i) * shifted_b(i));
    end
    normcora = 0;
    for i = 1:N
       normcora = normcora + (a(i) * a(i));
    end
    normcorb = 0;
    for i = 1:N
       normcorb = normcorb + (shifted_b(i) * shifted_b(i));
    end
    normcorab = (corab/sqrt(normcora*normcorb));
    correlation_values(n+1) = normcorab;
    if normcorab > max_correlation
    max_correlation = normcorab;
    sdvig = n;
    end
end

bs = circshift(b, [0, sdvig]);
dis1 = " ";
for n= 1:N
    dis1 = sprintf("%s %.1f", dis1, bs(n));
end
dis1 = sprintf("sdvigb = [%s]", dis1);
dis = sprintf("Необходимый сдвиг >> %d", sdvig);
disp(dis); 
subplot(5, 1, 3);
plot(t,a);
xlabel("Номер элемента массива");
ylabel("Amplitude");
title("a = [0.3 0.2 -0.1 4.2 -2 1.5 0];");
subplot(5, 1, 4);
plot(t,bs);
xlabel("Номер элемента массива");
ylabel("Amplitude"); 
title(dis1);
subplot(5, 1, 5);
plot(t2,correlation_values);
xlabel("Номер сдвига");
ylabel("Amplitude"); 
title("Зависимость корреляции от сдвига");
