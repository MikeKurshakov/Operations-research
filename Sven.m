function interval = Sven(f,x0,s)

step = 0.08 *  norm(x0)/norm(s);

counter=0
counter=counter+3
if (f(x0)<f(x0+step*s) && f(x0)>f(x0-step*s))
    step = -step;
else 
    if(f(x0)<f(x0+step*s) && f(x0)<f(x0-step*s))
        interval = [-step step counter];
        return;
    end
end


lambda = 0;
a = lambda;
b = lambda + step;
k = 1;
i = 1;


while (f(x0+b*s)<f(x0+a*s))
    counter=counter+2
    k = k * 2;
    i = i +1;
    a = b;
    b = b + k*step;

end

c = (a+b)/2;

if (f(x0 + a*s)<f(x0 + c*s))
    counter=counter+1
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
 interval = [left right counter]; 
end