%More complex Thresholding - calculation of halftones
close all;
clear;
In=imread('anna500x332.tif');
gr=In(1:2:end,1:2:end,1);
figure;imshow(uint8(gr));

Thresh=80;
th=zeros(size(gr));
th(1:end,1:end) = 255*(gr(1:end,1:end)>Thresh);
figure;imshow(uint8(th));

htone=zeros(size(gr,1)*2+1,size(gr,2)*2+1,1);
lr=length(gr(:,1));
lc=length(gr(1,:));
for i=1:lr
    for j=1:lc
        if gr(i,j)<51
            htone(2*i,2*j)=0;
            htone(2*i,2*j+1)=0;
            htone(2*i+1,2*j)=0;
            htone(2*i+1,2*j+1)=0;
        elseif gr(i,j)<102
            htone(2*i,2*j)=1;
            htone(2*i,2*j+1)=0;
            htone(2*i+1,2*j)=0;
            htone(2*i+1,2*j+1)=0;
        elseif gr(i,j)<153
            htone(2*i,2*j)=1;
            htone(2*i,2*j+1)=1;
            htone(2*i+1,2*j)=0;
            htone(2*i+1,2*j+1)=0;
        elseif gr(i,j)<204
            htone(2*i,2*j)=1;
            htone(2*i,2*j+1)=1;
            htone(2*i+1,2*j)=1;
            htone(2*i+1,2*j+1)=0;
        else 
            htone(2*i,2*j)=1;
            htone(2*i,2*j+1)=1;
            htone(2*i+1,2*j)=1;
            htone(2*i+1,2*j+1)=1;
        end
    end
end
htone=htone*255;
figure;imshow(uint8(htone)); 
figure;mesh(double(htone));

