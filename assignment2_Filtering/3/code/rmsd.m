function rmsd = rmsd(img1, img2)
% Generates RMSD between given the input images. Assumes lower bound on
% range is 0 for both.

img1 = img1 / max(max(img1)) * 100;
img2 = img2 / max(max(img2)) * 100;

diff = img1 - img2;
rmsd = sqrt(sum(sum(diff.^2)) / numel(diff));

end
