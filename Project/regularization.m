function [new_image, iter] = regularize(img, mask_m, max_iter)
%% Regularization routine

pad_img = padarray(img, [1 1], 0, 'both');
pad_mask = padarray(mask_m, [1 1], 0, 'both');

new_image = pad_img;
Gx = zeros(size(pad_img,1),size(pad_img,2));
Gy = zeros(size(pad_img,1),size(pad_img,2));
for i = 1:size(img,3)
    [Grad_x,Grad_y] = imgradientxy(pad_img(:,:,i),'sobel'); 
     Gx = Gx + Grad_x;
     Gy= Gy + Grad_y;
end

%Eig_martrix = zeros(size(pad_img,1),size(pad_img,2),4);
%struct_tensor_inverse =  zeros(size(pad_img,1),size(pad_img,2),4);
mask = zeros(3,3);
temp_conv = zeros(3,3);
%Eig_matrix(x,y,1:2) gives theta+ , Eig_matrix(x,y,3:4) gives theta-
prev_img = zeros(size(pad_img));

sturct_tensor = zeros(2,2);
 for iter = 1:max_iter
    if immse(prev_img, new_image) < 1e-5
       break
    end
    prev_img = new_image;
    for i = 2:size(pad_img,1) - 1    
        for j = 2:size(pad_img,2) - 1
            if (pad_mask(i, j) < 1)
                continue
            end
            struct_tensor = [Gx(i,j)^2 Gx(i,j)*Gy(i,j); Gx(i,j)*Gy(i,j) Gy(i,j)^2] ; 
            [x,y] = eig(struct_tensor);
            [Eigenvalues, permutation] = sort(diag(y), 'descend');
            x = x(:, permutation);
            % y = y(:, permutation);

            % Eig_matrix(i,j,:) = x(:);
            T_matrix =  x(:,1)*x(:,1)'/(1  + Eigenvalues(1) + Eigenvalues(2)) ...
                + x(:,2)*x(:,2)'/(sqrt(1  + Eigenvalues(1) + Eigenvalues(2))) ;

            T_inv = inv(T_matrix);
            scaling_factor = 1000;
            t = 1*scaling_factor;
            
            mask(1,1) = exp(-1*([-1 -1]*T_inv*[-1 ; -1])/(4 * t));
            mask(1,2) = exp(-1*([-1 0]*T_inv*[-1 ; 0])/(4 * t));
            mask(1,3) = exp(-1*([-1 1]*T_inv*[-1 ; 1])/(4 * t));

            mask(2,1) = exp(-1*([0 -1]*T_inv*[0 ; -1])/(4 * t));
            mask(2,2) = exp(-1*([0 0]*T_inv*[0 ; 0])/(4 * t));
            mask(2,3) = exp(-1*([0 1]*T_inv*[0 ; 1])/(4 * t));

            mask(3,1) = exp(-1*([1 -1]*T_inv*[1 ; -1])/(4 * t));
            mask(3,2) = exp(-1*([1 0]*T_inv*[1 ; 0])/(4 * t));
            mask(3,3) = exp(-1*([1 1]*T_inv*[1 ; 1])/(4 * t));
            
            mask = mask/sum(sum(mask));
            for k = 1:size(img,3)
                temp_conv = conv2(new_image(i-1:i+1,j-1:j+1,k),mask,'same');
                new_image(i,j,k) = temp_conv(2,2);
            end
            new_image([1,size(new_image,1)],:) = 0;
            new_image(:,[1,size(new_image,2)]) = 0;
        end
    end
 end