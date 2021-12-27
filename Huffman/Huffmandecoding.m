function deco = Huffmandecoding( sig, dict  )

    deco = []; % Output signal vector initialize.
    sig_ = sig;
    codepos_ = 1;
    while( ~isempty(sig_) ) % For each set of bits in the signal.
        temp_ = sig_(codepos_); % Get first bit(char). 
        dictb = dict; % Get a backup of the input dictionary.
        while (1) % Loop
            [flag,dict_] = found_match( temp_, codepos_, dictb); % Get a sub dictionary.
            if ( flag == 0 ) % If there is an error at the encoded word.
                error('The encoded signal contains a code which is not present in the dictionary.');
            end
            dictb = dict_; % Update loop dictionary.
            if ( length(dictb.bitofsymbol) ~= 1 ) % Until one codeword left.
                codepos_ = codepos_ + 1;   % Match second bit(char).
                temp_ = sig_(codepos_);    % Get first char 
            else % Found the symbol
                
                codepos_ = 1; % Reset position.
                sig_ = sig_(length(dictb.bitofsymbol{1})+1:end); % Update the input signal.
                break;
            end        
        end
        %deco = [deco ,dictb.symbol];
       deco =  strcat( deco,dictb.indexsymb );
        % Append char to decoded signal.
    end
  
end

    function [flag,dict_] = found_match( code, pos, dict )
        dict_.indexsymb={}; dict_.bitofsymbol={}; % Create a dictionary structure.
        j = 1;    % Iterator.
        flag = 0; % Flag for error.
        for i = 1:length(dict.bitofsymbol) % For each code in dictionary.
            if ( strcmp(dict.bitofsymbol{i}(pos), code) ) % If inpute code matches 
                 flag = 1; % No error match.
                 dict_.indexsymb(j) = dict.indexsymb(i); % Get the symbol that matches.
                 dict_.bitofsymbol(j) = dict.bitofsymbol(i);     % Get the code of the matched symbol.
                 j = j + 1;                        % Prepare for a next symbol.
            end
        end
    end