%% MyMainScript

img = load('../data/barbara.mat');
im = img.imageOrig;
noise = randn(size(im, 1)) * 0.05 * max(max(im));
imgn = max(0, im+noise);

s = [55:0.2:70];
logger = zeros([numel(s) 2]);
for x = 1:numel(s)
        disp(x)
        tic;
        im_new = patchbased(imgn, s(x), 9, 25);
        logger(x, 1) = rmsd(img.imageOrig, im_new)
		logger(x, 2) = toc;
		imwrite(mat2gray(im_new), strcat('benchmark/', num2str(s(x)), '_barbara.png'));
end

save('benchmark/workspace.mat');
