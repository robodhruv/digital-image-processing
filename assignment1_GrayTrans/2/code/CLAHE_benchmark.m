org = imread('../data/TEM.png');
windowsize = [5 10:10:100 125 150 175 200];
threshold = [0.01:0.01:0.04 0.05:0.05:0.5];
% windowsize = [150 175 200];

times = zeros(numel(threshold), numel(windowsize));
i = 0; j=0;
for t = threshold
i = i+1;
for w = windowsize
    j = j+1;
	tic
	img = myCLAHE_par(org, w, t);
    times(i, j) = toc;
	imwrite(img, strcat('AHE_benchmark/clahe_', num2str(t), '_', num2str(w), '.png'));
end
end

save(strcat('AHE_benchmark/clahe.mat'));

