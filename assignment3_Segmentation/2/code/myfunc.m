function [ output ] = myfunc( v, input, sigma )
%MYFUNC Summary of this function goes here
%   Detailed explanation goes here
output = v - input;
output = exp(-1* (sum(output.*output)/(2*sigma*sigma)));

end

