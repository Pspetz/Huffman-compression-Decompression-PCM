%MESI PARAMORFWSI DIANISMATIKOU KVANTISTI
x = sourceB(10000);
[xq, centers, D] = 	PCM(x, 2, -1, 1);
[idx, C] = kmeans(x, 2);
numClasses=2
meanDistances = zeros(numClasses, 1);
for k = 1 : numClasses
    % Get x and y of centroid.
    xc = C(1);
    yc = C(2);
    % Get the x and y coordinates of points.
    inClass = idx == k; % Indexes of points that were assigned to this class.
    a = x(1); % Get not ALL x, but just x(1)
    y = x(2); % Get not ALL y, but just x(2)
    % Get distances of all points in the class to the centroid for this class.
    distances = sqrt((a - xc) .^ 2 + (y - yc) .^ 2);
    disp("mean distance:");
    meanDistances(k) = mean(distances)
end

x = sourceB(10000);
[xq, centers, D] = 	PCM(x, 3, -1, 1);
[idx, C] = kmeans(x, 3);
numClasses=3
meanDistances = zeros(numClasses, 1);
for k = 1 : numClasses
    xc = C(1);
    yc = C(2);
    inClass = idx == k; 
    a = x(1); 
    y = x(2); 
    distances = sqrt((a - xc) .^ 2 + (y - yc) .^ 2);
    disp("mean distance:");
    meanDistances(k) = mean(distances)
end

x = sourceB(10000);
[xq, centers, D] = 	PCM(x, 4, -1, 1);
[idx, C] = kmeans(x, 4);
numClasses=4
meanDistances = zeros(numClasses, 1);
for k = 1 : numClasses
    xc = C(1);
    yc = C(2);
    inClass = idx == k; 
    a = x(1); 
    y = x(2);
    distances = sqrt((a - xc) .^ 2 + (y - yc) .^ 2);
    disp("mean distance:");
    meanDistances(k) = mean(distances)
end

