%ERWTIMA 1 a,b  (vathmwtos)
x = sourceA(10000);
[xq, centers, D] = PCM(x, 2, 0, 10000);
% We want it in dBs.
% Transform it to the correct format.
new = centers(xq);
new = new';
 %PLOT
    figure;
    plot(x,'-r'); title("2-bit non-quantization"); 
   

% Experimental calculation of SQNR.
S = mean(x.^2);
N = mean((new-x).^2);
%MSE
mse1=mean((x-new).^2);


% We want it in dBs.
R = 10 * log10(S/N);
fprintf('SQNR of 2-bit quantization (random sample of Non uniform distribution) is %f dBs\n', R);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
x = sourceA(10000);
[xq, centers, D] = PCM(x, 3, 0, 10000);

% We want it in dBs.
% Transform it to the correct format.
new = centers(xq);
new = new';
 %PLOT
    figure;
    plot(x,'-r'); title("3-bit non-quantization"); 
   

% Experimental calculation of SQNR 
S = mean(x.^2);
N = mean((new-x).^2);
%MSE
mse2=mean((x-new).^2);

% We want it in dBs.
R = 10 * log10(S/N);
fprintf('SQNR of 3-bit quantization (random sample of Non uniform distribution) is %f dBs\n', R);



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
x = sourceA(10000);
[xq, centers, D] = PCM(x, 4, 0, 10000);

% We want it in dBs.
% Transform it to the correct format.
new = centers(xq);
new = new';
 %PLOT
    figure;
    plot(x,'-r'); title("4-bit non-quantization"); 
   

% Experimental calculation of SQNR.
S = mean(x.^2);
N = mean((new-x).^2);
%MSE
mse3=mean((x-new).^2);
% We want it in dBs.
R = 10 * log10(S/N);

fprintf('SQNR of 4-bit quantization (Random sample of the non uniform distribution) is %f dBs\n', R);



sunoliko_mse=[mse1 mse2 mse3]
figure;
plot(sunoliko_mse,'r'); title("MSE non-uniform quantization");
