function [ reconstructed_img ] = mySVDYaleReconstructor( input_img, U, k)

input_img=input_img(:); %Unrolling the image into a 1D vector
U = U(:,1:k); %Taking only the columns corresponding to the top k eigen values
alpha=U'*input_img; %alpha is the eigen coefficient matrix of all the images in the training data
reconstructed_img = U*alpha;
reconstructed_img = reshape(reconstructed_img,192,168);

end

