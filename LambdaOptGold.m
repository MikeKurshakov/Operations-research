function lambda = LambdaOptGold(f,x,eps)
s=-Gradient(f,x)

counter=0
counter=counter+4

counter=0

interval = Sven(f,x,s)
counter=counter+interval(3)

a = interval(1);
b = interval(2);


l1 = a + (b - a) * 0.382;
l2 = a + (b - a) * 0.618;


while (b - a > eps) 
    
if (f(x + l1*s) < f(x + l2*s))
     b = l2;
     l2 = l1;
     l1 = a + (b-a)*0.382;
     counter=counter+2
else
        a = l1;
        l1 = l2;
        l2 = a + (b - a ) * 0.618;
end
end

optimal_lambda = (a+b)/2;


lambda = [optimal_lambda counter];
end