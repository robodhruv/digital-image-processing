function [ index, indext] = mySVDYaleTesting( input_img, V, alpha, Average )

input_img = input_img(:);
input_img_dev = input_img - Average;
alpha_p = V'*input_img_dev;
dev_mat = bsxfun(@minus, alpha, alpha_p);
dev_mat = dev_mat.^2;
dev_matx = dev_mat(4:end, :);
dev_mat = sum(dev_mat, 1);
dev_matx = sum(dev_matx, 1);
dev_matx = dev_matx.^(0.5);
dev_mat = dev_mat.^(0.5);
[~, I] = min(dev_mat);
[~, It] = min(dev_matx);
index = floor((I-1)/40) + 1;
indext = floor((It-1)/40) + 1;
end

