function [Rx, Ry] = FiltSobel(img)
orImg=double(img);
kernel_x=[-1 0 1
          -2 0 2
          -1 0 1];
kernel_y=[-1 -2 -1
          0 0 0
          1 2 1];
[Y,X,Z]=size(img);
%% Filtro en X y Y
Rx=zeros(size(img));
Ry=Rx;
for k=1:Z
    for j=2:Y-1
        for i=2:X-1
            Rx(j,i,k)=sum(sum(orImg(j-1:j+1,i-1:i+1,k).*kernel_x));
            Ry(j,i,k)=sum(sum(orImg(j-1:j+1,i-1:i+1,k).*kernel_y));
            if Rx(j,i,k)<0
                Rx(j,i,k)=0;
            end
            if Ry(j,i,k)<0
                 Ry(j,i,k)=0;
            end
        end
    end
end
Rx=uint8(Rx);
Ry=uint8(Ry);
end