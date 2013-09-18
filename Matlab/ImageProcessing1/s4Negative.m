%calculate negative

close all;
clear all;
I=imread('anna500x332.tif');
out1=(I(1:2:end,1:2:end,1));
neg=zeros(size(out1));
neg(1:end,1:end)=255-out1(1:end,1:end);
figure;
imshow(uint8(neg)); 
mesh(double(neg));