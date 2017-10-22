image = imread('../data/barbara256.png');
image = double(image);
patch_size=7;
p = (patch_size-1)/2;
sigma = 20;
window_size = 31;
w = (window_size - 1 )/2;
noisy_image = image + randn(size(image))*20;
noisy_image = padarray(noisy_image,[w w],inf,'both');

filtered_image = zeros(size(noisy_image));
counter = zeros(size(noisy_image));


tic

for i = w+p+1 : size(noisy_image,1) - w -p
    for j =  w+p+1 : size(noisy_image,2) - w -p 
        original_patch=noisy_image(i-p:i+p,j-p:j+p);
        original_patch=original_patch(:);
        patch_matrix = zeros(49,625);
        count = 1;
        for pi = (i-p-w) + p  : (i-p + w) - p 
            for pj = (j-p-w) + p  : (j-p+w) + - p
                patch_p = noisy_image(pi-p : pi+p,pj-p:pj+p);
                patch_matrix(:,count) = patch_p(:);
                count = count +1;
            end
        end
        %mse = patch_matrix-repmat(original_patch,1,size(patch_matrix,2));
        mse = bsxfun(@minus,patch_matrix,original_patch);
        mse = sum((mse.^2),1);
        [values, permutation] = sort( mse, 'ascend');
        %MSE = 0 corresponds to original patch, -1 to remove original patch
        topk=min(size(find(values<inf),2)-1,200); 
        
        patch_matrix= patch_matrix(:,permutation);
        %1st one corresoponds to original patch
        patch_matrix=patch_matrix(:,2:topk+1);
        
        covariance_matrix = patch_matrix*patch_matrix';
        [V, D] = eig(covariance_matrix);
        n = sqrt(sum(V.^2,1));
        V = bsxfun(@rdivide, V, n);
        original_alpha = V'*original_patch;
        alpha = V'*patch_matrix;
        L = size(alpha,2);
        denoised_alpha = original_alpha./(1 + sigma^2./(max(0 ,(1/L)*(sum((alpha.^2),2)) - sigma^2)));
        denoised_patch=V*denoised_alpha;
 
        filtered_image(i-p : i+p,j-p:j+p) = ...
            filtered_image(i-p : i+p,j-p:j+p) + reshape(denoised_patch, [7 7]);
        counter(i-p : i+p,j-p:j+p)=counter(i-p : i+p,j-p:j+p) + 1;
        %counter(i,j) keeps track of number of patches that have visited a pixel (i,j) 
    end
end

filtered_image=filtered_image./counter;
filtered_image= filtered_image(w+1:size(noisy_image,1)-w,w+1:size(noisy_image,2)-w);
imshow(filtered_image,[]);
MSE = sum(sum( (image-filtered_image).^2 ))/(size(image,1)*size(image,2))
toc
