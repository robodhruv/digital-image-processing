%% MyMainScript

img = load('../data/barbara.mat');
img = img.imageOrig;
noise = randn(size(img, 1)) * 0.05 * max(max(img));
imgn = max(0, img+noise);

sx = [3:2:18];
sr = [3:2:18];
logger = zeros([numel(sx) numel(sr) 2]);
for x = 1:numel(sx)
	for r = 1:numel(sr)
        x, r
        tic;
        im_new = bilinear_filter(imgn, [sx(x), sx(x), sr(r)]);
        logger(x, r, 1) = rmsd(img, im_new);
        logger(x, r, 2) = toc;
		imwrite(im_new, strcat('benchmark/', num2str(sx(x)), '_', num2str(sr(r)), '_barbara.png'));
	end
end

save('benchmark/workspace.mat');
