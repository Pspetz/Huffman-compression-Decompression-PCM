function sym_dia = diamorfwtis(symbola, epilogh,M)
%lamvanei os orisma ton pinaka sumvolwn pou tha metadothei
%to kwdikopoih sumvwna me tin epilogh 
%epistrefei to diamorfomeno sima

%megethos tou pinaka pou exei tin akolouthia metatropis se symbola
megethos = length(symbola);
Tsymbol = 4*10^(-6);				
Fsymbol = 1 / Tsymbol; 


%Ferouses times		

Tsample = 0.1*10^(-6);
Tc = 0.4*10^(-6);
Fc = 1 / Tsymbol;	
Es = 1;		



%orthogonios palmos
g = sqrt(2 * Es / Tsymbol);


sym_dia = [];
new=Tsymbol/Tsample;
%upologismos metadidomenou simatos
if epilogh == 'FSK'
    for i = 1: megethos
        for j = 1: new
            sym_dia(i, j) = g * cos(2 * pi * (Fc + symbola(i) * Fsymbol*M) * j);
        end
    end
end
