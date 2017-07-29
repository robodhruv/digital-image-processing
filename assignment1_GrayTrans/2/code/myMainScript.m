%% Q2. Gray Scale Transforms on Images
% Simple gray scale transforms on images.

%% A. Linear Contrast Stretching
% <include>myLinearContrastStretching.m</include>

% This function improves contrast by stretching the histogram to the whole
% available color space.
org = imread('../data/barbara.png');
tic;
img = myLinearContrastStretching(org);
toc;


colormap(jet(200));
subplot(2, 2, 1), imagesc(org);
colorbar;
subplot(2, 2, 2), imagesc(img);
colorbar;
subplot(2, 2, 3), imhist(org);
subplot(2, 2, 4), imhist(img);
