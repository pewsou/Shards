close all;
clear all;
A=imread('greyscale.jpg');
B=zeros(size(A(:,:,1))*3);
S=A(:,:,1);
[r,c]=size(S);
figure;imshow(S);
F=fftshift(fft2(S));
for k=1:length(F(:,1))
    for l=1:length(F(1,:))
        B(k,l)=F(k,l);
    end
end
R=(ifft2((B)));
pow=R.*conj(R);
apow=(abs(R));
figure;imshow(uint8((pow)));