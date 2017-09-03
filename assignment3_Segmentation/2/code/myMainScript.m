%% Q2. MeanShift Segmentation
% Dhanvi Sreenivasan, Dhruv Ilesh Shah and Bhavesh Thakkar

%% myMeanShiftSegmentation.m
% <include>myMeanShiftSegmentation.m</include>

%% Results

img = imread('../data/baboonColor.png');
tic;
[out, outc10, outc20] = myMeanShiftSegmentation(img, 10, 0.08, 17);
toc
figure('name', 'Mean-Shift Segmentation', 'Position', [100 100 900 900])
subplot(2,2,1), imshow(img);
title('Original Image');
subplot(2,2,2), imshow(out);
title('Output of Mean-Shift Clustering (15 iter)');
subplot(2, 2, 3), imshow(outc10);
title('Image Color Coded with Bin Size 10');
subplot(2, 2, 4), imshow(outc20);
title('Image Color Coded with Bin Size 20');
daspect([1 1 1])

%% Analysis
% The output of the mean-shift need not have converged completely at the
% end of a fixed number of iterations, and including an epsilon bound check may
% take an unbounded amount of time to converge. Hence the output shown may
% still have some finite gradients. To get rid of that, we use naive
% binning approach to obtain a simple color coded scheme (was not required,
% but to emphasise the compression that can be achieved).

% The total number of unique colors can be obtained as follows.

unique_colors = unique(outc10(:,:,1) + 2*(outc10(:,:,2)) + 4*(outc10(:,:,3)));
c = numel(unique_colors)

% Thus the color space of the image can now be represented using log(c)
% bits, instead of 8*3 bits.

%% Parameters
% The above output was obtained at the parameters given below.
{'h_s', 'h_c', 'iter'; 10, 0.08, 17}

%% Other Results
% The obtained result does look well segmented, without much loss of
% detailing of features. Since there can not be a clear demarcation of what
% the "correct" parameters are, here are some other outputs that we got for
% the problem.

img = imread('../images/BaboonSmall_15_0.1.png');
figure, imshow(img);
title('h_s = 15; h_c = 0.1; 30 iterations')

img = imread('../images/baboonSmall_50_5_0.2.png');
figure, imshow(img);
title('h_s = 5; h_c = 0.2; 50 iterations')
% This output is highly smudged on the outside, but the inner features are
% well demarcated.