function [xq,centers,D] = vecQuant(x,N,min_value,max_value,Kmax)

%epipeda kbantisis
levels = 2 ^ N;

%arxikopoihseis
new_x=zeros(size(x));
xq=zeros(size(x));

centers=zeros(levels,1);
new_centers=zeros(levels,1);

oria_zwnis = zeros(levels-1,1);
%paramorfwsi
D = zeros(Kmax,1);

%kanonikopoihsh eisodou
for j=1:size(x),
    if (x(j) > max_value)
        new_x(j) = max_value;
    elseif (x(j) < min_value)
        new_x(j) = min_value;
    else
        new_x(j) = x(j);
    end
end


%arxikopoioume ta oria zwnwn
for j = 1 : (levels-1)
    oria_zwnis(j) = j*(max_value - min_value) / levels;
end
oria_zwnis=flipud(oria_zwnis);


if numel(new_x(new_x<=max_value & new_x>oria_zwnis(1))) > 0 
    % an to x anhkei sto max vres to kentro
new_centers(1) = mean(new_x(new_x<=max_value & new_x>oria_zwnis(1)));

else
    new_centers(1) = (oria_zwnis(1)+max_value)/2;%an oxi valto sto kentro
end


if numel(new_x(new_x<=oria_zwnis(levels-1) & new_x>=min_value))
    % an to x anhkei sto min vres to kentro
    new_centers(levels) = mean(new_x(new_x<=oria_zwnis(levels-1) & new_x>=min_value));
else
    %an oxi valto sto kentro
    new_centers(levels) = (oria_zwnis(levels-1)+minv)/2;
end

for j = 2 : (levels-1) %gia oles tis alles zwnes >>
    if numel(new_x(new_x<=oria_zwnis(j-1) & new_x>oria_zwnis(j))) > 0
        new_centers(j) = mean(new_x(new_x<=oria_zwnis(j-1) & new_x>oria_zwnis(j)));
    else
        new_centers(j) = (oria_zwnis(j-1)+oria_zwnis(j))/2;
    end
end

k=2;
D(1) = 0;
D(2) = 1;


 %oso h diafora de peftei katw apo to eps(10.^-16)
while k < Kmax && norm( D(k) - D(k-1) ) >= 10^-16      
    k = k + 1;
    centers=new_centers;
    for j = 1 : (levels-1),
        %epanaypologizw ta akra
        oria_zwnis(j) = (centers(j) + centers(j+1)) / 2; 
    end
    
    %to kbantismeno
    xq(new_x<=max_value & new_x>oria_zwnis(1)) = 1;
    xq(new_x<=oria_zwnis(levels-1) & new_x>=min_value) = levels;

    for j = 2 : (levels-1),
        xq(new_x<=oria_zwnis(j-1) & new_x>oria_zwnis(j)) = j;
    end
    %paramorfwsi
    D(k) = mean( (new_x - centers(xq)) .^ 2 );%

    avg_distortion=D(k)/levels
    
    
    if numel(new_x(new_x<=max_value & new_x>oria_zwnis(1))) > 0
        %ananewnw to akrotato center
        new_centers(1) = mean(new_x(new_x<=max_value & new_x>oria_zwnis(1)));
    else
        new_centers(1) = centers(1);
    end
    if numel(new_x(new_x<=oria_zwnis(levels-1) & new_x>=min_value))
        %ananewnw to katwtato center
        new_centers(levels) = mean(new_x(new_x<=oria_zwnis(levels-1) & new_x>=min_value));
    else
        new_centers(levels) = centers(levels);
    end
   
    for j = 2 : (levels-1)
        if numel(new_x(new_x<=oria_zwnis(j-1) & new_x>oria_zwnis(j))) > 0
            %gia ola ta alla
            new_centers(j) = mean(new_x(new_x<=oria_zwnis(j-1) & new_x>oria_zwnis(j))); 
       else
    
        end
    end
end
D = D';