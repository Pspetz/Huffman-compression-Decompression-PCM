function symbola = mapper(duadiki_akolouthia, epilogh, gray)
%h sunartisi lamvanei ws orisma mia duadiki akolouthia
%kai metatrepei ta stoixeia se sumvola
%to orisma gray dilwnei ean prokeitai na xrisimopoihthei 
%kwdikopoiontas me 1 , alliws oxi me 0.

size_dyadikou = length(duadiki_akolouthia);

%group ta bits log2
result = mod(size_dyadikou, 2);

%h akolouthia pou diaireite me to log2
div_dyad = duadiki_akolouthia(1 : (size_dyadikou - result), :);

%omadopoihsh tis parapanw akolouthias
result_d = reshape(div_dyad, 2, (size_dyadikou - result) / 2);

%metatropoun tin akolouthia se duadiko kwdika gia kathe oma
for i = 1: (size_dyadikou - result) / 2
    symbola(i) = bin2dec(num2str(result_d(:, i)'));
end 

%metatropi twn upoloipon bit 
if result ~= 0
    symbola(i + 1) = bin2dec(num2str(duadiki_akolouthia(size_dyadikou - result + 1 :size_dyadikou, 1)'));
end


if gray == 1
    symbola = bin2gray(symbola, epilogh, 8);
end

end