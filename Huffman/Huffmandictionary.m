 function dict = Huffmandictionary(alfavito,prob)

    

   
    for i = 1:length( prob )    
        bitofsymbol{i} = '';      % Create an empty codeword.
        indexsymb{i} = i;          % Index the codeword.
        word(i) = alfavito(i);  % Append it's symbol.
    
    end

       
    while ( prob ~=  1 ) % Loop, until we reach the root.
        % Sort the probabilities at every loop.
        [~, z] = sort(prob);  % Get arrangement of the sorted probabilities.
        % Get the index of the two sets to be merged.
        last = z(1);
        next = z(2);
        % Get their main index or indexes.
        deksia_thesi = indexsymb{last};
        aristeri_thesi  = indexsymb{next};
        % Get their probabilities.
        deksia_pithanotita = prob(last); 
        aristeri_pithanotita  = prob(next); 
        % Append them in a new set.
        merged_set = [deksia_thesi, aristeri_thesi];
        new_prob   = deksia_pithanotita + aristeri_pithanotita;
        % Debug logging.
      
            merged_word = strcat(word{last},word{next});
            
            word(z(1:2)) = '';
            word = [word merged_word];
             
       
        % Update probability and symbol sets
        indexsymb(z(1:2)) = '';
        prob(z(1:2))   = '';
        indexsymb = [indexsymb merged_set];
        prob   = [prob new_prob];
        
        % Get the updated codeword.
        bitofsymbol = append_(bitofsymbol,deksia_thesi,'1');
        bitofsymbol = append_(bitofsymbol,aristeri_thesi,'0');
        
        
    end
    
    dict.indexsymb = alfavito;
    dict.bitofsymbol = bitofsymbol;
    fid = fopen('NEWdict.txt','wt');
    
    for i = 1:length(alfavito)
    fprintf(fid,'%s\t',alfavito{i},bitofsymbol{i});
    fprintf(fid,'\n');
    end
fclose(fid)

end

