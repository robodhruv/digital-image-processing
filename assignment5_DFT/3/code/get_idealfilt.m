function [ filt ] = get_idealfilt( l, D )
% This function generates an ideal LPF of size (h, w) and cut-off frequency D
    filt = zeros(l, l);
    h = fspecial('disk', D);
    h = h / max(max(h));
    h = (h==1);
    filt(l/2-D:l/2+D, l/2-D:l/2+D) = h;
end
