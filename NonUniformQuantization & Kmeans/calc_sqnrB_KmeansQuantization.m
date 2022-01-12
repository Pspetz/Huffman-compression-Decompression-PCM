
%--------------n =  ---------%
 y=sourceB(10000);
 [idx, C] = kmeans(y, 5000);
 ykbant2=C(idx); %kvantismeno shma
 mse2=mean((y-ykbant2).^2);

 Psig2=mean(y.^2);
 Pnois2 = mean((y-ykbant2).^2);

 %upologismos tou sqnr se db
 loydsqnr2=10*log10(Psig2/Pnois2); 
 fprintf('SQNR of 2-bit quantization (random sample of vector quantization) is %f dBs\n', loydsqnr2);
 
 
 
 
 %------------ n = ---------------------
 y=sourceB(10000);

 [idx, C] = kmeans(y,6000);
 ykbant3=C(idx);     
 mse3=mean((y-ykbant3).^2); %to kvantismeno shma
 Psig3=mean(y.^2);
 Pnois3 = mean((y-ykbant3).^2);

 %upologismos tou sqnr se db
 loydsqnr3=10*log10(Psig3/Pnois3); 
 fprintf('SQNR of 3-bit quantization (random sample of vector quantization) is %f dBs\n', loydsqnr3);


 %------------ n =  ---------------------
  y=sourceB(10000);
 [idx, C] = kmeans(y, 7000);
 ykbant4=C(idx);      
 mse4=mean((y-ykbant4).^2);      
 Psig4=mean(y.^2);
 Pnois4 = mean((y-ykbant4).^2);

 %upologismos tou sqnr se db
 loydsqnr4=10*log10(Psig4/Pnois4); 
 fprintf('SQNR of 4-bit quantization (random sample of vector quantization) is %f dBs\n', loydsqnr4);

 
 
 
 %MESO TETRAGWNIKO SFALMA
 mse = [mse2 mse3 mse4] 
 figure;
 plot(mse','r'); title("mean squared error");
 
%METAVOLI TOU SQNR(erwtima 2a)
sqnr_ol=[loydsqnr2 loydsqnr3 loydsqnr4];
figure;
 plot(sqnr_ol,'-b'); title("sqnr for kmeans");



