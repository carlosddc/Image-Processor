function [R]=RGBconvYIQ(img)
img=im2double(img);
kernel=[ 0.299   0.587   0.114
         0.596  -0.275  -0.321
         0.212  -0.523   0.311];
[X,Y,Z]=size(img);
R=zeros(X,Y,Z);
for j=1:Y
    for i=1:X
        R(i,j,:)=kernel*[img(i,j,1) img(i,j,2) img(i,j,3)]';
    end
end
end