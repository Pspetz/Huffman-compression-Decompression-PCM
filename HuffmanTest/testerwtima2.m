function [] = testerwtima2()

 
 alphabet = {"a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z","space" } ;
 prob = [0.0698,0.0128,0.023,0.0364,0.1086,0.0190,0.0172,0.0521,0.0595,0.0013,0.0066,0.0344,0.0206,0.0577,0.0642,0.0165,0.0008,0.0512,0.0541,0.0774,0.0236,0.0084,0.0202,0.0013,0.0169,0.0006,0.1453];
 dict = Huffmandictionary(alphabet,prob);

 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 disp("String :");
 fileI=fopen('cvxopt.txt','r');
x=fscanf(fileI,"%s");
counter=1;
folder={};
enco="";
for i=1
    for j=1:length(x) 
       folder{i,j} = x(i,j) ;
       counter = counter + 1 ;
    end
    enco=strcat(enco,folder);
end

encoded = Huffmanencoding(folder,dict);
disp("Encoding :")
disp(encoded);
fid = fopen('C:\Users\User\Documents\MATLAB\Νέος φάκελος\charstobits.txt','wt');
    
    for i = 1:length(encoded)
    fprintf(fid,'%s',encoded);
    end
 fclose(fid)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

decoded = Huffmandecoding(encoded,dict);
disp("Decoding :")
disp((decoded));
fid = fopen('C:\Users\User\Documents\MATLAB\Νέος φάκελος\bittochar.txt','wt');
    
    for i = 1:length(decoded)
        fprintf(fid,'%s\t',decoded{i});
    end
fclose(fid)

length(encoded)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

meso_mikos_kwdika=eff_calc(dict,prob);
disp(meso_mikos_kwdika)
end