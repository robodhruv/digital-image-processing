function disp_img(img)

num_colors = 200;
color_scale = [ [0:1/(num_colors-1):1]',  [0:1/(num_colors-1):1]',  [0:1/(num_colors-1):1]' ];
imagesc(img)
colormap(color_scale);
colormap jet;
daspect([1 1 1]);
axis tight;
colorbar;
