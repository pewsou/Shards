%copyright by Boris Vigman 2013-2014
close all;
clear;
In=imread('anna500x332.tif');
gr=In(1:2:end,1:2:end,1);
figure;imshow(uint8(gr));

A=floyd_multilevel(gr,8);
figure;imshow(uint8(A));