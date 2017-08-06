function img = myAHE(org, windowsize)
% Performs Adaptive Histogram Equalization on the input image, with the
% windowsize given by the argument passed.

org = org+1; % Preserving the original blacks of the image
[x, y, k] = size(org);
orgp = zeros(size(org) + 2 * [windowsize, windowsize]);
[xp, yp, k] = size(orgp);
orgp(windowsize+1:xp-windowsize, windowsize+1:yp-windowsize) = org;
img = zeros(size(orgp));
orgp = mat2gray(orgp);

parfor i = windowsize+1:xp-windowsize
    for j = windowsize+1:yp-windowsize
        mypdf = imhist(orgp(i-windowsize:i+windowsize, j-windowsize:j+windowsize));
        mypdf = mypdf(2:end); % Removing the border areas. Setting equal to second entry is by arguments of gradient and continuity 
        mycdf = cumsum(mypdf)...
            / max(cumsum(mypdf));
        img(i, j) = mycdf(max(round(orgp(i, j) * 255), 1));
    end
end
img = img(windowsize+1:xp-windowsize, windowsize+1:yp-windowsize);
