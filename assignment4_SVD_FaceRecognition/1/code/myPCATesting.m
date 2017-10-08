function [index] = myPCATesting( input_img,V, alpha, Average )

input_img = input_img(:);
input_img_dev = input_img - Average;
alpha_p = V'*input_img_dev;
dev_mat = bsxfun(@minus, alpha, alpha_p);
dev_mat = dev_mat.^2;
dev_mat = sum(dev_mat, 1);
dev_mat = dev_mat.^(0.5);
[~, I] = min(dev_mat);
index = floor((I-1)/6) + 1;
end

