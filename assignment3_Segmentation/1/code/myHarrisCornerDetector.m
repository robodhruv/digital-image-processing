function [final,Gx,Gy,corner_detected,output_eig_min,output_eig_max]= myHarrisCornerDetector(img,std2,k)
img = img - min(min(img));
img = img / max(max(img));

x_dim=size(img,1);
y_dim=size(img,2);

window_size=5;
length=(window_size-1)/2;

[Gx,Gy]=imgradientxy(img,'sobel');

Ix=Gx.*Gx;
Iy=Gy.*Gy;
Ixy=Gx.*Gy;


output_Ix=imgaussfilt(Ix,std2,'Filtersize',5);
output_Iy=imgaussfilt(Iy,std2,'Filtersize',5);
output_Ixy=imgaussfilt(Ixy,std2,'Filtersize',5);


Trace=output_Ix.^2+output_Iy.^2;
Det=(output_Ix.^2).*(output_Iy.^2)-(output_Ixy.^2);


%Eigen Values for 2-D Matrices
output_eig_min=(Trace/2)-((Trace/2).^2 - Det).^(1/2);
output_eig_max=(Trace/2) +((Trace/2).^2 - Det).^(1/2);


%Harris-Corner Detector
thresh = 0.001;
corner_detected=output_eig_min.*output_eig_max - k*(output_eig_min+output_eig_max).^2;
corner_detected(corner_detected<thresh)=0;

%Non-maximal suppression
for i=2:2:x_dim-2
    for j=2:2:y_dim-2
        corner_detected(i-1:i+1,j-1:j+1)=(corner_detected(i-1:i+1,j-1:j+1)==...
            max(max(corner_detected(i-1:i+1,j-1:j+1))))*max(max(corner_detected(i-1:i+1,j-1:j+1)));
    end
end

%Inserting Markers
[row,col]=find(corner_detected>0);
marker=cat(2,col,row);
final=insertMarker(img,marker,'color','green', 'Size', 3);
