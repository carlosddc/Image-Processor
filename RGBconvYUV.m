function [R] = RGBconvYUV(img)
img=im2double(img);
kernel=[ 0.30  0.59  0.11
        -0.15 -0.29  0.44
         0.62 -0.52 -0.10];
[X,Y,Z]=size(img);
R=zeros(X,Y,Z);
for j=1:Y
    for i=1:X
        R(i,j,:)=kernel*[img(i,j,1) img(i,j,2) img(i,j,3)]';
    end
end
end