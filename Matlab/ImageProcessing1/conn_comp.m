function [ out ] = conn_comp( img )
%This function checks all neigbouring pixels of the current pixel
%if at least one neighbour has the same color as the current pixel does
% then the current pixel is labeled with the current label value
%otherwise label is increased

[row,col]=size(img);
cc=zeros(size(img));
label=0;
for j=2:col-1
    for i=2:row-1
        if testPxlColorMatch(img(i,j),img(i-1,j-1)) ||...
           testPxlColorMatch(img(i,j),img(i-1,j)  ) ||...
           testPxlColorMatch(img(i,j),img(i-1,j+1)) ||...
           testPxlColorMatch(img(i,j),img(i,j-1)  ) ||...
           testPxlColorMatch(img(i,j),img(i,j+1)  ) ||...
           testPxlColorMatch(img(i,j),img(i+1,j-1)) ||...
           testPxlColorMatch(img(i,j),img(i+1,j)  ) ||...
           testPxlColorMatch(img(i,j),img(i-1,j+1))
              cc(i,j) =label;
        else
            label=label+1;
            cc(i,j) =label;
        end
    end
end
out=cc;
end
%color range testing should be added
function [match]=testPxlColorMatch(p1,p2)
match= p1&p2;
end
