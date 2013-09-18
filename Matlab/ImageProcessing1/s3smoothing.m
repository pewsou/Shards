%smoothing the picture
 
close all;
clear all;
I=imread('anna500x332.tif');
out1=(I(1:2:end,1:2:end,1));
mesh(double(out1));
figure;
imshow(uint8(out1)); 

res = smoothing(out1);
res = smoothing(res);
mesh(double(res));
figure;
imshow(uint8(res)); 