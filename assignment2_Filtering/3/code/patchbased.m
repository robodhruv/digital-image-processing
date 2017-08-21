function im_new = patchbased(img, h, patchSize, windowSize)


%patchSize = 9;
%windowSize = 25;
p = (patchSize - 1) / 2;
w = (windowSize - 1) / 2;
% std = 40; % Standard deviation of the kernel

dim = size(img, 1); % 1:1 Aspect ratio assumed
im_new = img;

parfor pi = p+1:dim-p
	for pj = p+1:dim-p
        % Iterate over each pixel
        % Window limits also set by the same parameters as we want a fixed
        % dimensional parameter space.
        wmin = max([p+1, p+1], [pi-w, pj-w]);
        wmax = min([dim-p, dim-p], [pi+w, pj+w]);
        
        patch_p = img(pi-p:pi+p, pj-p:pj+p);
        patch_weights = zeros([windowSize^2, 1]); % Store the patch weights in order
        patch_centers = zeros([windowSize^2, 1]);
        count = 0;
        for qi = wmin(1):wmax(1)
            for qj = wmin(2):wmax(2)
                count = count + 1;
                % This gives a neighboring pixel in the same window
                patch_q = img(qi-p:qi+p, qj-p:qj+p);
                patch_centers(count) = img(qi, qj);
                patch_weights(count) = exp(-1 * sum(sum((patch_p - patch_q).^2)) / (h^2));
            end
        end
        patch_weights = patch_weights / sum(patch_weights);
        im_new(pi, pj) = sum(patch_weights.*patch_centers);
    end
end
end
