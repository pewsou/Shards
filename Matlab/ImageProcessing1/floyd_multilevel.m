function [ out ] = floyd_multilevel( img,glsnum )
%this algorithm reduces gray levels number from maximum to the provided one
%receives source image and required number of gray levels (>256)
%returns image with reduced number of gray levels

gls=256/glsnum:256/glsnum:256
cltbl=0:length(gls)-1

err=zeros(size(img));
out=double(img);
 [r,c]=size(img);
 for j=1:c-1
     for i=1:r-1
         out(i,j)=out(i,j)+err(i,j);
         a=gls(gls-out(i,j)>0);
         l=length(a);
         if l>0
            out(i,j)<a(1);
            color= cltbl(glsnum-length(a)+1);
            d=out(i,j)-color;
            out(i,j)=color;
            err(i,j+1)=err(i,j+1)+d*3/8;
            err(i+1,j)=err(i+1,j)+d*3/8;
            err(i+1,j+1)=err(i+1,j+1)+d/4;
         end
%         %color = ceil(out(i,j));
%         d=out(i,j)-color;
%         out(i,j)=color;
%         err(i,j+1)=err(i,j+1)+d*3/8;
%         err(i+1,j)=err(i+1,j)+d*3/8;
%         err(i+1,j+1)=err(i+1,j+1)+d/4;
     end

  end

end

