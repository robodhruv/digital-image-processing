function img = myLinearContrastStretching(org)
% Contrast Enhancement using Linear Contrast Stretching
% Maps from current histogram to extended histogram, any aspect ratio

org = im2double(org);
% Works for any aspect ratio
org_min = repmat(min(min(org)), size(org, 1), size(org, 2));
org_max = repmat(max(max(org)), size(org, 1), size(org, 2));


img = mat2gray((org - org_min) * 255 ./ (org_max - org_min));
