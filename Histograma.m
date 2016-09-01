%% Histograma

function [HR, HG, HB] = Histograma (ima)
%% histograma de cada canal
figure;
subplot(2,2,1);
imshow(ima);

subplot(2,2,2);
HR=imhist(ima(:,:,1));

subplot(2,2,3);
HG=imhist(ima(:,:,2));

subplot(2,2,4);
HB=imhist(ima(:,:,3));

end