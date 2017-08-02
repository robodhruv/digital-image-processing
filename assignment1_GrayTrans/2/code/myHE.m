function img = myHE(org)
% Performs global histogram equalization on the input image. Works for any
% number of channels.

mycdf = zeros(256, size(org, 3)); % Treating channels independently
for i = 1:size(org, 3)
    mycdf(:, i) = cumsum(imhist(org(:,:,i))) / numel(org(:,:,1));
end

%img = arrayfun(mycdf(y, x), org);
% arrayfun is not sped up by JIT compilation, and considerably slower in
% this simple case, compared to naive loops. (ambiguous)

img = zeros(size(org)); % Pre-allocating
for k = 1:size(org, 3)
    % Computing independently for each channel
    cdfi = mycdf(:,k);
    img(:,:,k) = cdfi(org(:,:,k) + 1);
end