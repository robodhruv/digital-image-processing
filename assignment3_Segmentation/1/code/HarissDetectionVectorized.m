tic

std2=1
alpha=0.2


img=load('../data/boat.mat')
img=img.imageOrig;
img=img/max(max(img));


x_dim=size(img,1);
y_dim=size(img,2);

window_size=5;
length=(window_size-1)/2;



[Gx,Gy]=imgradientxy(img,'sobel');

Ix=Gx.*Gx;
Iy=Gy.*Gy;
Ixy=Gx.*Gy;



Gaussian_Kernel=fspecial('gaussian',[window_size,window_size],std2);

output_Ix=conv2(Ix,Gaussian_Kernel,'same');
output_Iy=conv2(Iy,Gaussian_Kernel,'same');
output_Ixy=conv2(Ixy,Gaussian_Kernel,'same');




for i = 1:x_dim
    for j =1:y_dim
        Structure_Tensor=[output_Ix(i,j)^2 output_Ixy(i,j); output_Ixy(i,j) output_Iy(i,j)];
        eig_val=eig(Structure_Tensor);
        output_eig_min(i,j)=eig_val(1,1);
        output_eig_max(i,j)=eig_val(2,1);
    end
end


corner_detected=output_eig_min.*output_eig_max - alpha*(output_eig_min+output_eig_max).^2;
corner_detected(corner_detected<0.05)=0;

for i=2:2:x_dim-2
    for j=2:2:y_dim-2
        corner_detected(i-1:i+1,j-1:j+1)=(corner_detected(i-1:i+1,j-1:j+1)==...
            max(max(corner_detected(i-1:i+1,j-1:j+1))))*max(max(corner_detected(i-1:i+1,j-1:j+1)));
    end
end

[row,col]=find(corner_detected>0);
marker=cat(2,col,row);
final=insertMarker(orig_img,marker,'color','green');
toc


imshow(final)


