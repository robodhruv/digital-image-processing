image = imread('../data/barbara256-part.png');
image = double(image);
noisy_image = image + randn(size(image))*20;

patch_size = 7;
sigma=20;
p = (patch_size-1)/2;

%Compute the Matrix of patches
patch_matrix = zeros(49,1);
for i = p+1 : size(noisy_image,1) - p
    for j =  p+1 : size(noisy_image,1) - p
        
        patch_p = noisy_image([i-p : i+p],[j-p:j+p]);
        patch_matrix = [patch_matrix,patch_p(:)];
        
    end
end
patch_matrix = patch_matrix( :,2:end);

%Compute the eigencoefficients of patches
alpha_martrix_denoised = zeros(size(patch_matrix));
covariance_matrix = patch_matrix*patch_matrix';
[V, D] = eig(covariance_matrix);
[~, permutation] = sort(diag(D), 'descend');
V = V(:, permutation);
n = sqrt(sum(V.^2,1));
V = bsxfun(@rdivide, V, n);
alpha = V'*patch_matrix;
n_patches = size(alpha,2);
L = n_patches-1; 

%Applying th filter on the eigencoefficient matrix
horizontal_sum = sum(alpha.^2,2);
for i = 1:size(alpha,2)
    alpha_matrix_denoised(:,i) = ...
    alpha(:,i)./(1 + sigma^2./(max(0 ,(1/L)*(horizontal_sum - alpha(:,i).^2) -sigma^2)));
end

%Reonstructing pixel values from denoised eigencoeffiecient
patch_matrix_denoised = V*alpha_matrix_denoised;

filtered_image = zeros(size(noisy_image));
counter = zeros(size(noisy_image));

%Reconstructing the image from patches
count = 1;
for i = p+1 : size(noisy_image,1) - p
    for j =  p+1 : size(noisy_image,1) - p
        filtered_image([i-p : i+p],[j-p:j+p]) = ...
            filtered_image([i-p : i+p],[j-p:j+p]) + reshape(patch_matrix_denoised(:,count), [7 7]);
            counter([i-p : i+p],[j-p:j+p])=counter([i-p : i+p],[j-p:j+p]) + 1;
            %counter(i,j) keeps track of number of patches that have visited a pixel (i,j) 
            count = count +1;
    end
end

filtered_image=filtered_image./counter;
imshow(filtered_image,[])


        




        
        