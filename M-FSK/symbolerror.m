function SER = symbolerror(eisodoss, eksodoss)
% upologizei to symbol error rate
 SER = nnz(eksodoss' - eisodoss);
end