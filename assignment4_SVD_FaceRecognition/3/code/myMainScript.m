%% MyMainScript

tic;
%%
[thresh, U, alpha, avg] = myThresh(25);
s = '../../../att_faces/s';
false_positive = 0;
for i=33:40
    for j=1:4
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
            if least_distance > thresh
             false_negative = false_negative + 1;
            end
        end
    end
end
false_positive
false_negative


toc;
