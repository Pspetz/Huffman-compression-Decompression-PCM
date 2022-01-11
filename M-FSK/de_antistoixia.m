function eksodos = de_antistoixia(symbols, epilogh, gray)
%h sunartisi pairnei ws eisodo ta sumvola kai ta metatrepei
%apo symvola - > bits
if gray == 1
    symbols = gray2bin(symbols, epilogh, 4);
end

eksodos = dec2bin(symbols);

[grammes, stiles] = size(eksodos);

%kanw reshape tou pinaka me ta bit pou proekupsan 
eksodos = reshape(eksodos', grammes*stiles, 1);
%mono gia binaries
eksodos = double(eksodos) - 48;

end
