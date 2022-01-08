function calc_sqnrA()

%Accepts/Returns nothing.

x = sourceA(10);
x1 = sourceA(10);
[xq, centers, D] = PCM(x, 2, 0, 10000);
[idx,C] = kmeans(x1,2)
%MSE
disp("calculate MSE for 2bit non-uniform Quantization:")
err = ar( x , 2 )
disp("calculate MSE for 2bit kmeans Quantization:")
err = ar( x1 , 2 )
%plot
plot(x,'-r'); title("2-bit non-uniform quantization"); 
hold on 
plot(x1,'-b'); title("2-bit quantization Kmeans");
legend('non-uniform quantization','Kmeans quantization')
hold off

% We want it in dBs.
% Transform it to the correct format.
new = centers(xq);
newK = centers(idx);
new = new';
newK = newK';

% Experimental calculation of SQNR.
S = mean(x.^2);
Sk = mean(x1.^2);
N = mean((new-x).^2);
Nk = mean((newK-x1).^2);
% We want it in dBs.
R = 10 * log10(S/N);
Rk = abs(10 * log10(Sk/Nk));
fprintf('SQNR of 2-bit quantization (Random sample off of the Normal distribution) is %f dBs\n', R);
fprintf('SQNR of 2-bit quantization (Random sample off of the Kmeans distribution) is %f dBs\n', Rk);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
x = sourceA(10);
x1 = sourceA(10);
[xq, centers, D] = PCM(x, 3, 0, 10000);
[idx,C] = kmeans(x1,3)

disp("calculate MSE for 3bit non-uniform Quantization:")
err = ar( x , 3 )
disp("calculate MSE for 3bit kmeans Quantization:")
err = ar( x1 , 3 )

figure;
plot(x,'-r'); title("3-bit non-uniform quantization"); 
hold on 
plot(x1,'-b'); title("3-bit quantization Kmeans");
legend('non-uniform quantization','Kmeans quantization')
hold off

% We want it in dBs.
% Transform it to the correct format.
new = centers(xq);
newK = centers(idx);
new = new';
newK = newK';

% Experimental calculation of SQNR (Signal quantization noise ratio).
S = mean(x.^2);
Sk = mean(x1.^2);
N = mean((new-x).^2);
Nk = mean((newK-x1).^2);
% We want it in dBs.
R = 10 * log10(S/N);
Rk = abs(10 * log10(Sk/Nk));
fprintf('SQNR of 3-bit quantization (Random sample off of the Normal distribution) is %f dBs\n', R);
fprintf('SQNR of 3-bit quantization (Random sample off of the Kmeans distribution) is %f dBs\n', Rk);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
x = sourceA(10);
x1 = sourceA(10);
[xq, centers, D] = PCM(x, 4, 0, 10000);
[idx,C] = kmeans(x1,4)
%MSE 
disp("calculate MSE for 4bit non-uniform Quantization:")
err = ar( x , 4 )
disp("calculate MSE for 4bit kmeans Quantization:")
err = ar( x1 , 4 )

figure;
plot(x,'-r'); title("4-bit non-uniform quantization"); 
hold on 
plot(x1,'-b'); title("4-bit quantization Kmeans");
legend('non-uniform quantization','Kmeans quantization')
hold off

% We want it in dBs.
% Transform it to the correct format.
new = centers(xq);
newK = centers(idx);
new = new';
newK = newK';

% Experimental calculation of SQNR.
S = mean(x.^2);
Sk = mean(x1.^2);
N = mean((new-x).^2);
Nk = mean((newK-x1).^2);
% We want it in dBs.
R = 10 * log10(S/N);
Rk = abs(10 * log10(Sk/Nk));
fprintf('SQNR of 4-bit quantization (Random sample off of the Normal distribution) is %f dBs\n', R);
fprintf('SQNR of 4-bit quantization (Random sample off of the Kmeans distribution) is %f dBs\n', Rk);
