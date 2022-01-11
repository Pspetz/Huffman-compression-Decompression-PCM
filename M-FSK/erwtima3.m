
%counters 
counter1=1;
bit_eisodou = 10^4;

BER_fsk1(counter1, 1) = 0;
for SNR = 0:5:40
    M=2;
    dyadikif = eisodos_dyadiki(bit_eisodou);
    symbolaf = antistoixia(dyadikif, 'FSK', 0);
    sym_diaf = diamorfwtis(symbolaf, 'FSK',M);
    
    enthoribof = thoribos(sym_diaf ,SNR,M);
    apodiamf = apodiamorfwtis(enthoribof, 'FSK');
    symbolsf = apofasi(apodiamf, 'FSK');
    eksodosf = de_antistoixia(symbolsf, 'FSK', 0);
    
    BER_fsk1(counter1, 1) = biterror(dyadikif, eksodosf);
     
   
    
    counter1 = counter1 + 1;
    
    
end

%---------------------------------------------
%counters 
counter3=1;
bit_eisodou2 = 10^4;

BER_fsk2(counter3, 1) = 0;
for SNR = 0:5:40
    M=4;
    dyadikif = eisodos_dyadiki(bit_eisodou2);
    symbolaf = antistoixia(dyadikif, 'FSK', 0);
    sym_diaf = diamorfwtis(symbolaf, 'FSK',M);
    
    enthoribof = thoribos(sym_diaf ,SNR,M);
    apodiamf = apodiamorfwtis(enthoribof, 'FSK');
    symbolsf = apofasi(apodiamf, 'FSK');
    eksodosf = de_antistoixia(symbolsf, 'FSK', 0);
    
    BER_fsk2(counter3, 1) = biterror(dyadikif, eksodosf);
     
    counter3 = counter3 + 1;
    

end


%---------------------------%
%counters 
counter5=1;
bit_eisodou2 = 10^4;


BER_fsk3(counter5, 1) = 0;
for SNR = 0:5:40
    M=8;
    dyadikif = eisodos_dyadiki(bit_eisodou2);
    symbolaf = antistoixia(dyadikif, 'FSK', 0);
    sym_diaf = diamorfwtis(symbolaf, 'FSK',M);
    
    enthoribof = thoribos(sym_diaf ,SNR,M);
    apodiamf = apodiamorfwtis(enthoribof, 'FSK');
    symbolsf = apofasi(apodiamf, 'FSK');
    eksodosf = de_antistoixia(symbolsf, 'FSK', 0);
    
    BER_fsk3(counter5, 1) = biterror(dyadikif, eksodosf);
     
   
    
    counter5=counter5+1;
    
end


%-----------------PLOT----------------
s_N_R1 = [0: 5: 40];
semilogy(s_N_R1', BER_fsk1, 'm.-',s_N_R1', BER_fsk2, 'b.-',s_N_R1', BER_fsk3, 'k.-');
legend('ber M=2 4-FSK',"ber M=4 4-FSK'","ber M=8 4-FSK'");
title(' M-FSK ');
xlabel('SNR');
ylabel('BER');






