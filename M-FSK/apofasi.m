function symbola = apofasi(r, kwdikop,M)
%FORATIS:pairnei to orisma r kai upologizi to
%binary h gray pou prokeitai na stalthei
[z, ~] = size(r);
    
if kwdikop == 'FSK' 
    
 %1 grammi kai stiles oso to megethos twn 
 %apodiamorfomenwn z
	ypol = zeros(1, z);
    

    ypol = [0: 3];
	for j =1: z
		deiktis = logical(round(abs(r(j, :))));
        %ean o pinakas adeios tote
        if isempty(ypol(deiktis))
			symbola(j) = 0;
        else
            %epelekse tin megaliteri timi 
			symbola(j) = max( ypol(deiktis) );
    end
end

	% 4th = 0th
symbola = mod(symbola,M);

end