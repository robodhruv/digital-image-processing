%% Q2. Bilateral Filtering

img = load('../data/barbara.mat');
img = img.imageOrig;
noise = randn(size(img, 1)) * 0.05 * max(max(img));
imgn = max(0, img+noise);

