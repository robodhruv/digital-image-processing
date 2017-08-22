function output=myUnsharpMasking(input_img,std,scaling)

log_img=imfilter(input_img,fspecial('log',[9 9],std));
output=(input_img-scaling*log_img);
