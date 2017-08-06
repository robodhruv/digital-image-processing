%% Q2. Gray Scale Transforms on Images
% Simple gray scale transforms on images.
% Dhruv Ilesh Shah, Dhanvi Sreenivasan and Bhavesh Thakkar

%% A. Linear Contrast Stretching
% <include>myLinearContrastStretching.m</include>

% This function improves contrast by stretching the histogram to the whole
% available color space.
org = imread('../data/barbara.png');
tic;
img = myLinearContrastStretching(org);
toc;

figure('name', 'LinearContrastStretching on Barbara')
colormap(jet(200));
subplot(2, 2, 1), imagesc(org);
title('Barbara')
colorbar;
subplot(2, 2, 2), imagesc(img);
title('After LCS')
colorbar;
subplot(2, 2, 3), imhist(org);
subplot(2, 2, 4), imhist(img);

org = imread('../data/TEM.png');
tic;
img = myLinearContrastStretching(org);
toc;

figure('name', 'LinearContrastStretching on TEM')
colormap(jet(200));
subplot(2, 2, 1), imagesc(org);
title('TEM')
colorbar;
subplot(2, 2, 2), imagesc(img);
title('After LCS')
colorbar;
subplot(2, 2, 3), imhist(org);
subplot(2, 2, 4), imhist(img);

% Since the histogram for most of these image was already quite wide, we cannot appreciate the function of the algorithm. Let's look at this image, instead.
org = imread('satmap.png');
img = myLinearContrastStretching(org);

figure('name', 'LinearContrastStretching on SatMap')
subplot(2, 2, 1), imshow(org)
title('satmap')
subplot(2, 2, 2), imshow(img)
title('After LCS')
subplot(2, 2, 3), imhist(org)
subplot(2, 2 ,4), imhist(img)


org = imread('../data/canyon.png');
tic;
img = myLinearContrastStretching(org);
toc;

figure('Position', [100 100 1500 600], 'name', 'LinearContrastStretching on Canyon')
colormap(jet(200));
subplot(3, 4, 1), imshow(org);
title('Canyon');
subplot(3, 4, 5), imshow(img);
title('After LCS');
subplot(3, 4, 2), imagesc(org(:,:,1));
title('Channel 1')
colorbar;
subplot(3, 4, 6), imagesc(img(:,:,1));
colorbar;
subplot(3, 4, 3), imagesc(org(:,:,2));
title('Channel 2')
colorbar;
subplot(3, 4, 7), imagesc(img(:,:,2));
colorbar;
subplot(3, 4, 4), imagesc(org(:,:,3));
title('Channel 3')
colorbar;
subplot(3, 4, 8), imagesc(img(:,:,3));
colorbar;
subplot(3, 4, 10), imhist(img(:,:,1));
subplot(3, 4, 11), imhist(img(:,:,2));
subplot(3, 4, 12), imhist(img(:,:,3));
%% B. Global Histogram Equalization
% <include>myHE.m</include>

% Evaluating for given grayscale images:
org = imread('../data/barbara.png');
tic;
img = myHE(org);
toc;

figure('name', 'Global HE on Barbara');
colormap(jet(200));
subplot(2, 2, 1), imagesc(org);
colorbar;
subplot(2, 2, 2), imagesc(img);
colorbar;
subplot(2, 2, 3), imhist(org);
subplot(2, 2, 4), imhist(img);


org = imread('../data/TEM.png');
tic;
img = myHE(org);
toc;

figure('name', 'Global HE on TEM');
colormap(jet(200));
subplot(2, 2, 1), imagesc(org);
colorbar;
subplot(2, 2, 2), imagesc(img);
colorbar;
subplot(2, 2, 3), imhist(org);
subplot(2, 2, 4), imhist(img);


% Since the histogram for this image was already quite wide, we are unable
% to appreciate the function of the algorithm. Let's look at this image instead.
org = imread('satmap.png');
img = myHE(org);

figure('name', 'Global HE on SatMap')
subplot(2, 2, 1), imshow(org)
subplot(2, 2, 2), imshow(img)
subplot(2, 2, 3), imhist(org)
subplot(2, 2 ,4), imhist(img)


org = imread('../data/canyon.png');
tic;
img = myHE(org);
toc;

figure('Position', [100 100 1500 600], 'name', 'Global HE on Canyon')
colormap(jet(200));
subplot(3, 4, 1), imshow(org);
title('Original Image');
subplot(3, 4, 5), imshow(img);
title('After Global HE');
subplot(3, 4, 2), imagesc(org(:,:,1));
title('Channel 1')
colorbar;
subplot(3, 4, 6), imagesc(img(:,:,1));
colorbar;
subplot(3, 4, 3), imagesc(org(:,:,2));
title('Channel 2')
colorbar;
subplot(3, 4, 7), imagesc(img(:,:,2));
colorbar;
subplot(3, 4, 4), imagesc(org(:,:,3));
title('Channel 3')
colorbar;
subplot(3, 4, 8), imagesc(img(:,:,3));
colorbar;
subplot(3, 4, 10), imhist(img(:,:,1));
subplot(3, 4, 11), imhist(img(:,:,2));
subplot(3, 4, 12), imhist(img(:,:,3));


%% C. Adaptive Histogram Equalization
% <include>myAHE.m</include>

% Evaluating for the standard images given:
org = imread('../data/barbara.png');
tic
img = myAHE(org, 30); % Taking relevant window
toc
img2 = myAHE(org, 5);
img3 = myAHE(org, 100);

figure('Position', [100 100 700 700], 'name', 'Adaptive HE on Barbara')
colormap(jet(200));
subplot(2, 2, 1), imagesc(org);
title('Barbara')
colorbar;
subplot(2, 2, 2), imagesc(img);
title('W = 30')
colorbar;
subplot(2, 2, 3), imagesc(img2);
title('W = 5')
colorbar;
subplot(2, 2, 4), imagesc(img3);
title('W = 100')
colorbar;


org = imread('../data/TEM.png');
tic
img = myAHE(org, 35); % Taking relevant window
toc
img2 = myAHE(org, 5);
img3 = myAHE(org, 100);

figure('Position', [100 100 700 700], 'name', 'Adaptive HE on TEM')
colormap(jet(200));
subplot(2, 2, 1), imagesc(org);
title('TEM')
colorbar;
subplot(2, 2, 2), imagesc(img);
title('W = 30')
colorbar;
subplot(2, 2, 3), imagesc(img2);
title('W = 5')
colorbar;
subplot(2, 2, 4), imagesc(img3);
title('W = 100')
colorbar;

org = imread('../data/canyon.png');
% Computing AHE independently (Can be incorporated in the function itself, for better results)
img_1 = myAHE(org(:,:,1), 50);
img_2 = myAHE(org(:,:,2), 50);
img_3 = myAHE(org(:,:,3), 50);
img = cat(3, img_1, img_2, img_3);
img2_1 = myAHE(org(:,:,1), 5);
img2_2 = myAHE(org(:,:,2), 5);
img2_3 = myAHE(org(:,:,3), 5);
img2 = cat(3, img2_1, img2_2, img2_3);
img3_1 = myAHE(org(:,:,1), 125);
img3_2 = myAHE(org(:,:,2), 125);
img3_3 = myAHE(org(:,:,3), 125);
img3 = cat(3, img3_1, img3_2, img3_3);

figure('Position', [100 100 1200 700], 'name', 'Adaptive HE on Canyon')
colormap(jet(200));

subplot(3, 4, 1), imshow(img);
title('W = 50');
subplot(3, 4, 5), imshow(img2);
title('W = 5');
subplot(3, 4, 9), imshow(img3);
title('W = 125');
subplot(3, 4, 2), imagesc(img_1);
colorbar;
subplot(3, 4, 3), imagesc(img_2);
colorbar;
subplot(3, 4, 4), imagesc(img_3);
colorbar;
subplot(3, 4, 6), imagesc(img2_1);
colorbar;
subplot(3, 4, 7), imagesc(img2_2);
colorbar;
subplot(3, 4, 8), imagesc(img2_3);
colorbar;
subplot(3, 4, 10), imagesc(img3_1);
colorbar;
subplot(3, 4, 11), imagesc(img3_2);
colorbar;
subplot(3, 4, 12), imagesc(img3_3);
colorbar;

%% C. Contrast Limited Adaptive Histogram Equalization
% <include>myCLAHE.m</include>


% Evaluating for the standard images given:

org = imread('../data/barbara.png');
tic
img = myCLAHE(org, 40, 0.1); % Taking relevant window and thresholds
toc
img2 = myCLAHE(img, 40, 0.05); % Refining the contrast enhancement

figure('Position', [100 100 500 500], 'name', 'Contrast Limited HE on Barbara')
colormap(jet(200));
subplot(1, 3, 1), imagesc(org);
title('Barbara')
colorbar;
subplot(1, 3, 2), imagesc(img);
title('W = 40; T = 0.01')
colorbar;
subplot(1, 3, 3), imagesc(img2);
title('Refined')
colorbar;


e
org = imread('../data/canyon.png');
img_1 = myCLAHE(org(:,:,1), 50, 0.1); % Taking relevant window and thresholds
img_2 = myCLAHE(org(:,:,2), 50, 0.1);
img_3 = myCLAHE(org(:,:,3), 50, 0.1);

img2_1 = myCLAHE(img_1, 50, 0.05); % Refining the contrast enhancement
img2_2 = myCLAHE(img_2, 50, 0.05);
img2_3 = myCLAHE(img_3, 50, 0.05);

figure('Position', [100 100 1200 700],  'name', 'Contrast Limited HE on Canyon'
colormap(jet(200));
subplot(3, 3, 1), imagesc(org(:,:,1));
title('Channel 1')
colorbar;
subplot(3, 3, 2), imagesc(org(:,:,2));
title('Channel 2')
colorbar;
subplot(3, 3, 3), imagesc(org(:,:,3));
title('Channel 3')
colorbar;
subplot(3, 3, 4), imagesc(img_1);
title('W = 50; T = 0.01')
colorbar;
subplot(3, 3, 5), imagesc(img_2);
colorbar;
subplot(3, 3, 6), imagesc(img_3);
colorbar;
subplot(3, 3, 7), imagesc(img2_1);
title('Refined')
colorbar;
subplot(3, 3, 8), imagesc(img2_2);
colorbar;
subplot(3, 3, 9), imagesc(img2_3);
colorbar;

%% Thorough Analysis of AHE/CLAHE
% Results from the thorough analysis of AHE and CLAHE, run with an exhaustive set of parameters can be found in the link given below.

% <https://drive.google.com/drive/folders/0B3AJ0qIoMnDsUVU4YkM1blFoSkk?usp=sharing>
