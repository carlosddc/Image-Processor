function [a_rojo, a_verde, a_azul] = extra_RGB (ima)
%% histograma de cada canal
figure('Name','Coloreo RGB');
subplot(2,2,1);
imshow(ima);
title('Imagen original');

a_rojo=ima;
a_rojo(:,:,2)=0;
a_rojo(:,:,3)=0;
subplot(2,2,2);
imshow(a_rojo);
title('Canal R');

a_verde=ima;
a_verde(:,:,1)=0;
a_verde(:,:,3)=0;
subplot(2,2,3);
imshow(a_verde);
title('Canal G');

a_azul=ima;
a_azul(:,:,1)=0;
a_azul(:,:,2)=0;
subplot(2,2,4);
imshow(a_azul);
title('Canal B');

end