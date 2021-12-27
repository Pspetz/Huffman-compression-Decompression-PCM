function enco = Huffmanencoding(sig,dict)

   enco = ''; % Empty encoded signal (char).
    while( ~isempty(sig) ) % Loop for each signal value.
        bitvalues = ''; % Empty signal value (char).
        for j = 1 : length(dict.indexsymb) 
            % Search sequentially through the dictionary to
            % find the proper code for the given signal.
             if( strcmp(sig(1),dict.indexsymb{j}) ) % If there is a match.
                 bitvalues = dict.bitofsymbol{j};
                 break;
             end
        end
    
        enco = strcat( enco,bitvalues ); % Append the code to the encryption message.
        sig = sig(2:end); % Update the signal vector.
      
    end  
    
  

end
