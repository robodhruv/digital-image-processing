%% Q3. Patch-based Filtering
% Dhruv Ilesh Shah, Bhavesh Thakkar and Dhanvi Sreenivasan

%% myPatchBasedFiltering.m
% <include>myPatchBasedFiltering.m </include>


%% Results

im = load('../data/barbara.mat');
img = im.imageOrig;
noise = randn(size(img, 1)) * 0.05 * max(max(img));
imgn = max(0, img+noise); % Generating noisy image

% im_new = myPatchBasedFiltering(imgn, 57.6, 9, 25)
% Commenting out because it takes quite long. Optimal result displayed
im_new = imread('57.2_barbara.png');

figure('name', 'Patch-Based Filtering on Barbara', 'Position', [100 100 1200 400])
colormap('gray');
subplot(1, 3, 1), imagesc(img)
subplot(1, 3, 2), imagesc(imgn)
subplot(1, 3, 3), imagesc(im_new)



%% Mask used for isotropy of patches
% The mask can be seen as the variable defined as "patch_isotropy" in the
% function. This is used to weigh the pixels in the patches.

patch_isotropy = fspecial('gaussian', [9 9], 5); % Standard Deviation chosen randomly
figure, imagesc(patch_isotropy)
colormap('gray')

%% RMSD
% After iterating over a large range of possible RMSDs, the optimal RMSD
% was found at h = 57.60
rmsd = 0.04101;


%% Comparing RMSD
% For other points close to optimal point, the RMSD was found as:

{'h', 'RMSD';[51.8], [0.0574]; [63.4],[0.0429]}



%% Thorough analysis of the PBL Filter
% More results from the analysis of the patch-based filter can be found
% here:
% <https://drive.google.com/drive/folders/0B3AJ0qIoMnDsUVU4YkM1blFoSk>