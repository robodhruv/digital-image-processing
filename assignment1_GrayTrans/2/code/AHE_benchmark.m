org = imread('../data/TEM.png');
% windowsize = [5 10:10:100 125];
windowsize = [150 175 200];

for w = windowsize
    tic
	img = myAHE_par(org, w);
    toc
	imwrite(img, strcat('AHE_benchmark/ahe_', num2str(w), '.png'));
end
