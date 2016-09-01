function [R]=RGBconvHLS(img)
img=im2double(img);
[X,Y,Z]=size(img);
R=zeros(X,Y,Z);
for j=1:Y
    for i=1:X
        v_max=max([img(i,j,1) img(i,j,2) img(i,j,3)]);
        v_min=min([img(i,j,1) img(i,j,2) img(i,j,3)]);
        dif=v_max-v_min;
        if dif==0
            H=-1;
        elseif img(i,j,1)==v_max
            H=(img(i,j,2)-img(i,j,3))/dif;
        elseif img(i,j,2)==v_max
            H=2+(img(i,j,3)-img(i,j,1))/dif;
        elseif img(i,j,3)==v_max
            H=4+(img(i,j,1)-img(i,j,2))/dif;
        end
        H=H*60;
        if(H<0)
            H=H+360;
        end
        H=H/360;
        R(i,j,1)=im2double(H);
        R(i,j,2)=(v_max+v_min)/2;
        R(i,j,3)=v_max-v_min;
    end
end
end