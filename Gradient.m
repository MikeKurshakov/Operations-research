function grad=Gradient(func,x0)
h = 0.00000001
%x1=(-func([x0(1)+2.*h x0(2)])+8.*func([x0(1)+h x0(2)])-8.*func([x0(1)-h x0(2)])+func([x0(1)-2.*h x0(2)]))./(12.*h)
%x2=(-func([x0(1) x0(2)+2.*h])+8.*func([x0(1) x0(2)+h])-8.*func([x0(1) x0(2)-h])+func([x0(1) x0(2)-2.*h]))./(12.*h)
x1=(func([x0(1)+h x0(2)])-func([x0(1) x0(2)]))/h
x2=(func([x0(1) x0(2)+h])-func([x0(1) x0(2)]))/h
grad=[x1;x2]