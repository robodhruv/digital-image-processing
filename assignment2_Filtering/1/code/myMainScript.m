
% <include>myUnsharpMasking.m</include>
% <include>myLinearContrastStretching.m</include>

lion_img=load('../data/lionCrop');
lion_img=lion_img.imageOrig;
std=1.3;
scaling=0.8;
tic;
lion_output=myUnsharpMasking(lion_img,std,scaling);
toc;
figure('name','UnsharpMasking on lionCrop');
colormap(gray);
subplot(1,2,1),imshow(myLinearContrastStretching(lion_img));
colorbar
subplot(1,2,2),imshow(myLinearContrastStretching(lion_output));
colorbar


moon_img=load('../data/superMoonCrop');
moon_img=moon_img.imageOrig;
std=1.8;
scaling=0.8;
tic;
moon_output=myUnsharpMasking(moon_img,std,scaling);
toc;

figure('name','UnsharpMasking on moonCrop');
colormap(gray);
subplot(1,2,1),imshow(myLinearContrastStretching(moon_img));
colorbar
subplot(1,2,2),imshow(myLinearContrastStretching(moon_output));
colorbar