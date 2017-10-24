%% Q6. PCA based denoising and Bilateral filtering
% Bhavesh Thakkar, Dhanvi Sreenivasan and Dhruv Ilesh Shah

%% myPCADenoising1.m
% <include>myPCADenoising1.m</include>

%% myPCADenoising2.m
% <include>myPCADenoising2.m</include>

%% MainScript

image = imread('../data/barbara256.png');
image = double(image);
noisy_image = image + randn(size(image))*20;

tic;
img1 = myPCADenoising1(noisy_image);
MSE1 = sum(sum( (image-img1).^2))/(size(image,1)*size(image,2));
toc;

tic;
img2 = myPCADenoising2(noisy_image);
MSE2 = sum(sum( (image-img2).^2))/(size(image,1)*size(image,2));
toc;

tic;
img3 = myBilateralFiltering(noisy_image,[8 8 10]);
MSE3 = sum(sum( (image-img3).^2))/(size(image,1)*size(image,2));
toc;


%% Plot

figure('Position',[100, 100, 1200, 1200]);

subplot (3,2,1);
imshow(image,[]);
title('Original Image')

subplot (3,2,2);
imshow(noisy_image,[]);
title('Noisy Image')

subplot (3,2,3);
imshow(img1,[]);
title(strcat('Global PCA denoising. MSE = ', num2str(MSE1)))

subplot (3,2,4);
imshow(img2,[]);
title(strcat('PCA denoising with L = 200. MSE = ', num2str(MSE2)))

subplot (3,2,5);
imshow(img2,[]);
title(strcat('Bilateral Filtering. MSE = ', num2str(MSE3)))

%% Differences between Bilateral and PCA
% 6)c)
% PCA based denoising methods do better than bilateral filtering(in terms of MSE). The mean square errors have been shown in the
% figure. PCA filter takes into account the signal/noise estimate while
% updating the eigencoefficeints (i.e does not change much the coefficients
% having high singal-noise ratio and reduces the coefficients having low
% signal to noise ratio) while bilateral filter does not do anything of
% this sort( i.e does not give any consideration to the noise
% characteristic). 

