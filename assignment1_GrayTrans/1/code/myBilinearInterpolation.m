function [ scaled_image ] = myBilinearInterpolation( input_image )
input_image = double(input_image);
[m n] = size(input_image);
[x y] = meshgrid(1:2*n-1, 1:3*m-2);
dely = (y-1)/3 - floor((y-1)/3);
delx = (x-1)/2 - floor((x-1)/2);
y = floor(y*m/(3*m-2));
x = floor(x*n/(2*n-1));
y(y<1) = 1;
y(y>m-1) = m-1;
x(x<1) = 1;
x(x>n-1) = n-1;
ind1 = sub2ind([m, n], y, x);
ind2 = sub2ind([m, n], y, x+1);
ind3 = sub2ind([m, n], y+1, x);
ind4 = sub2ind([m, n], y+1, x+1);
scaled_image = input_image(ind1).*(1-dely).*(1-delx) + input_image(ind2).*(1-dely).*delx + input_image(ind3).*dely.*(1-delx) + input_image(ind4).*dely.*delx;