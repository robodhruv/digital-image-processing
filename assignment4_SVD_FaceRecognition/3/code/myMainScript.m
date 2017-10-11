%% Q3. Detecting False Positives and Negatives
% Bhavesh Thakkar, Dhanvi Sreenivasan and Dhruv Ilesh Shah

%% Method 
% We define a threshold such that if least distance between the eigen
% coefficients of the test image and that of the the images in the database
% is greater than the the threshold then we report that no match has taken
% place. And if the least distance is less than the threshold then we
% report a match has taken place.
% While determining the threshold, here we have assumed that we only have the data of 32
% people initially. We found the least distances of images which were
% detected correctly(hits) and those which weren't detected correctly(misses) from the
% test set of 32*4 images
% We defined threshold to be
% (mean(least_distances of hits) + mean(least_distances of misses))/2
% We can tune the threshold better by considering images that are not in our
% training data, and use the value of the distance obtained to set the
% threshold such that majority of those distances are more than the
% threshold.

tic;
%% Code to determine false positives and negatives
k=25
[thresh, U, alpha, avg] = myThresh(25); %We choose the top 25 singular values
s = '../../../att_faces/s';

% None of the below images have a corresponding image in the training set so
% therefore if we have the least distance of the test image less than threshold, then it is
% a false positive

false_positive = 0;
for i=33:40
    for j=1:10
        f = im2double(imread(strcat(s,int2str(i),'/',int2str(j),'.pgm')));
        [least_distance, index] = myPCATesting(f, U, alpha, avg);
        if least_distance < thresh
            false_positive = false_positive + 1;
        end
    end
end

false_negative = 0;

for i=1:32
    for j=7:10
        f = im2double(imread(strcat(s,int2str(i),'/',int2str(j),'.pgm')));
        [least_distance, index] = myPCATesting(f, U, alpha, avg);
        if index  == i 
            % We get a match but are forced to reject it due to least distance being greater than threshold
            % Hence, false_negative
            if least_distance > thresh
             false_negative = false_negative + 1;
            end
        end
    end
end

false_positive
false_negative


toc;
