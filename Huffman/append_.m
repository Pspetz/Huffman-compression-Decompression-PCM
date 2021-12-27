function bitofsymbol = append_(bitofsymbol,input_set,input_code)
    for i = 1:length(input_set)
        bitofsymbol{input_set(i)} = strcat(input_code,bitofsymbol{input_set(i)});      
    end
end