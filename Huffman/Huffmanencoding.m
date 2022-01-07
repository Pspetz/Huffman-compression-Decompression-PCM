function enco = Huffmanencoding(sig,dict)

   enco = ''; 
    while( ~isempty(sig) ) 
        bitvalues = ''; 
        for j = 1 : length(dict.indexsymb) 
           
             if( strcmp(sig(1),dict.indexsymb{j}) ) 
                 bitvalues = dict.bitofsymbol{j};
                 break;
             end
        end
    
        enco = strcat( enco,bitvalues );
        sig = sig(2:end); 
      
    end  
    
  

end
