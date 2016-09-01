function [R]=RGBconvCMY(img)
img=im2double(img);
[X,Y,Z]=size(img);
R=zeros(X,Y,Z);
for j=1:Y
    for i=1:X
        R(i,j,:)=[1-img(i,j,1) 1-img(i,j,2) 1-img(i,j,3)]';
%         R(i,j,1)=1-img(i,j,1);
%         R(i,j,2)=1-img(i,j,2);
%         R(i,j,3)=1-img(i,j,3);
    end
end
end