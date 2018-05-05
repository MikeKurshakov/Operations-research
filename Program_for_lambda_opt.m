func=@(x)(10*(x(1)-x(2))^2+(x(1)-1)^2)^(4)
eps=0.0001
x0=[-1.2;0.0]
x_k=x0
counter=0;

while(1)
    if(norm(Gradient(func,x_k))<eps)
        x_res=x_k
        break
    end       
    x_new=x_k-LambdaOPT(func,x_k,eps).*Gradient(func,x_k)
    if((norm(x_new-x_k)/norm(x_k))<eps)
        x_res=x_new
        break
    else x_k=x_new
    end
    counter=counter+1
end
disp("����� X");
disp(x_res)
fprintf('\n ���������� �������� %d \n',counter);