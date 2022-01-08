function [xq, centers, D] = PCM(x, N, min_value, max_value);

s = size(x);
s = s(1);

if min(x) < min_value
    for i=1:s
        if x(i) < min_value
            x(i) = min_value;
        end
    end
end
if max(x) > max_value
    for i=1:s
        if x(i) > max_value
            x(i) = max_value;
        end
    end
end
range = max_value - min_value;
levels = 2 ^ N;
step = range/levels;
%Υπολογισμός των centers 
centers = [];
centers(1) = max_value - step/2;
for i=2:levels
    centers(i) = centers(i-1) - step;
end

xq = [];

%xrisimopoioume tin min gia thn antistoixisi twn shmeiwn sta kentra.
%epistrefi 
% τον δείκτη της πλησιέστερης 
%τιμής της τιμής μας με αυτόν τον τρόπο.
for i=1:s
    [distance index] = min(abs(centers - x(i)));
    xq(i) = index;
end

% transpose
xq = xq';


%thelw to normal-side-up
centers = flip(centers);
%min max values eswterika
centers = [min_value centers max_value];

% D arxeio katagrafis tis paramorfosis
D = [0 1];

%H loop tou main algorithmou
k = 2;
while abs(D(k) - D(k-1)) >= eps
    xq = [];
    total = 0;
    counted   = zeros(length(centers));
    cond_mean = zeros(length(centers));

    % ypologismos zwnwn kvantopoihshs
    T = [];
    T(1) = min_value;
    for i=2:(length(centers)-2)
        T(i) = (centers(i) + centers(i+1))/2;
    end
    T(i+1) = max_value;
    for i=1:s
       % Επανάληψη στις ζώνες για να βρεθεί η σωστή
        for j=1:(length(T)-1)
            if T(j) < x(i) && x(i) <= T(j+1)
                % to apotelesma
                xq(i) = j;
                % calculate the mean distance from the center.
                total = total + abs(centers(j+1) - x(i));
               % Πρέπει επίσης να βρούμε τον μέσο όρο για τις επόμενες ζώνες.
                cond_mean(j) = cond_mean(j) + x(i);
                counted(j)   = counted(j) + 1;
            end
        end
        if x(i) == T(1)
            % Almost the same stuff as above.
            xq(i) = 1;
            total = total + abs(centers(2) - x(i));
            cond_mean(1) = cond_mean(1) + x(i);
            counted(1)   = counted(1) + 1;
        end
    end
    %MESI PARAMORFOSI
    avg_distortion = total/s
    D = [D avg_distortion];
    k = k + 1;

    % Βρίσκοντας τα νέα κέντρα.
    for j=2:(length(centers)-1)
        if counted(j-1) ~= 0
            centers(j) = cond_mean(j-1)/counted(j-1);
        end
    end
end

% Διαγραφή των απαιτούμενων έως τώρα επιπλέον τιμών, 
%στο διάνυσμα καταγραφής παραμόρφωσης.
% Τώρα D(i) είναι η μέση παραμόρφωση της i-ης επανάληψης.
D(1) = [];
D(2) = [];

% Διορθώστε επίσης το διάνυσμα «κέντρων».
centers(1) = [];
centers(length(centers)) = [];

% We have it transposed.
xq = xq';

fprintf('Successfully exited after %d iterations.\n', k-2);