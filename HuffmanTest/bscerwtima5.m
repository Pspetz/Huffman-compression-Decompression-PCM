A1=double(i(:));
[p,symbols]=hist(A1,unique(A1));

p=p/sum(p);

C=num2cell(symbols);

transpoC = reshape(C,[1 247]);


symbols={};
for i=1:length(transpoC)
    for j=1
       symbols{i}=string(transpoC(j,i));
    end
end
dict=Huffmandictionary(symbols,p);

%------------------Duadiko simetriko kanali------------------------------%

NEW=dict.bitofsymbol;
newfile="";
x=[];
for i=1:length(NEW)
    for j=1
        x(j,i)=string(NEW(j,i));
        
    end 
end

ndata = bsc(x,p)