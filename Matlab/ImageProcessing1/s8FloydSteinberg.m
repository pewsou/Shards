close all;
clear;
In=imread('anna500x332.tif');
gr=In(1:2:end,1:2:end,1);
figure;imshow(uint8(gr));

Thresh=90;
%th=zeros(size(gr));

%th(1:end,1:end) = 255*(gr(1:end,1:end)>Thresh);
out=floyd(gr,Thresh);

figure;imshow(uint8(out));
