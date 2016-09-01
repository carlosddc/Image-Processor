function [R] = RGBconvXYZ(img)
img=im2double(img);
kernel=[ 0.412453  0.357580  0.180423
         0.212671  0.715160  0.072169
         0.019334  0.119193  0.950227];
[X,Y,Z]=size(img);
R=zeros(X,Y,Z);
for j=1:Y
    for i=1:X
        R(i,j,:)=kernel*[img(i,j,1) img(i,j,2) img(i,j,3)]';
    end
end
end