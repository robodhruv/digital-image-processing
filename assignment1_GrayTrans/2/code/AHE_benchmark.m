org = imread('../data/TEM.png');
windowsize = [5 10:10:100 125];
%windowsize = [5];

for w = windowsize
    img = myAHE(org, w);
    imwrite(img, strcat('AHE_benchmark/ahe_', num2str(w), '.png'));
end