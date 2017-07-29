function img = myHE(org)
% Performs global histogram equalisation on the input image
% One-D for now

mycdf = zeros(256, size(org, 3));
for i = 1:size(org, 3)
    mycdf(:, i) = cumsum(imhist(org(:,:,i))) / (size(org, 1) * size(org, 2));
end

%img = arrayfun(mycdf(y, x), org);
% arrayfun is not sped up by JIT compilation, and considerably slower in
% this simple case, compared to naive loops.

img = zeros(size(org)); % Pre-allocating
for k = 1:size(org, 3)
	for i = 1:size(org, 1)
        for j = 1:size(org, 2)
            if org(i, j, k)==0
                img(i, j, k) = 0;
            else
                img(i, j, k) = mycdf(org(i, j, k), k);
            end
        end
	end
end