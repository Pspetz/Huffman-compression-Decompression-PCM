function [] = askisi1_erwtima3()

% https://en.wikipedia.org/wiki/Letter_frequency
%auti tin fora sto Huffmandictionary,grammi 14 kanw thn allagh:while ( prob ~=  1 )
alphabet = {'a' 'b' 'c' 'd' 'e' 'f' 'g' 'h' 'i' 'j' 'k' 'l' 'm' 'n' 'o' 'p' 'q' 'r' 's' 't' 'u' 'v' 'w' 'x' 'y' 'z'};
prob= [ .08167 .01492 .02782 .04253 .12702 .02228 .02015 .06094 .06966 .00153 .00772 .04025 .02406 .06749 .07507 .01929 .00095 .05987 .06327 .09056 .02758 .00978 .02361 .00150 .01974 .00074 ];

dict = Huffmandictionary(alphabet,prob);

%------------------------------------ENCODING--------------------------
 disp("String :");
 fileI=fopen('cvxopt.txt','r');
x=fscanf(fileI,"%s");
counter=1;
folder={};
for i=1
    for j=1:length(x) 
       folder{i,j} = x(i,j) ;
       counter = counter + 1 ;
    end
    
end

encoded = Huffmanencoding(folder,dict);
disp("Encoding :")
disp(encoded);
fid = fopen('C:\Users\User\Documents\MATLAB\Νέος φάκελος\charstobits.txt','wt');
    
    for i = 1:length(encoded)
    fprintf(fid,'%s',encoded);
    end
 fclose(fid)



%-------------------------------DECODED---------------------------

decoded = Huffmandecoding(encoded,dict);
disp("Decoding :")
disp((decoded));
fid = fopen('C:\Users\User\Documents\MATLAB\Νέος φάκελος\bittochar.txt','wt');
    
    for i = 1:length(decoded)
        fprintf(fid,'%s\t',decoded{i});
    end
fclose(fid)

length(encoded)

%----------------------ENTROPIA-MESO MIKOS KWDIKA-APODOSI-----------------

meso_mikos_kwdika=eff_calc(dict,prob);
disp(meso_mikos_kwdika)

end


