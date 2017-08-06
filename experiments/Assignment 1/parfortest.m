clear all
tic
for i = 1:1e6
a = eig(rand(8));
end
toc

clear all
tic
parfor i = 1:1e6
a = eig(rand(8));
end
toc
