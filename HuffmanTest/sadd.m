function probability=sadd(symbols,alphabet,prob)


M = containers.Map(alphabet,prob);

probability = M(symbols)
       
end