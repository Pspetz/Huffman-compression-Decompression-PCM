function apodia = apodiamorfwtis(received_signal, kwdikop)
%o apodiamorfwtis pairnei san eisodo to received_signal kai thn 
%kwdikopoihsh kai vriskei thn (apodia: gia ta 4shmata)

%times gia Tsymbol kai Fsymbol
Tsymbol = 4*10^(-6);				
Fsymbol = 1 / Tsymbol; 


%Ferouses times			
Tsample = 0.1*10^(-6);
Tc = 0.4*10^(-6);
Fc = 1 / Tsymbol;	
%energeia
Es = 1;



%orthogonios palmos 
g = sqrt(2 * Es / Tsymbol);
%m
[m,Tsymbol ]= size(received_signal);

%demodulation
if kwdikop == 'FSK'
    for i = 1: 4
        for t = 1: Tsymbol
            %Fsymbol=1/Tsymbol
            y(i, t) = g * cos(2 * pi * ( Fc + i * Fsymbol*m) * t);
        end
    end

    % upologismos twn 2 stoixeiwn
    apodia = received_signal * y';
end