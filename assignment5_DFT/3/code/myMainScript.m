%% Q3. Notch Filter
% Author: Dhruv Ilesh Shah, DHanvi Sreenivasan and Bhavesh Thakkar

%% Log-plot of the Fourier Transform

load('../data/image_low_frequency_noise.mat');
h = size(Z, 1);
Zpad = padarray(Z, [h/2, h/2], 0, 'both');

Fimg = fft2(Zpad);
Fimg_shifted = fftshift(Fimg);
Flog = log(abs(Fimg_shifted) + 1);
figure('name', 'Log-plot of Fourier Transform', 'Position', [100, 100, 800, 800]), imagesc(Flog)
colormap(jet)

%% Identifying Noise
% For this part, we run impixelinfo on the log-Fourier of the image and
% notice two abnormal peaks as shown below

noisy_f = [247, 237; 267, 277]; % Observed
viscircles(noisy_f, [8; 8]);

%% Ideal Notch Filter
% We see that the noise frequencies are almost pure (upto 2-pixel) impulses,
% and we use an ideal cross-hair notch of pixel-size 3

noisy_sub = sub2ind(size(Fimg_shifted), noisy_f(:, 2), noisy_f(:, 1));
notch_filter = ones(size(Fimg_shifted));
notch_filter(noisy_sub) = 0;
se = strel('disk', 2, 8);
notch_filter = imerode(notch_filter, se);
%notch_filter = imerode(notch_filter, se);
%notch_filter = imerode(notch_filter, se);
notch_filter = imerode(notch_filter, se);
notch_filter = imerode(notch_filter, se);
notch_filter = imerode(notch_filter, se); % A simple trick to an ideal circular notch

figure('name', 'Visualising the Notch Filter', 'Position', [100, 100, 500, 500])
imagesc(Flog.*notch_filter);
colormap(jet)
title('Log-Fourier plot, after notching')

Fimg_rec = Fimg_shifted.*notch_filter; % Setting the noisy frequencies to zero
img_rec_pad = ifft2(ifftshift(Fimg_rec));
img_rec = img_rec_pad(h/2+1:3*h/2, h/2+1:3*h/2);

figure('Position', [100, 100, 1300, 800])
subplot(1, 2, 1), imshow(mat2gray(Z));
title('Original Image')
subplot(1, 2, 2), imshow(mat2gray(img_rec));
title('Recovered Image')