function [ output_image ] = myNearestNeighborInterpolation( input_image )
[m n] = size(input_image);
[x y] = meshgrid(1:2*n-1, 1:3*m-2);
y = floor(y/3 + 1);
x = floor((x-1)/2)+1;
ind = sub2ind([m, n], y, x);
output_image = input_image(ind);
end

