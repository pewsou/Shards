%copyright by Boris Vigman 2013-2014
close all;
clear;
In=imread('anna500x332.tif');
gr=In(1:2:end,1:2:end,1);
figure;imshow(uint8(gr));

Thresh=128;
%th=zeros(size(gr));
A1=size(gr);
A2=size(gr);
A3=size(gr);
A4=size(gr);
A5=size(gr);
D1=size(gr);
D2=size(gr);
D3=size(gr);
D4=size(gr);
D5=size(gr);

%th(1:end,1:end) = 255*(gr(1:end,1:end)>Thresh);
A1=floyd(gr,Thresh);figure;imshow(uint8(A1));
A2=floyd(A1,Thresh);figure;imshow(uint8(A2));
A3=floyd(A2,Thresh);figure;imshow(uint8(A3));
A4=floyd(A3,Thresh);figure;imshow(uint8(A4));
A5=floyd(A4,Thresh);figure;imshow(uint8(A5));

D1=gr-uint8(A1);F1=D1(D1>0);
D2=A1-A2;F2=D2(D2>0);
D3=A2-A3;F3=D3(D3>0);
D4=A3-A4;F4=D4(D4>0);
D5=A4-A5;F5=D5(D5>0);