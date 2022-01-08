function calc_sqnrB()

for n=2
    % Basic runs.
    x = sourceB(10000);
    x1= sourceB(10000);
    [xq, centers, D] = 	PCM(x, n, -1, 1);
    [idx,C] = kmeans(x1,n);
    %PLOT
    plot(x,'-r'); title("2-bit quantization"); 
    hold on 
    plot(x1,'-b'); title("2-bit quantization");
    legend('non-uniform quantization','Kmeans quantization')
    hold off
    %MSE
    disp("calculate MSE for 2bit non-uniform Quantization:")
    err = ar( x , 2 )
    disp("calculate MSE for 2bit kmeans Quantization:")
    err = ar( x1 , 2 )
    
    % We want it in dBs.
    % Transform it to the correct format
    new = centers(xq);
    newK = centers(idx);
    
    new = new';
    newK = newK';
    
    S = mean(x.^2);
    Sk = mean(x1.^2);
    N = mean((new-x).^2);
    Nk = mean((newK-x1).^2);
    % We want it in dBs.
    R = 10 * log10(S/N);
    Rk = abs(10 * log10(Sk/Nk));
    fprintf('SQNR of %d-bit quantization (using non-uniform Quantization) is %f dBs\n', n, R);
    fprintf('SQNR of %d-bit quantization (using Kmeans Quantization) is %f dBs\n',n, Rk);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


for n=3
   % Basic runs.
    x = sourceB(10000);
    x1= sourceB(10000);
    [xq, centers, D] = 	PCM(x, n, -1, 1);
    [idx,C] = kmeans(x1,n);
    %MSE
    disp("calculate MSE for 3bit non-uniform Quantization:")
    err = ar( x , 3 )
    disp("calculate MSE for 3bit kmeans Quantization:")
    err = ar( x1 , 3 )
    %Plot
    figure;
     plot(x,'-r'); title("3-bitquantization"); 
    hold on 
    plot(x1,'-b'); title("3-bit  quantization");
    legend('non-uniform quantization','Kmeans quantization')
    hold off
    
    new = centers(xq);
    newK = centers(idx);
    
    new = new';
    newK = newK';
    
    S = mean(x.^2);
    Sk = mean(x1.^2);
    N = mean((new-x).^2);
    Nk = mean((newK-x1).^2);
    % We want it in dBs.
    R = 10 * log10(S/N);
    Rk = abs(10 * log10(Sk/Nk));

    fprintf('SQNR of %d-bit quantization (using Lloyd-Max) is %f dBs\n', n, R);
    fprintf('SQNR of 3-bit quantization (using Kmeans) is %f dBs\n', Rk);
end



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for n=4
   % Basic runs.
    x = sourceB(10000);
    x1= sourceB(10000);
    [xq, centers, D] = 	PCM(x, n, -1, 1);
    [idx,C] = kmeans(x1,n);
     %MSE
    disp("calculate MSE for 4bit non-uniform Quantization:")
    err = ar( x , 4 )
    disp("calculate MSE for 4bit kmeans Quantization:")
    err = ar( x1 , 4 )
    %plot
    figure;
    plot(x,'-r'); title("4-bit quantization"); 
    hold on 
    plot(x1,'-b'); title("4-bit quantization");
    legend('non-uniform quantization','Kmeans quantization')
    hold off
    
    new = centers(xq);
    newK = centers(idx);
    
    new = new';
    newK = newK';
    
    S = mean(x.^2);
    Sk = mean(x1.^2);
    N = mean((new-x).^2);
    Nk = mean((newK-x1).^2);
    % We want it in dBs.
    R = 10 * log10(S/N);
    Rk = abs(10 * log10(Sk/Nk));

    fprintf('SQNR of %d-bit quantization (using Lloyd-Max) is %f dBs\n', n, R);
    fprintf('SQNR of 4-bit quantization (using Kmeans) is %f dBs\n', Rk);
end


