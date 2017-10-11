function [ hit_rate] = mySVDChecker( Vk, alphak, Average)

s = '../../../att_faces/s';
count = 0;
for i=1:32
    for j=7:10
        f = im2double(imread(strcat(s,int2str(i),'/',int2str(j),'.pgm')));
        index = myPCATesting(f, Vk, alphak, Average);
        if index  == i
            count = count + 1;
        end
    end
end
hit_rate = count / (4*32);
end

