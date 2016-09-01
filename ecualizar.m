function [ec_img] = ecualizar(img)

%uint8 a double
img=im2double(img);
%muestra imagen original
figure('Name','Imagen original');
imshow(img);

%ecualizar(img);
mxm=size(img);
np=mxm(1)*mxm(2);
%% Ecualización canal Rojo
[HistR,xHistR]=imhist(img(:,:,1));
fR=zeros(1,256);
fR(1)=0;
acumulado=HistR(1);
for i=2:255
    fR(i)= acumulado*1/np;
    acumulado=acumulado + HistR(i);
end
fR(256)= 1;
%% Ecualización canal Verde
[HistG,xHistG]=imhist(img(:,:,2));
fG=zeros(1,256);
fG(1)=0;
acumulado=HistG(1);
for i=2:255
    fG(i)= acumulado*1/np;
    acumulado=acumulado + HistG(i);
end
fG(256)= 1;
%% Ecualización canal Azul
[HistB,xHistB]=imhist(img(:,:,3));
fB=zeros(1,256);
fB(1)=0;
acumulado=HistB(1);
for i=2:255
    fB(i)= acumulado*1/np;
    acumulado=acumulado + HistB(i);
end
fB(256)= 1;
%%Obtener la imagen ecualizada
pR=polyfit(xHistR,fR',7);
pG=polyfit(xHistG,fG',7);
pB=polyfit(xHistB,fB',7);
[X,Y,Z]=size(img);
for i=1:X
    for j=1:Y
        ec_r(i,j)=polyval(pR,img(i,j,1));
    end
end
for i=1:X
    for j=1:Y
        ec_g(i,j)=polyval(pG,img(i,j,2));
    end
end
for i=1:X
    for j=1:Y
        ec_b(i,j)=polyval(pB,img(i,j,3));
    end
end
ec_img(:,:,1)=ec_r;
ec_img(:,:,2)=ec_g;
ec_img(:,:,3)=ec_b;


%%Mostrar todo
figure('Name','Ecualización histograma R');
subplot(3,1,1)
imhist(img(:,:,1))
subplot(3,1,2)
plot(xHistR,fR);
subplot(3,1,3)
imhist(ec_r)

figure('Name','Ecualización histograma G');
subplot(3,1,1)
imhist(img(:,:,1))
subplot(3,1,2)
plot(xHistG,fG);
subplot(3,1,3)
imhist(ec_g)

figure('Name','Ecualización histograma B');
subplot(3,1,1)
imhist(img(:,:,1))
subplot(3,1,2)
plot(xHistB,fB);
subplot(3,1,3)
imhist(ec_b)


figure('Name','Imagen ecualizada')
imshow(ec_img);

end