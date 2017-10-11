function [least_distance_hits, least_distance_miss, hit_rate] = mySVDChecker( Vk, alphak, Average)
least_distance_hits = [];
least_distance_miss= [];
s = '../../../att_faces/s';
count = 0;
for i=1:32
    for j=7:10
        f = im2double(imread(strcat(s,int2str(i),'/',int2str(j),'.pgm')));
        [least_distance, index] = myPCATesting(f, Vk, alphak, Average);
        if index  == i
            least_distance_hits = [least_distance_hits least_distance];
            count = count + 1;
        else
            least_distance_miss = [least_distance_miss least_distance];
        end
    end
end
hit_rate = count / (4*32);
end

