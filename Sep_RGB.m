function [a_rojo, a_verde, a_azul] = Sep_RGB (ima)
%% histograma de cada canal
figure('Name','Separación canales: RGB');
subplot(2,2,1);
imshow(ima);
title('Imagen original')

a_rojo=ima(:,:,1);
subplot(2,2,2);
imshow(a_rojo);
title('Canal R')

a_verde=ima(:,:,2);
subplot(2,2,3);
imshow(a_verde);
title('Canal G')

a_azul=ima(:,:,3);
subplot(2,2,4);
imshow(a_azul);
title('Canal B')

end