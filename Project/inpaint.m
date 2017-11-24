img_path = 'TUM-IID/images/';
mask_path = 'TUM-IID/masks/mask';


% Temporary
mid = 4;
id = 1;
mask = imread(strcat(mask_path, int2str(mid), '.png'));
img = imread(strcat(img_path, int2str(id), '.png'));
fin_img = img;
nm = 1 - mask;

for i = 1:3
    fin_img(:, :, i) = img(:, :, i).*nm;
end