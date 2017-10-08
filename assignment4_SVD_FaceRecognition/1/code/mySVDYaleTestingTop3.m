function [ index ] = mySVDYaleTestingTop3( input_img, Vt, alphat, Average )

input_img = input_img(:);
input_img_dev = input_img - Average;
alpha_p = Vt'*input_img_dev;
dev_mat = bsxfun(@minus, alphat, alpha_p);
dev_mat = dev_mat.^2;
dev_mat = sum(dev_mat, 1);
dev_mat = dev_mat.^(0.5);
[~, I] = min(dev_mat);
index = floor((I-1)/40) + 1;
end

