
function [est_im, est_his] = streching(ima)
ima=im2double(ima);
%% estirar histograma
MR=max(max(ima(:,:,1)));
mR=min(min(ima(:,:,1)));

MG=max(max(ima(:,:,2)));
mG=min(min(ima(:,:,2)));

MB=max(max(ima(:,:,3)));
mB=min(min(ima(:,:,3)));

est_im=ima;
est_im(:,:,1)=(ima(:,:,1)-mR)*1/(MR-mR);
est_im(:,:,2)=(ima(:,:,2)-mG)*1/(MG-mG);
est_im(:,:,3)=(ima(:,:,3)-mB)*1/(MB-mB);

est_his=rgb2gray(est_im);

figure('Name','Stretching');
subplot(2,2,1)
imshow(ima)
title('Imagen original')
subplot(2,2,2)
imshow(est_im)
title('Imagen "estirada"')
subplot(2,2,3)
imhist(rgb2gray(ima))
title('Histograma original')
subplot(2,2,4)
imhist(est_his)
title('Histograma estirado')

end