func=@(x)(10*(x(1)-x(2))^2+(x(1)-1)^2)^(4)
%func=@(x)x(1)^2+25*x(2)^2
eps=0.01
x0=[-1.2;0]
x_k=x0
counter=0
lambdaCONST=1

while(1)
%     if(norm(Gradient(func,x_k))<eps)
%         x_res=x_k
%         break
%     end 
    x_new=x_k-lambdaCONST.*Gradient(func,x_k)./norm(Gradient(func,x_k))
    if(func(x_new)-func(x_k)<0)
        if(norm(x_new-x_k)<eps)
            if(abs(func(x_new)-func(x_k))<eps)
                x_res=x_new
                break
            end
        end
    else lambdaCONST=lambdaCONST/2
    end
    x_k=x_new
    counter=counter+1
end
disp("Точка X");
disp(x_res)
fprintf('\n Количество итераций %d \n',counter);