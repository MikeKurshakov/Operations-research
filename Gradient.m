function grad=Gradient(func,x0)
h = 0.0001

%right
x1=(func([x0(1)+h x0(2)])-func([x0(1) x0(2)]))/h
x2=(func([x0(1) x0(2)+h])-func([x0(1) x0(2)]))/h

%left
% x1=(func([x0(1) x0(2)])-func([x0(1)-h x0(2)]))/h
% x2=(func([x0(1) x0(2)])-func([x0(1) x0(2)-h]))/h

%central
% x1=(func([x0(1)+h x0(2)])-func([x0(1)-h x0(2)]))/2*h
% x2=(func([x0(1) x0(2)+h])-func([x0(1) x0(2)-h]))/2*h

grad=[x1;x2]