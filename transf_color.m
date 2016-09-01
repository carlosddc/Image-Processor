function [R, imgTrans] = transf_color(img,vR,vG,vB)
%img=rgb2gray(img);
imgTrans=0.21*img(:,:,1) + 0.72*img(:,:,2) + 0.07*img(:,:,3);
imgTrans=im2double(imgTrans);
%figure('Name','Transformacion de color: precisa');
%imshow(imgTrans)
R=zeros(size(img));
if imgTrans(:,:,1) < 128
    R(:,:,1)=vR*imgTrans/128;
    R(:,:,2)=vG*imgTrans/128;
    R(:,:,3)=vB*imgTrans/128;
else
    R(:,:,1)=imgTrans+(255-vR)*(imgTrans-128)/128;
    R(:,:,2)=imgTrans+(255-vG)*(imgTrans-128)/128;
    R(:,:,3)=imgTrans+(255-vB)*(imgTrans-128)/128;
end
%figure('Name','Transformacion de color: resultado');
%imshow(R)
end