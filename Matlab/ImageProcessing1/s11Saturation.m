close all
clear all

Img1=zeros(64,64,3);
Img1(:,:,2)=1;
Img1(:,:,3)=1;
Img1=hsv2rgb(Img1); %pure red
Img2=zeros(64,64,3);
Img2(:,:,2)=0.5;
Img2(:,:,3)=1;
Img2=hsv2rgb(Img2);%pink
montage([Img1 Img2]);

figure;imshow(Img1);
figure;imshow(Img2);