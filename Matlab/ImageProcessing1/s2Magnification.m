%magnifying the picture
close all;
clear;
In=imread('anna500x332.tif');
%figure;imshow(In);
%out1=In(1:2:end,1:2:end);
%figure;imshow(out1);
out2=(zeros(size(In,1)*2,size(In,2)*2,size(In,3)));
out2(1:2:end,1:2:end)=In(1:1:end,1:1:end);
out2(2:2:end,1:2:end)=In(1:1:end,1:1:end);
out2(1:2:end,2:2:end)=In(1:1:end,1:1:end);
out2(2:2:end,2:2:end)=In(1:1:end,1:1:end);
figure;
imshow(uint8(out2));