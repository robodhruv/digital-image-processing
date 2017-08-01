tic
windowsize = 50;
org = imread('../data/barbara.png');
[x, y, k] = size(org)
img = zeros(size(org));

for i = windowsize+1:x-windowsize
    for j = windowsize+1:y-windowsize
        mycdf = cumsum(imhist(org(i-windowsize:i+windowsize, j-windowsize:j+windowsize)))...
            / numel(org(i-windowsize:i+windowsize, j-windowsize:j+windowsize)); % numel fixed at 961
        img(i, j) = mycdf(org(i, j));
    end
    i
end
toc
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