function img = myCLAHE(org, windowsize, threshold)
% Performs Contrast Limited Adaptive Histogram Equalization on the input
% image, with the windowsize and threshold passed given by the argument passed.

org = org+1; % Preserving the original blacks of the image
[x, y, k] = size(org);
orgp = zeros(size(org) + 2 * [windowsize, windowsize]);
[xp, yp, k] = size(orgp);
orgp(windowsize+1:xp-windowsize, windowsize+1:yp-windowsize) = org;
img = zeros(size(orgp));
orgp = mat2gray(orgp);

for i = windowsize+1:xp-windowsize
    for j = windowsize+1:yp-windowsize
        mypdf = imhist(orgp(i-windowsize:i+windowsize, j-windowsize:j+windowsize));
        mypdf = mypdf(2:end); % Removing the border areas. Setting equal to second entry is by arguments of gradient and continuity
        num_el = max(cumsum(mypdf));
        mypdf_clipped = min(mypdf, threshold*num_el);
        num_el_clipped = max(cumsum(mypdf_clipped));
        mypdf_clipped = mypdf_clipped + (num_el_clipped - num_el)/255;
        mycdf = cumsum(mypdf_clipped)...
            / num_el;
        img(i, j) = mycdf(max(round(orgp(i, j) * 255), 1));
    end
end
img = img(windowsize+1:xp-windowsize, windowsize+1:yp-windowsize);