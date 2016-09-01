function [img_bin]=binariza(img,u)
[X,Y,Z]=size(img);
if Z>1
    img=rgb2gray(img);
end
img_bin=uint8(zeros(X,Y));
%img_bin=zeros(X,Y);
for x=1:X
    for y=1:Y
        if img(x,y)<=u
            img_bin(x,y)=0;
        else
            img_bin(x,y)=255;
        end
    end
end
%figure('Name','Imagen binarizada');
%imshow(img_bin);
end