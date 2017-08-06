function d = minD_vec(x,y,z)
% Find the min distance between a set of points and the origin
d = sqrt(x.^2 + y.^2 + z.^2);
d = min(d);
% Compute distance for every point
% Get the minimum distance
