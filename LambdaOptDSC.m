function lambda = LambdaOptDSC(f,x,eps)
s=-Gradient(f,x)

counter=0
counter=counter+4

interval = Sven(f,x,s)
counter=counter+interval(3)

l1 = interval(1);
l3 = interval(2);
l2 = (l3+l1) / 2;

f1 = f(x + l1*s);
f2 = f(x + l2*s);
f3 = f(x + l3*s);
counter=counter+3

a1 = (f2 - f1) / (l2 - l1);
a2 = ((f3 - f1) / (l3 - l1) - (f2-f1)/(l2-l1))/(l3-l2);

l0 = (l1+l2)/2 - a1/(2*a2);
f0 = f (x + l0*s);
counter=counter+1
while ( abs(f0 -f2)>eps)||(abs(l0-l2)>eps && (f0 ~= f2))
    if (f0>f2)&&(l0<l2)
        f1 = f0;
        l1 = l0;
    else
         if (f0>f2)&&(l0>l2)
          f3 = f0;
          l3 = l0;
         else
              if (f0<f2)&&(l0<l2)
                    f3 = f2;
                    f2 = f0;
                    l3 = l2;
                    l2 = l0;
              else
                    f1 = f2;
                    f2 = f0;
                    l1 = l2;
                    l2 = l0;
              end
        end
    end
a1 = (f2-f1)/(l2-l1);
a2 = ((f3-f1)/(l3-l1) - (f2-f1)/(l2-l1))/(l3-l2);
l0 = (l1+l2)/2 - a1/(2*a2);
f0 = f(x + l0*s);
counter=counter+1
end

lambda = [l0 counter];
end