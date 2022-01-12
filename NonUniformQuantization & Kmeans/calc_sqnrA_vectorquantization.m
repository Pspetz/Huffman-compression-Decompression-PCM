
 %--------------n = 2 ---------%
 y=sourceA(10000);
 [idx, C] = kmeans(y, 2);
 megethos=size(idx);
 new_megethos=megethos';
 avg1=C/new_megethos
 ykbant2=C(idx); %to kvantismeno shma
 mse2 = mean((y-ykbant2).^2);
 Psig2=mean(y.^2);  %isxus
 Pnois2 = mean((y-ykbant2).^2); %thorivos
 
 %upologismos tou sqnr se db
 loydsqnr2=10*log10(Psig2/Pnois2); 
 fprintf('SQNR of 2-bit quantization (random sample of vector quantization) is %f dBs\n', loydsqnr2);

 
 
 
 %------------ n =3 ---------------------
 y=sourceA(10000);
 [idx, C] = kmeans(y, 2);
 megethos=size(idx);
 new_megethos=megethos';
 avg2=C/new_megethos
 ykbant3=C(idx); %to kvantismeno shma
 mse3 = mean((y-ykbant3).^2);
 Psig3=mean(y.^2);
 Pnois3 = mean((y-ykbant3).^2);

 %upologismos tou sqnr se db
 loydsqnr3=10*log10(Psig3/Pnois3); 
 fprintf('SQNR of 3-bit quantization (random sample of vector quantization) is %f dBs\n', loydsqnr3);
 

 
 
 %------------ n = 4 ---------------------
  y=sourceA(10000);
 [idx, C] = kmeans(y, 2);
 megethos=size(idx);
 new_megethos=megethos';
 avg3=C/new_megethos
 ykbant4=C(idx); %to kvantismeno shma
 mse4 = mean((y-ykbant4).^2);
 Psig4=mean(y.^2);
 Pnois4 = mean((y-ykbant4).^2);

 %upologismos tou sqnr se db
 loydsqnr4=10*log10(Psig4/Pnois4); 
 fprintf('SQNR of 4-bit quantization (random sample of vector quantization) is %f dBs\n', loydsqnr4);
 
 
 
 %MESO TETRAGWNIKO SFALMA GIA KMEANS
 mse = [mse2 mse3 mse4] 
 figure;
 plot(mse','r'); title("mean squared error");

 
