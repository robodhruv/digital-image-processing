function [ scaled_image ] = myShrinkImageByFactorD( input_image, d )
scaled_image = input_image(1:d:end,1:d:end);
end

