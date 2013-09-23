%scaling down the picture
close all;
clear;
In=imread('anna500x332.tif');
%figure;imshow(In);
out1=In(1:2:end,1:2:end)
figure;
imshow(out1);
out1(1:2:end,:)=[]
out1(:,1:2:end)=[]
figure;
imshow(uint8(out1));