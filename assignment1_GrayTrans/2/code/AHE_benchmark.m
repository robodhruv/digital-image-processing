org = imread('../data/TEM.png');
windowsize = [5 10:10:100 125];
% windowsize = [150 175 200];
times = zeros(size(windowsize));
i = 0;
for w = windowsize
    i = i + 1;
	tic
	img = myAHE_par(org, w);
    times(i) = toc;
	imwrite(img, strcat('AHE_benchmark/ahe_', num2str(w), '.png'));
end

save(strcat('AHE_benchmark/ahe.mat'));
