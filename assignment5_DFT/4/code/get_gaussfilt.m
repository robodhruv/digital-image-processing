function [ filt ] = get_gaussfilt( h, sigma )
% This function generates a Gaussian filter of size h and standard
% deviation sigma, in pixels
    filt = fspecial('gaussian', h, sigma);
    filt = filt / max(max(filt));
end

