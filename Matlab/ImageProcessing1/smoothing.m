function res = smoothing( img )
%smoothing by calculation of mean value of neighbour pixels

res=zeros(size(img));
li=(length(img(:,1)))
lj=(length(img(1,:)))
%calculate main pixels
matlabpool(3)
for i=2:li-1
    for j=2:lj-1
        res(i,j) = mean([img(i-1,j-1) img(i-1,j) img(i-1,j+1) img(i,j-1) img(i,j+1) img(i+1,j-1) img(i+1,j) img(i+1,j+1) ]);
    end

end  
%calculate border pixels
for j=2:lj-1
    res(1,j)=mean([img(1,j-1) img(2,j-1) img(2,j) img(2,j+1) img(1,j+1)]);
    res(li,j)=mean([img(li,j-1) img(li-1,j-1) img(li-1,j) img(li-1,j+1) img(li,j+1)]);
end
for i=2:li-1
    res(i,1)=mean([img(i-1,1) img(i-1,2) img(i,2) img(i+1,2) img(i+1,1)]);
    res(i,lj)=mean([img(i-1,lj) img(i-1,lj-1) img(i,lj-1) img(i+1,lj-1) img(i+1,lj)]);
end

%calculate corner pixels
res(1,1)=mean([img(1,2) img(2,1) img(2,2)]);
res(1,lj)=mean([img(1,lj-1) img(2,lj-1) img(2,lj)]);
res(li,1)=mean([img(li,2) img(li-1,1) img(li-1,2)]);
res(li,lj)=mean([img(li,lj-1) img(li-1,lj-1) img(li-1,lj)]);
end

