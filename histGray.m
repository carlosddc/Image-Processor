function [Hist, xHist] = histGray (img)
figure('Name','Histograma');
[Hist, xHist]=imhist(rgb2gray(img));
imhist(rgb2gray(img));
figure('Name','Histograma RGB');
subplot(1,2,1);
imshow(img);
title('Imagen original en escala de grises')
%el histograma
subplot(1,2,2);
imhist(rgb2gray(img));
title('Histograma')
end