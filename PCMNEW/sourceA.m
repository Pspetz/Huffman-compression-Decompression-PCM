function data = sourceA(M)

temp = randn(M,1);
data = abs(temp);
%sys = ar(data,6)  MSE:0.4098
end 