tic
img=load('../data/boat.mat')
img=img.imageOrig;
img=img/max(max(img));
output_img=cell(size(img));
tic
[Gx,Gy]=imgradientxy(img,'sobel');
toc
tic
Gradient=cell(size(img,1),size(img,2));
toc
tic
Z = squeeze(num2cell(permute(cat(3,Gx,Gy),[3,1,2]),1)); %https://stackoverflow.com/questions/17574818/construct-cell-array-of-ordered-pairs-from-matrices
toc
tic
Z_Transposed=cellfun(@(a) a',Z,'UniformOutput',0);
Unweighted_Structure = cellfun(@(a,b) a*b, Z,Z_Transposed , 'UniformOutput', 0);
window_size=5;
length=(window_size-1)/2;
toc
tic
Gaussian_Kernel=fspecial('gaussian',[window_size,window_size],1);
Gaussian_Kernel=num2cell(Gaussian_Kernel);
toc

for i = length+1:size(img,1)-length
    for j = length+1:size(img,2)-length
        slice=Unweighted_Structure(i-length:i+length,j-length:j+length);
        Convolution=cellfun(@times,slice,Gaussian_Kernel,'UniformOutput',0);
        output=cell(1,1);
        output=[ 0 0 ; 0 0];

        for z = 1:size(Convolution,1)*size(Convolution,2)
            output=output+Convolution{z};
        end
        output_img{i,j}=output;
    end
end

eigen_output=cellfun(@(x) eig(x),output_img,'UniformOutput',0);
output_eigen_min=cellfun(@(x) x(1),eigen_output(3:510,3:510),'UniformOutput',0);
output_eigen_max=cellfun(@(x) x(2),eigen_output(3:510,3:510),'UniformOutput',0);
output_eigen_min=cell2mat(output_eigen_min);
output_eigen_max=cell2mat(output_eigen_max);
output_final=output_eigen_min.*output_eigen_max-0.05*(output_eigen_min+output_eigen_max).^2;
output_final_image=zeros(size(img,1),size(img,2));
output_final_image(length+1:size(img,1)-length,length+1:size(img,2)-length)=double(output_final);
[row,col]=find(output_final_image>0.1);
marker=cat(2,col,row);
final=insertMarker(img,marker);
imshow(final);



