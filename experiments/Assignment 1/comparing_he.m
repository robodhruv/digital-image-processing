tic
for i = 1:size(org, 1)
    for j = 1:size(org, 2)
        img(i, j) = y(org(i, j));
    end
end
toc

tic
img = arrayfun(@(x)(y(x)), org);
toc