input_img=load('../data/lionCrop.mat');
input_img=input_img.imageOrig;
for j=0.005:0.005:10
    for i = 0.001:0.0001:10    
figure(1);
log_img=imfilter(input_img,fspecial('log',[9 9],i));
subplot(1,2,1);
imshow(myLinearContrastStretching(input_img));
subplot(1,2,2);
imshow(myLinearContrastStretching((input_img-j*log_img)));
print(figure(1),'-djpeg',strcat('Sigma = ',num2str(i), 'Scaling = ',num2str(j)));
    end
end
