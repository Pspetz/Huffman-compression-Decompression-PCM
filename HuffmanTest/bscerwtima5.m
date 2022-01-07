%VAZW STO HUFFFMANDICTIONARY TO
%while ( prob ~= 1) 
% kai meta trexw ton kwdika edw!!
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



NEW=dict.bitofsymbol;
newfile="";
x={};
for i=1:length(NEW)
    for j=1
        x(j,i)=(NEW(j,i));
        
    end 
end


%ndata=introduce_bsc_noise(data,newp)
%ndata = bsc(NEW,p)
%for snr=1:70   % in dB

%BW=7000   % ch BW in Hz

%c(snr)=(BW*log10(1+10^(snr/10)))/log10(2)

%end

%hold on 
%plot(c,'r')