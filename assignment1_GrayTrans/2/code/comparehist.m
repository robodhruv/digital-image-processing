org = imread('satmap.png');

tic
y1 = imhist(org);
toc

tic
orgr = reshape(org, [], 1);
y2 = hist(orgr, 0:255);
toc