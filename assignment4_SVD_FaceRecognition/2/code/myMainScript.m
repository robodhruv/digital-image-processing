%% Q2. Image reconstruction using top k singular values
% Bhavesh Thakkar, Dhanvi Sreenivasan and Dhruv Ilesh Shah

%% mySVDYaleReconstructor.m
% <include>mySVDYaleReconstructor.m</include>
tic;
%%

input_img=imread('../images/yaleB04_P00A-005E-10.pgm'); %Input image chosen arbitarily
input_img=im2double(input_img);
U = mySVDYaleDatabasing(); %Gives us the orthogonal matrix U
K = [2 10 20 50 75 100 125 150 175];

%% Plot

figure('Position', [100, 100, 1200, 1200]);
subplot (4,3,2);
imshow(input_img);
title('Original Image');

for i=1:9
    subplot(4,3,3+i);
    imshow(mySVDYaleReconstructor(input_img, U, K(i)));
    title(strcat('k = ', int2str(K(i))));
end


    
%%
toc;
