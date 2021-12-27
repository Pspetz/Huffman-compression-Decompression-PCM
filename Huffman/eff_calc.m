function [out_] = eff_calc( dict, prob )
    % upologizei to meso mikos kwdika
    out_ = average_cdl( dict, prob )
    % upologismos tis entropias
    hu = 0;
    for i = 1:length(prob);
        hu = hu - prob(i)*log2(prob(i))
    end
    out_ = hu/out_
   
    
    
end
% sunartisi gia ton upologismo tou mesou mikous kwdika
% E(L)=Σ P(xi)L(xi) Σ=(απο 1 εως το μηκος του symbon) ,P pithanotita,L
% mikos
function out_ = average_cdl( dict, prob )
    out_ = 0;
    for i = 1:length(dict.indexsymb);  %to megethos twn sumvolwn
        out_ = out_ + prob(i)*length(dict.bitofsymbol{i});
    end
end