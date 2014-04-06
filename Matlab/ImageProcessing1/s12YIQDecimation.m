%copyright by Boris Vigman 2013-2014
close all
clear all

In=imread('anna500x332.tif');

%RGB = [128 128 128]'
YIQ2RGB=[[0.299 0.596 0.212];[0.587 -0.275 -0.523];[0.114 -0.321 0.311];]';

T=double(In)/255;

Out=zeros(size(T));
Res=zeros(size(T));

lr=length(T(:,1,1));
lc=length(T(1,:,1));

for j=1:lc
    for i=1:lr
        S=(YIQ2RGB * [T(i,j,1);T(i,j,2); T(i,j,3);]);
        
        Out(i,j,1)=S(1);% Y
        Out(i,j,2)=S(2);% I
        Out(i,j,3)=S(3);% Q
        if mod(i,2)==0 && mod(j,2)==0
            Out(i,j,2)=0;% remove I
            Out(i,j,3)=0;% remove Q
        end
    end
end



for j=1:lc
    for i=1:lr
        S=inv(YIQ2RGB)*[Out(i,j,1);Out(i,j,2); Out(i,j,3);];
        Res(i,j,1)=S(1);
        Res(i,j,2)=S(2);
        Res(i,j,3)=S(3);
    end
end

figure;imshow(In);
figure;imshow(Res);