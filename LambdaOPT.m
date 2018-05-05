function lambda=LambdaOPT(func,x,eps)
s=-Gradient(func,x)
interval = Sven(func,x,s)

a = interval(1);
b = interval(2);

c =  (a + b ) / 2;
disp("Метод Дихотомии");
fprintf('Интервал A = %f  B = %f\n',a,b);
while (b - a > eps) 
    
L1 = (a  + c ) / 2;
L2 = (b  + c ) / 2;

if (func(x + L1*s) < func(x + c*s))
     b = c;
     c = L1;
else
     if (func(x + L2*s) < func(x + c*s))
        a = c;
        c = L2;
    else 
        a = L1;
        b = L2;
    end
end 
fprintf('Интервал A = %f  B = %f\n',a,b);
end

disp("Окончательный интервал");
fprintf('Интервал A = %f  B = %f\n',a,b);
disp("Оптимальная лямбда = ");
fprintf("%f",(a+b)/2);
lambda = (a+b)/2;

end
