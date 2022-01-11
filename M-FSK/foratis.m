function symbola = apofasi(r, kwdikop)

[grammes, ~] = size(r);
    
if kwdikop == 'FSK'
	ypol = zeros(1, grammes);
    ypol = [0: 3];
	for j =1: grammes
		deiktis = logical(round(abs(r(j, :))));
        if isempty(ypol(deiktis))
			symbola(j) = 0;
		else
			symbola(j) = max( ypol(deiktis) );
    end
end

	% 4th = 0th
symbola = mod(symbola,4);

end