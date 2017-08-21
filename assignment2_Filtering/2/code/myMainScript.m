%% Q2. Bilateral Filtering
% This function implements the fast bilateral filter, as suggested by
% Sylvian Paris. The standard deviation can be chosen to convenience.
% Dhruv Ilesh Shah, Bhavesh Thakkar and Dhanvi Sreenivasan

%% myBilateralFiltering.m
% <include>myBilateralFiltering.m</include>

%% Results

im = load('../data/barbara.mat');
img = im.imageOrig;
noise = randn(size(img, 1)) * 0.05 * max(max(img));
imgn = max(0, img+noise); % Generating noisy image
std = [8, 8, 10]; % Values optimised for minimum RMSD
im_new = myBilateralFiltering(imgn, std);

figure('name', 'Bilateral Filtering on Barbara', 'Position', [100 100 1200 400])
colormap('gray');
subplot(1, 3, 1), imagesc(img)
subplot(1, 3, 2), imagesc(imgn)
subplot(1, 3, 3), imagesc(im_new)

%% The Kernel
% The function uses Matlab's imgaussfilt3. To represent just the spatial
% gaussian for the optimal case, we have \sigma_s = 8. This gives the
% following spatial kernel.

h = fspecial('gaussian', [17 17], 8);
figure, imagesc(h)
colormap('gray')

%% Optimal Parameters
% For the image given, with spatial dimensions 512x512 and image-space
% ranging from 0 to 100, the optimal parameters for BL filter were found to
% be \sigma_s = 8 and \sigma_r = 10. For this case, minimum RMSD was
% observed as given below.

disp(rmsd(im_new, img))


%% Comparing RMSD
% For other points close to optimal point, the RMSD was found as:
{'\sigma_s','\sigma_r', 'RMSD';[7.2], [10], [0.0574]; [8.8],[10],[0.0637];[8],[9],[0.0561]; [8],[11],[0.068]}

