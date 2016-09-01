%% Histograma
%Muestra el histograma de cada canal, recibe como parametro una imagen

function [HR, xR, HG, xG, HB, xB] = Hist_RGB (ima)
%% histograma de cada canal, se muestra la imagen original
[HR, xR]=imhist(ima(:,:,1));
[HG, xG]=imhist(ima(:,:,2));
[HB, xB]=imhist(ima(:,:,3));

figure('Name','Histograma RGB');
subplot(2,2,1);
imshow(ima);
title('Imagen original')
%el histograma para el Rojo
subplot(2,2,2);
imhist(ima(:,:,1));
title('Histograma R')
%el histograma para el Verde
subplot(2,2,3);
imhist(ima(:,:,2));
title('Histograma G')
%el histograma para el Azul
subplot(2,2,4);
imhist(ima(:,:,3));
title('Histograma B')
end