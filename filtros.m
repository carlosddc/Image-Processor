function [R]=filtros(img,kernel)
%% Pasa imagen a double y crea matrices de ceros
img=im2double(img);
[Y,X,Z]=size(img);
[KY,KX]=size(kernel);
KY=KY/2;
KX=KX/2;
R=zeros(Y,X,Z);
for k=1:Z
    for j=2:Y-1
        for i=2:X-1
            R(j,i,k)=sum(sum(img(j-floor(KY):j+floor(KY),i-floor(KX):i+floor(KX),k).*kernel));
        end
    end
end
end