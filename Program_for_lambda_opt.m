func=@(x)(10*(x(1)-x(2))^2+(x(1)-1)^2)^(1/4)
%func=@(x)(x(1)-1)^2+(x(2)-1)^2
eps=0.0001
x0=[-1.2;0.0]
x_k=x0
counter=0;
counter_disp=0

while(1)
      counter_disp=counter_disp+1
    if(norm(Gradient(func,x_k))<eps)
        x_res=x_k
        break
     end
lambda = LambdaOptDSC(func,x_k,eps)
counter=counter+lambda(2)
    x_new=x_k-lambda(1).*Gradient(func,x_k)
    if(norm(x_new-x_k)/norm(x_k)<eps)
        x_res=x_new
        break
    else x_k=x_new
    end
end
x_res_buff=x_res
counter_buff=counter
counter_disp_buff=counter_disp

x_k=x0
counter=0;
counter_disp=0

while(1)
      counter_disp=counter_disp+1
    if(norm(Gradient(func,x_k))<eps)
        x_res=x_k
        break
     end
lambda = LambdaOptGold(func,x_k,eps)
counter=counter+lambda(2)
    x_new=x_k-lambda(1).*Gradient(func,x_k)
    if(norm(x_new-x_k)/norm(x_k)<eps)
        x_res=x_new
        break
    else x_k=x_new
    end
end

disp(" ����� X ������� �������� �������");
disp(x_res)
fprintf(' ���������� ���������� ������� ��� �������� ������� %d �������� %d \n\n',counter,counter_disp);
disp(" ����� X ������� ���-�����");
disp(x_res_buff)
fprintf(' ���������� ���������� ������� ��� ���-����� %d �������� %d \n',counter_buff,counter_disp_buff);
