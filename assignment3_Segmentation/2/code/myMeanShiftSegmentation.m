function [out, outc10, outc20] = myMeanShiftSegmentation(input_image, hs, hc, iter)
% Gaussian smoothing, with window-size 5 (Covers +/- 3sigma), sigma = 1 pixel width

smooth_filter = fspecial('gaussian', [7 7], 1);
I = im2double(input_image);
smoothed = imfilter(I, smooth_filter, 'conv');
I = smoothed(1:2:end,1:2:end,:);
s = size(I); rows = s(1); cols = s(2);
space_gaussian = fspecial('gaussian', [6*hs+1 6*hs+1], hs);
out = I;
%s_g3d = cat(3,space_gaussian,space_gaussian,space_gaussian);
I = padarray(I, [3*hs 3*hs]);
%row_dim = ones(4*hs+1,1);
%col_dim = ones(4*hs+1,1);
for k=1:iter
for i = 3*hs+1:rows + 3*hs
	for j = 3*hs+1:cols + 3*hs
		A = I(i-3*hs:i+3*hs,j-3*hs:j+3*hs,1:3);
		%B = mat2cell(A, row_dim, col_dim, 3);
		int_i = out(i-3*hs,j-3*hs,:);
        B = (bsxfun(@minus,A,int_i)).^2;
        G = exp(-1.*sum(B,3)./(hc*hc));
        G = G.*space_gaussian;
        G3d = cat(3,G,G,G);
        Z = A.*G3d;
        Gx = G(max(1,6*hs+2-i):min(end,rows+6*hs+1-i),max(1,6*hs+2-j):min(end,cols+6*hs+1-j));
        update = sum(reshape(Z,[],size(Z,3)))/sum(Gx(:));
        out(i-3*hs,j-3*hs,:) = update;
    end
end
end
outc10 = round(out * 8) / 8;
outc20 = round(out * 15) / 20;
end