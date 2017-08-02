function d = minDistance(x,y,z)
% Find the min distance between a set of points and the origin
nPoints = length(x);
d = zeros(nPoints,1);
% Preallocate
for k = 1:nPoints
% Compute distance for every point
d(k) = sqrt(x(k)^2 + y(k)^2 + z(k)^2);
end
d = min(d);
% Get the minimum distance

