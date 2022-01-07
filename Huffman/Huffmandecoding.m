function deco = Huffmandecoding( sig, dict  )

    deco = []; % output vector 
    sig_ = sig;
    codepos_ = 1;
    while( ~isempty(sig_) ) 
        temp_ = sig_(codepos_); 
        dictb = dict; 
        while (1) 
            [flag,dict_] = found_match( temp_, codepos_, dictb); 
            if ( flag == 0 ) 
                error('The encoded signal contains a code which is not present in the dictionary.');
            end
            dictb = dict_; % update dictionary
            if ( length(dictb.bitofsymbol) ~= 1 ) 
                codepos_ = codepos_ + 1;   
                temp_ = sig_(codepos_);   
            else 
                
                codepos_ = 1; 
                sig_ = sig_(length(dictb.bitofsymbol{1})+1:end); 
                break;
            end        
        end
        %deco = [deco ,dictb.symbol];
       deco =  strcat( deco,dictb.indexsymb );
        % Append char to decoded signal.
    end
  
end

    function [flag,dict_] = found_match( code, pos, dict )
        dict_.indexsymb={}; dict_.bitofsymbol={}; 
        j = 1;    
        flag = 0; 
        for i = 1:length(dict.bitofsymbol) 
            if ( strcmp(dict.bitofsymbol{i}(pos), code) ) 
                 flag = 1; % No error match.
                 dict_.indexsymb(j) = dict.indexsymb(i); 
                 dict_.bitofsymbol(j) = dict.bitofsymbol(i);    
                 j = j + 1;  % Prepare for a next symbol.
            end
        end
    end