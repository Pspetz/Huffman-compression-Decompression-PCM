 function dict = Huffmandictionary(alfavito,prob)

    


    for i = 1:length( prob )    
        bitofsymbol{i} = '';     
        indexsymb{i} = i;          
        word(i) = alfavito(i); 
    
    end

       
    while ( prob ~= 289.1403 ) 
       
        [~, z] = sort(prob);
       
        last = z(1);
        next = z(2);
       
        deksia_thesi = indexsymb{last};
        aristeri_thesi  = indexsymb{next};
        
        deksia_pithanotita = prob(last); 
        aristeri_pithanotita  = prob(next); 
       
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
    fid = fopen('C:\Users\User\Documents\MATLAB\Νέος φάκελος\NEWdict.txt','wt');
    
    for i = 1:length(alfavito)
    fprintf(fid,'%s\t',alfavito{i},bitofsymbol{i});
    fprintf(fid,'\n');
    end
fclose(fid)

end

