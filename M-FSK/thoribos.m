function en_noise = thoribos(signal_diadosis, snr,M)
%h sunartisi pairnei ws orisma to sima diadosis kai h metadosi
%tou snr kai prosthetei AWG
%energeia
Es = 1; 
Eb = Es / log2(M);
No = Eb / (10^(snr/10));
[y,t] = size(signal_diadosis);
% dimiourgoume gaussian katanomi me mesi timh
n = 0;
%tupiki apoklisi
s = sqrt(No / 2);
%randn thorivou
thorubos = n + s * randn(y, t);
%paragei AWGN noise
en_noise = signal_diadosis + thorubos;

end