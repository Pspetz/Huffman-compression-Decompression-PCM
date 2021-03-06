
for n=2
    % Basic runs.
    x = sourceB(10000);
    [xq, centers, D] = 	PCM(x, n, -1, 1);
  
   
    % We want it in dBs.
    % Transform it to the correct format
    new = centers(xq);
    new = new';
    %MSE
    mse2 = mean((x-new).^2);
    
    
    S = mean(x.^2);
    N = mean((new-x).^2);
    % We want it in dBs.
    R2 = 10 * log10(S/N);
    fprintf('SQNR of %d-bit quantization (using non-uniform Quantization) is %f dBs\n', n, R2);
   
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


for n=3
   % Basic runs.
    x = sourceB(10000);
    [xq, centers, D] = 	PCM(x, n, -1, 1);
   
   
    new = centers(xq);
    new = new';
    S = mean(x.^2);
    N = mean((new-x).^2);
    %MSE
    mse3 = mean((x-new).^2);
  
    % We want it in dBs.
    R3 = 10 * log10(S/N);
 

    fprintf('SQNR of %d-bit quantization (using non-uniform Quantization) is %f dBs\n', n, R3);
   
end



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for n=4
   % Basic runs.
    x = sourceB(10000);
    [xq, centers, D] = 	PCM(x, n, -1, 1);
    
 
    new = centers(xq);
    
    
    new = new';
  
    
    S = mean(x.^2);
    N = mean((new-x).^2);
    %MSE
    mse4 = mean((x-new).^2);
    
    % We want it in dBs.
    R4 = 10 * log10(S/N);
    

    fprintf('SQNR of %d-bit quantization (using non-uniform Quantization) is %f dBs\n', n, R4);
   
end

mse=[mse2 mse3 mse4];
figure;
plot(mse,'-r'); title(" MSE");

%METAVOLI TOU SQNR(erwtima 2a)
sqnr_ol=[R2 R3 R4];
figure;
 plot(sqnr_ol,'-b'); title("sqnr for non-uniform");


