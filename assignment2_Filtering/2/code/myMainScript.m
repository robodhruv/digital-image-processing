%% MyMainScript

img = load('../data/barbara.mat');
img = img.imageOrig;
noise = randn(size(img, 1)) * 0.05 * max(max(img));
imgn = max(0, img+noise);

log = zeros([size([3:2:18], 2) size([3:2:18], 2) 2]);
i = 1; j = 1;
for sx = [3:2:18]
    for sr = [3:2:18]
        sx, sr
        tic;
        im_new = bilinear_filter(imgn, [sx, sx, sr]);
        log(i, j, 1) = rmsd(img, im_new);
        log(i, j, 2) = toc;
        j = j + 1;
    end
    i = i + 1;
end