
        
 %--------------n = 2 ---------%
 y=sourceA(10000);
 bn = [10]
 [Aq2,centers2,D2]=vecQuant(y,2,min(y),max(y),10);
 ykbant2=centers2(Aq2); %to kvantismeno shma
 mse2 = mean((y-ykbant2).^2);
        
 Psig2=mean(y.^2);
 ykbant2=centers2(Aq2); %to kvantismeno shma
 Pnois2 = mean((y-ykbant2).^2);

 %upologismos tou sqnr se db
 loydsqnr2=10*log10(Psig2/Pnois2); 
 fprintf('SQNR of 2-bit quantization (random sample of vector quantization) is %f dBs\n', loydsqnr2);
 %KVANTISMENO SIMA GRAPH GRAPH
 figure;
 prwto=plot(ykbant2,'-r');title("2-bit vec-quantization");  
 
 
 
 %------------ n =3 ---------------------
 y=sourceA(10000);
 bn = [10]
[Aq3,centers3,D3]=vecQuant(y,3,min(y),max(y),10);
        
 
 ykbant3=centers3(Aq3); %to kvantismeno shma
 mse3 = mean((y-ykbant3).^2);
 Psig3=mean(y.^2);
 ykbant3=centers3(Aq3); %to kvantismeno shma
 Pnois3 = mean((y-ykbant3).^2);

 %upologismos tou sqnr se db
 loydsqnr3=10*log10(Psig3/Pnois3); 
 fprintf('SQNR of 3-bit quantization (random sample of vector quantization) is %f dBs\n', loydsqnr2);
 %KVANTISMENO SHMA GRAPH
 figure;
 deutero=plot(ykbant3,'-r'); title("3-bit vec-quantization");  

 
 
 %------------ n = 4 ---------------------
  y=sourceA(10000);
 bn = [10]
[Aq4,centers4,D4]=vecQuant(y,4,min(y),max(y),10);
        
 
 ykbant4=centers4(Aq4); %to kvantismeno shma
 mse4 = mean((y-ykbant4).^2);
 Psig4=mean(y.^2);
 ykbant4=centers4(Aq4); %to kvantismeno shma
 Pnois4 = mean((y-ykbant4).^2);

 %upologismos tou sqnr se db
 loydsqnr4=10*log10(Psig4/Pnois4); 
 fprintf('SQNR of 4-bit quantization (random sample of vector quantization) is %f dBs\n', loydsqnr4);
 figure;
 trito=plot(ykbant4,'-r'); title("4-bit vec-quantization");  
 
 
 
 
 
 %MESI PARAMORFWSI GIA KMEANS
 mse = [mse2 mse3 mse4] 
 figure;
 plot(mse','r'); title("mean squared error");

