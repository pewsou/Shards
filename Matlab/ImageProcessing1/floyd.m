%copyright by Boris Vigman 2013-2014
function [ out ] = floyd( img, th )
err=zeros(size(img));
out=double(img);
[r,c]=size(img);
for j=1:c-1
    for i=1:r-1
        out(i,j)=out(i,j)+err(i,j);
        if out(i,j)<th
            color=0;
        else
            color=255;
        end
        %color = ceil(out(i,j));
        d=out(i,j)-color;
        out(i,j)=color;
%         out(i+1,j)=out(i+1,j)+d*7/16;
%         out(i-1,j+1)=out(i-1,j+1)+d*3/16;
%         out(i,j+1)=out(i,j+1)+d*5/16;
%         out(i+1,j+1)=out(i+1,j+1)+d/16;
        err(i,j+1)=err(i,j+1)+d*3/8;
        err(i+1,j)=err(i+1,j)+d*3/8;
        err(i+1,j+1)=err(i+1,j+1)+d/4;
    end

end

for i=1:r-1
    out(i,c)=out(i,c)+err(i,c);
    if out(i,c)<th
        color=0;
    else
        color=255;
    end
    d=out(i,c)-color;
    out(i,c)=color;
    err(i+1,c)=err(i+1,c)+d*3/8;
end
for i=1:c-1
    out(r,i)=out(r,i)+err(r,i);
    if out(r,i)<th
        color=0;
    else
        color=255;
    end
    d=out(r,i)-color;
    out(r,i)=color;
    err(r,i+1)=err(r,i+1)+d*3/8;
end
out(r,c)=out(r,c)+err(r,c);
out(r,c)=~(out(r,c)<th)*255;
    
