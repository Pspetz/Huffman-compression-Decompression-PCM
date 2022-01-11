
%counters 
counter1=1;
counter2 = 1;
bit_eisodou = 10^4;


Pb(counter2, 1) = 0;


BER_fsk(counter1, 1) = 0;
for SNR = 0:2:8
    M=12;
    dyadikif = eisodos_dyadiki(bit_eisodou);
    symbolaf = antistoixia(dyadikif, 'FSK', 0);
    sym_diaf = diamorfwtis(symbolaf, 'FSK',M);
    
    enthoribof = thoribos(sym_diaf ,SNR,M);
    apodiamf = apodiamorfwtis(enthoribof, 'FSK');
    symbolsf = apofasi(apodiamf, 'FSK',M);
    eksodosf = de_antistoixia(symbolsf, 'FSK', 0);
    
    BER_fsk(counter1, 1) = biterror(dyadikif, eksodosf);
     
   
    
    counter1 = counter1 + 1;
    
    
end


s_N_R = [0: 2: 8];
semilogy(s_N_R', Pb, 'Y.-');
hold on;
semilogy(s_N_R', BER_fsk, 'm.-');

legend('ber  4-FSK');
title(' 4-FSK ');
xlabel('SNR');
ylabel('BER');
hold;




