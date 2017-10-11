function [ reconstructed_img ] = mySVDYaleReconstructor( input_img, U, k)
%input_img=im2double(input_img(:));
input_img=input_img(:); %Unrolling the image into a 1D vector
U = U(:,1:k);
alpha=U'*input_img;
reconstructed_img = U*alpha;
reconstructed_img = reshape(reconstructed_img,192,168);

end

