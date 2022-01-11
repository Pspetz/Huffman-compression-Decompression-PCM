function [BER , SER] = simulation(in_binary_seq, epilogi, SNR, gray)
% Simulates the M-PAM mod-demod
 sa = antistoixia(in_binary_seq, epilogi , gray);
 sig_m = diamorfwtis(sa, epilogi);
 received_signal = thoribos(sig_m,SNR);
 
 
 r = apodiamorfwtis(received_signal,kwdikop);
 E = apofasi(r, kwdikop); 
 out_binary_seq = de_antistoixia(E', epilogi, gray);
 BER = biterror(in_binary_seq,out_binary_seq);
 if nargout >= 2
 SER = symbolerror(sa, E);
 end
end
