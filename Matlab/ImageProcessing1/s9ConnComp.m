close all;
clear;
In=imread('anna500x332.tif');
gr=In(1:2:end,1:2:end,1);
figure;imshow(uint8(gr));

conn_comp(gr);
