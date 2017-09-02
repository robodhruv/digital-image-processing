%% MyMainScript

tic;
%% Your code here
f = imread('../data/baboonColor.png');
%subplot(1,2,1), imshow(f);
out = myMeanShiftSegmentation(f);
imshow(out);
colorbar
toc;
