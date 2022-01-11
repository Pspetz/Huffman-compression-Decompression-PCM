function ber = biterror(eisodos, eksodos)
%upologizei to error rate(BER)

len = length(eisodos);

diairesi = mod(len, 2);

%recover apo tin apostoli perisoteron bits
if diairesi ~= 0
%upologismos olwn ton reduntant bits tis eksodou
epipleon = 2 - diairesi;
eisodos(len + epipleon) = eisodos(len);
eisodos(len) = 0;
end


ber = sum(eisodos ~= eksodos)/length(eksodos);

end
    