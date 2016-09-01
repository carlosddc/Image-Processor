function [R] = colorFalso(img)
%img=im2double(img);
[X,Y,Z]=size(img);
img=rgb2gray(img);
img=im2double(img);
R=zeros(X,Y,Z);
%R=uint8(R);
%U=255/5;
U=1.0/5.0;
% vR=[-10 -20 66 100 -32];
% vG=[40 8 13 200 64];
% vB=[-10 60 4 150 16];
vR=[1.4 0.4 0.21 1.1 0.8];
vG=[0.9 1.15 0.72 0.3 1.6];
vB=[0.9 1 0.07 0.8 0.8];

for i=1:X
    for j=1:Y
        if img(i,j)>=0 && img(i,j)<U
%             R(i,j,1)=img(i,j)*vR(1);
%             R(i,j,2)=img(i,j)*vG(1);
%             R(i,j,3)=img(i,j)*vB(1);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
             R(i,j,1)=0;
             R(i,j,2)=img(i,j)+.4;
             R(i,j,3)=img(i,j)+.4;
        elseif img(i,j)>=U && img(i,j)<2*U
%             R(i,j,1)=img(i,j)*vR(2);
%             R(i,j,2)=img(i,j)*vG(2);
%             R(i,j,3)=img(i,j)*vB(2);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            R(i,j,1)=img(i,j)+.5;
            R(i,j,2)=0;
            R(i,j,3)=0;
        elseif img(i,j)>=2*U && img(i,j)<3*U
%             R(i,j,1)=img(i,j)*vR(3);
%             R(i,j,2)=img(i,j)*vG(3);
%             R(i,j,3)=img(i,j)*vB(3);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            R(i,j,1)=0;
            R(i,j,2)=0;
            R(i,j,3)=img(i,j)+.2;
        elseif img(i,j)>=3*U && img(i,j)<4*U
%             R(i,j,1)=img(i,j)*vR(4);
%             R(i,j,2)=img(i,j)*vG(4);
%             R(i,j,3)=img(i,j)*vB(4);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            R(i,j,1)=0;
            R(i,j,2)=img(i,j);
            R(i,j,3)=0;
        elseif img(i,j)>=4*U
%             R(i,j,1)=img(i,j)*vR(5);
%             R(i,j,2)=img(i,j)*vG(5);
%             R(i,j,3)=img(i,j)*vB(5);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            R(i,j,1)=img(i,j);
            R(i,j,2)=img(i,j);
            R(i,j,3)=0;
        end
    end
end

%figure('Name','Color falso')
%imshow(R)
end