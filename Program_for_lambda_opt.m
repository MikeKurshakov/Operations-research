func=@(x)(10*(x(1)-x(2))^2+(x(1)-1)^2)^(4)
eps=0.00001
x0=[-1.2;0.0]
x_k=x0
counter=0;

while(1)
%     if(norm(Gradient(func,x_k))<eps)
%         disp("GRAD")
%         disp(norm(Gradient(func,x_k)))
%         x_res=x_k
%         break
%     end
lambda = LambdaOPT(func,x_k,eps)
counter=counter+lambda(2)
    x_new=x_k-lambda(1).*Gradient(func,x_k)
    counter=counter+4
    if(norm(x_new-x_k)<eps)
        disp("X")
        disp(norm(x_new-x_k)/norm(x_k))
        x_res=x_new
        break
    else x_k=x_new
    end
end
disp("Точка X");
disp(x_res)
fprintf('\n Количество итераций %d \n',counter);