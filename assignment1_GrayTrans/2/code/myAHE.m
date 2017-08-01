tic
windowsize = 10;
org = imread('../data/TEM.png');
[x, y, k] = size(org);
orgp = zeros(size(org) + 2 * [windowsize, windowsize]);
[xp, yp, k] = size(orgp);
orgp(windowsize+1:xp-windowsize, windowsize+1:yp-windowsize) = org;
img = zeros(size(orgp));
orgp = mat2gray(orgp);

for i = windowsize+1:xp-windowsize
    for j = windowsize+1:yp-windowsize
        mypdf = imhist(orgp(i-windowsize:i+windowsize, j-windowsize:j+windowsize));
        mypdf(1) = mypdf(2); % Removing the border areas. Setting equal to second entry is by arguments of gradient and continuity 
        mycdf = cumsum(mypdf)...
            / max(cumsum(mypdf));
        img(i, j) = mycdf(max(round(orgp(i, j) * 255), 1));
    end
    i
end
toc
img = img(windowsize+1:xp-windowsize, windowsize+1:yp-windowsize);

% 
% tic
% windowsize = 20;
% org = imread('../data/barbara.png');
% [x, y, k] = size(org)
% img = zeros(size(org));
% ia = [1:x];
% ja = [1:y];
% 
% img = arrayfun(@(i, j)ahe_core(i, j, windowsize, org), ia, ja);
% toc;