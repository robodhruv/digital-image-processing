img=load('../data/boat.mat')
img=img.imageOrig;


std1=0.05;
img=imgaussfilt(img,std1);

alpha=0.1:0.01:0.25;
std2=0.1:0.1:1;

parfor i = 1:numel(alpha)
    for j = 1:numel(std2)
figure(1);
imwrite(myHarrisCornerDetector(img,std2(j),alpha(i)), strcat('benchmark/', num2str(alpha(i)), '_', num2str(std2(j)), '_harris.png'));
% print(figure(2),'-djpeg',strcat('alpha = ',num2str(alpha*100), 'std2 = ',num2str(std2*100)));
    end
end