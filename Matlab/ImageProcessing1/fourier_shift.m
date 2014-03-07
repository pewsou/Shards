close all;
clear all;

r=128
c=128
shiftr=30
shiftc=80;
lenr=40;
lenc=2;
origr=1
origc=10
A=zeros(r,c);
B=A;
A(origr:origr+lenr,origc:origc+lenc)=1;
B(origr+shiftr:origr+shiftr+lenr,origc+shiftc:origc+shiftc+lenc)=1;

F1 = fft2(A);
F2 = fft2(B);

% Create phase difference matrix
pdm = exp(i*(angle(F2)-angle(F1)));

% turn into cross phase-correlation
cps = real(ifft2(pdm));

c=max(cps);

figure;imshow(A);
figure;imshow(B);