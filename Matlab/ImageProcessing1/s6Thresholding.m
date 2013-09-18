%thresholding
close all;
clear all;

I=imread('anna500x332.tif');
out1=(I(1:2:end,1:2:end,1));
Thresh=80;
th=zeros(size(out1));

th(1:end,1:end) = 255*(out1(1:end,1:end)>Thresh);


figure;imshow(uint8(th)); 
figure;mesh(double(th));