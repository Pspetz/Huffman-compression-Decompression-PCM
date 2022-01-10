
for n=2
    % Basic runs.
    x = sourceB(10000);
    [xq, centers, D] = 	PCM(x, n, -1, 1);
  
    %PLOT
    figure;
    plot(x,'-r'); title("2-bit non-quantization"); 
   
    % We want it in dBs.
    % Transform it to the correct format
    new = centers(xq);
    new = new';
    %MSE
    mse2 = mean((x-new).^2);
    
    
    S = mean(x.^2);
    N = mean((new-x).^2);
    % We want it in dBs.
    R = 10 * log10(S/N);
    fprintf('SQNR of %d-bit quantization (using non-uniform Quantization) is %f dBs\n', n, R);
   
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


for n=3
   % Basic runs.
    x = sourceB(10000);
    [xq, centers, D] = 	PCM(x, n, -1, 1);
    %Plot
    figure;
     plot(x,'-r'); title("3-bit non-uniform quantization"); 
    
    
    new = centers(xq);
    new = new';
    S = mean(x.^2);
    N = mean((new-x).^2);
    %MSE
    mse3 = mean((x-new).^2);
  
    % We want it in dBs.
    R = 10 * log10(S/N);
 

    fprintf('SQNR of %d-bit quantization (using non-uniform Quantization) is %f dBs\n', n, R);
   
end



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for n=4
   % Basic runs.
    x = sourceB(10000);
    [xq, centers, D] = 	PCM(x, n, -1, 1);
    figure;
    plot(x,'-r'); title("4-bit non-uniform-quantization"); 
 
    
    new = centers(xq);
    
    
    new = new';
  
    
    S = mean(x.^2);
    N = mean((new-x).^2);
    %MSE
    mse4 = mean((x-new).^2);
    
    % We want it in dBs.
    R = 10 * log10(S/N);
    

    fprintf('SQNR of %d-bit quantization (using non-uniform Quantization) is %f dBs\n', n, R);
   
end

mse=[mse2 mse3 mse4];
plot(mse,'-r'); title(" MSE");
