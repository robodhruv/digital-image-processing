%% Q1. Harris Corner Detection
% Corner detection on images.
% Done by Bhavesh Thakkar, Dhanvi Sreenivasan and Dhruv Ilesh Shah.
%% Harris Corner Detector
% <include>myHarrisCornerDetector.m</include>


img=load('../data/boat.mat');
img=img.imageOrig;
img=img/max(max(img));

std1=0.05;
k=0.182;
std2=0.5;
img=imgaussfilt(img,std1);

tic;
[final,Gx,Gy,corner_detected,output_eig_min,output_eig_max]=myHarrisCornerDetector(img,std2,k);
toc;

%Gradient along X and Gradient along Y, using the 'Sobel' operator

figure('name','ImageDerivatives','Position', [100 100 1300 500]);
colormap('gray');
subplot(1,2,1),imshow(Gx);
title('X Gradient');
subplot(1,2,2),imshow(Gy);
title('Y Gradient');

%Minimum and Maximum Eigen-Value

figure('name','EigenValues','Position', [100 100 1300 500]);
colormap('gray');
subplot(1,2,1),imshow(output_eig_min);colorbar;
title('Minimum EigenValue');
subplot(1,2,2),imshow(output_eig_max);colorbar;
title('Maximum Eigen Value');

%Cornerness and Markers on the Final Image

figure('name','HarrisCornerDetector','Position', [100 100 1300 500]);
colormap('gray');
subplot(1,2,1),imshow(corner_detected);colorbar;
title('Harris Cornerness');
subplot(1,2,2),imshow(final);colorbar;
title('Detected Corners');

{'Std_for_Smotheening', 'Std_for_Harris_Detection', 'k'; 0.05, 0.5, 0.182}


