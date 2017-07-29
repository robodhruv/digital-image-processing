function img = myLinearContrastStretching(org)
% Contrast Enhancement using Linear Contrast Stretching
% Maps from current histogram to extended histogram

org = im2double(org);
org_min = min(min(org));
org_max = max(max(org));

img = mat2gray((org - org_min) * 255 / (org_max - org_min));
