%copyright by Boris Vigman 2013-2014
close all;
clear all;
A=imread('image.jpg');
A=A(:,:,1);
[M,N]=size(A);
F1=fft2(A);
F2=zeros(2*M,2*N);
F2(1:M/2,       1:N/2)      =F1(1:M/2,  1:N/2);
F2(1:M/2,       N+N/2+1:2*N)=F1(1:M/2,  N/2+1:N);
F2(M+M/2+1:2*M, N+N/2+1:2*N)=F1(M/2+1:M,N/2+1:N);
F2(M+M/2+1:2*M, 1:N/2)      =F1(M/2+1:M,1:N/2);
B=uint8(real(ifft2(F2)));
I1=uint8(128*ones(size(B)));
I1(1:M,1:N)=A;
montage([I1 B]);