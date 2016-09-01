
function [] = Hist_duoCanal (ima)
%% histograma de dos canales, muestra la imagen original
figure('Name','Histograma doble');
subplot(2,2,1);
imshow(ima)
title('Imagen original')
%el histograma para el Rojo y Verde
subplot(2,2,2);
plot(ima(:,:,1),ima(:,:,2),'.k','LineWidth',.001,'MarkerSize',.001);
title('Histograma R:G')
%el histograma para el Rojo y Azul
subplot(2,2,3);
plot(ima(:,:,1),ima(:,:,3),'.k','LineWidth',.001,'MarkerSize',.001);
title('Histograma R:B')
%el histograma para el Verde y Azul
subplot(2,2,4);
plot(ima(:,:,2),ima(:,:,3),'.k','LineWidth',.001,'MarkerSize',.001);
title('Histograma G:B')

end
