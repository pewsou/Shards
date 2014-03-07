close all;
clear all;

r=256
c=256
shiftr=20
shiftc=20
lenr=40;
lenc=6;
origr=40
origc=45
A=ones(r,c);
A(1,1:end)=0;
A(65,1:end)=0;
A(32,1:end)=0;
A(3,1:end)=0;

A=imread('text.jpg');
A=A(1:2:end,1:2:end,1);
A=imresize(A,[r c]);
A=histeq(A);
A=1-A;
A=imdilate(A,ones(5));
figure;imshow(A);
B=A;
angle1=[];
angle2=[];

S=[0];
HT=[];
b=0;
e=90;
m=80
H = fspecial('log');
for m=b:e
    B=imrotate(A,m,'nearest','crop');
    FB=fftshift(fft2(B));
    
    FB = imfilter(FB,H);

    %FB=FB./exp(i*m);
    %imshow(real(ifft2(FB)));
   k=1;
     L=[1:r*c];
    for t=1:r
        for d=1:c
            L(k)=angle(FB(t,d));
            %M(k)=AFA(t,d);
            k=k+1;
        end
    end

    FBL=real(log(1+abs(FB)));

    maxFBL1=max(max(FBL));
    for k=1:r
        for t=1:c
            if FBL(k,t)<maxFBL1*0.8
                FBL(k,t)=0;
            else
                FBL(k,t)=1;
            end;
        end
    end

    [M,I]=max(FBL);
    col=1;
    raw=1;
    for l=1:length(I)
        if M(l)>0
            col=l; 
            row=I(l);
            break;
        end
    end
    angle2=[angle2;row col 180*atan((r/2-row)/(c/2-col))/pi];
end

