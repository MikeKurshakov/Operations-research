function interval = Sven(f,x0,s)

disp("Метод Свена");
step = 0.1 *  norm(x0)/norm(s);

if (f(x0)<f(x0+step*s) && f(x0)>f(x0-step*s))
    step = -step;
else 
    if(f(x0)<f(x0+step*s) && f(x0)<f(x0-step*s))
        interval = [-step step];
        return;
    end
end

fprintf("Шаг для лямбды %d\n",step);


lambda = 0;
a = lambda;
b = lambda + step;
k = 1;
i = 1;

fprintf('Интервал A = %f  B = %f\n',a,b);

while (f(x0+b*s)<f(x0+a*s))
    k = k * 2;
    i = i +1;
    a = b;
    b = b + k*step;
    fprintf('Интервал A = %f  B = %f\n',a,b);
end

c = (a+b)/2;

if (f(x0 + a*s)<f(x0 + c*s))
    b = c;
    a = a - step*(k/2);
end

if (a>b)
    temp = a;
    a = b;
    b = temp;
end
 left = a;
 right = b;
 interval = [left right];
 
disp("Окончательный интервал");
fprintf('Интервал A = %f  B = %f\n',a,b);
 
end