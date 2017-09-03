std2=1
alpha=0.2


img=load('../data/boat.mat')
img=img.imageOrig;
img=img/max(max(img));


orig_img=img;

x_dim=size(img,1);
y_dim=size(img,2);

window_size=5;
length=(window_size-1)/2;

output_img=zeros(size(img)+2*length);
output_eig_min=zeros(size(img)+2*length);
output_eig_max=zeros(size(img)+2*length);

output_Ix=zeros(size(img)+2*length);
output_Iy=zeros(size(img)+2*length);
output_Ixy=zeros(size(img)+2*length);


[Gx,Gy]=imgradientxy(img,'sobel');

Ix=Gx.*Gx;
Iy=Gy.*Gy;
Ixy=Gx.*Gy;

img=padarray(img,[length,length],0);
Ix=padarray(Ix,[length,length],0);
Iy=padarray(Iy,[length,length],0);
Ixy=padarray(Ixy,[length,length],0);
tic
Gaussian_Kernel=fspecial('gaussian',[window_size,window_size],std2);


for i = length+1:length+x_dim
    for j =length+1:length+y_dim
        
        slice=img(i-length:i+length,j-length:j+length);
        
        slice_Ix=Ix(i-length:i+length,j-length:j+length);
        slice_Iy=Iy(i-length:i+length,j-length:j+length);
        slice_Ixy=Ixy(i-length:i+length,j-length:j+length);
        
        output_Ix(i,j)=sum(sum(Gaussian_Kernel.*slice_Ix));
        output_Iy(i,j)=sum(sum(Gaussian_Kernel.*slice_Iy));
        output_Ixy(i,j)=sum(sum(Gaussian_Kernel.*slice_Ixy));
        
    end
end


for i = length+1:length+x_dim
    for j =length+1:length+y_dim
        Structure_Tensor=[output_Ix(i,j)^2 output_Ixy(i,j); output_Ixy(i,j) output_Iy(i,j)];
        eig_val=eig(Structure_Tensor);
        output_eig_min(i,j)=eig_val(1,1);
        output_eig_max(i,j)=eig_val(2,1);
    end
end


corner_detected=output_eig_min.*output_eig_max - alpha*(output_eig_min+output_eig_max).^2;
corner_detected(corner_detected<0.05)=0;

for i=length+1:2:length+x_dim
    for j=length+1:2:length+y_dim
        corner_detected(i-1:i+1,j-1:j+1)=(corner_detected(i-1:i+1,j-1:j+1)==...
            max(max(corner_detected(i-1:i+1,j-1:j+1))))*max(max(corner_detected(i-1:i+1,j-1:j+1)));
    end
end

corner_detected=corner_detected(length+1:x_dim+length,length+1:length+y_dim);
[row,col]=find(corner_detected>0);
marker=cat(2,col,row);
final=insertMarker(orig_img,marker,'color','green');
toc





