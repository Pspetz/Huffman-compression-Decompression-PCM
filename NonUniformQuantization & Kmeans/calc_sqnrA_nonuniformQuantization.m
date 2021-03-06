%ERWTIMA 1 a,b  (vathmwtos)
x = sourceA(10000);
[xq, centers, D] = PCM(x, 2, -1, 1);

% Transform it to the correct format.
new = centers(xq);
new = new';
 
   
% SQNR calculation
S = mean(x.^2);
N = mean((new-x).^2);
%MSE
mse1=mean((x-new).^2);


% dBs
R = 10 * log10(S/N);
fprintf('SQNR of 2-bit quantization (random sample of Non uniform distribution) is %f dBs\n', R);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
x = sourceA(10000);
[xq, centers, D] = PCM(x, 3, -1, 1);

% We want it in dBs.
% Transform it to the correct format.
new = centers(xq);
new = new';


% SQNR calculation
S = mean(x.^2);
N = mean((new-x).^2);
%MSE
mse2=mean((x-new).^2);

% dBs
R = 10 * log10(S/N);
fprintf('SQNR of 3-bit quantization (random sample of Non uniform distribution) is %f dBs\n', R);



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
x = sourceA(10000);
[xq, centers, D] = PCM(x, 4, -1, 1);

% We want it in dBs.
% Transform it to the correct format.
new = centers(xq);
new = new';
 

% SQNR calculation
S = mean(x.^2);
N = mean((new-x).^2);
%MSE
mse3=mean((x-new).^2);
% dBs
R = 10 * log10(S/N);

fprintf('SQNR of 4-bit quantization (Random sample of the non uniform distribution) is %f dBs\n', R);


%MESO TETRAGWNIKO SFALMA
sunoliko_mse=[mse1 mse2 mse3]
figure;
plot(sunoliko_mse,'r'); title("MSE non-uniform quantization");

%
