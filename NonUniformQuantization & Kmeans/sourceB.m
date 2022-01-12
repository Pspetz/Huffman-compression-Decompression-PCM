function data = sourceB(M)
x=randn(M,1);
b = 1;
a = [1 1/2 1/3 1/4 1/5 1/6 ];

y=filter(b,a,x);

%error=y.^2; 
%MSE=mean(error,"all")

data = y;
end
