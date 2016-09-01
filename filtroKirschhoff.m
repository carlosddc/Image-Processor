function [R] = filtroKirschhoff(img)
img=rgb2gray(img);
img=im2double(img);
[Y,X]=size(img);

%% Kernels
kx1=[-3 -3 5;-3 0 5; -3 -3  5];%0°
kx2=[-3 5 5; -3 0 5; -3 -3 -3];%45°
kx3=[5 5 5; -3 0 -3; -3 -3 -3];%90°
kx4=[5 5 -3; 5 0 -3; -3 -3 -3];%135°
ky1=[5 -3 -3; 5 0 -3; 5 -3 -3];%180°
ky2=[-3 -3 -3; 5 0 -3; 5 5 -3];%225°
ky3=[-3 -3 -3; -3 0 -3; 5 5 5];%270°
ky4=[-3 -3 -3; -3 0 5; -3 5 5];%315°
% %en X
% kx1=[-1  0  1
%      -2  0  2
%      -1  0  1];
% kx2=[-1 -2 -1
%       0  0  0
%       1  2  1];
% kx3=[ 1  0 -1
%       2  0 -2
%       1  0 -1];
% kx4=[-1 -2 -1
%       0  0  0
%       1  2  1];
% % en Y
% ky1=[-2 -1  0
%      -1  0  1
%       0  1  2];
% ky2=[ 2  1  0
%       1  0 -1
%       0 -1 -2];
% ky3=[ 0 -1 -2
%       1  0 -1
%       2  1  0];
% ky4=[ 0  1  2
%      -1  0  1
%      -2 -1  0];
%% Almacenar resultados
Rx1=zeros(Y,X);
Rx2=Rx1;
Rx3=Rx1;
Rx4=Rx1;
Ry1=Rx1;
Ry2=Rx1;
Ry3=Rx1;
Ry4=Rx1;
R=Rx1;
%% Procesamiento
for j=2:Y-1
    for i=2:X-1
        Rx1(j,i)=sum(sum(img(j-1:j+1,i-1:i+1).*kx1));
        Ry1(j,i)=sum(sum(img(j-1:j+1,i-1:i+1).*ky1));
        Rx2(j,i)=sum(sum(img(j-1:j+1,i-1:i+1).*kx2));
        Ry2(j,i)=sum(sum(img(j-1:j+1,i-1:i+1).*ky2));
        Rx3(j,i)=sum(sum(img(j-1:j+1,i-1:i+1).*kx3));
        Ry3(j,i)=sum(sum(img(j-1:j+1,i-1:i+1).*ky3));
        Rx4(j,i)=sum(sum(img(j-1:j+1,i-1:i+1).*kx4));
        Ry4(j,i)=sum(sum(img(j-1:j+1,i-1:i+1).*ky4));
    end
end

for j=1:Y
    for i=1:X
        R(j,i)=max(max([Rx1(j,i) Rx2(j,i) Rx3(j,i) Rx4(j,i) Ry1(j,i) Ry2(j,i) Ry3(j,i) Ry4(j,i)]));
    end
end
end