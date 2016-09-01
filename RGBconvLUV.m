function [R]=RGBconvLUV(img)
img=RGBconvXYZ(img);
[X,Y,Z]=size(img);
R=zeros(X,Y,Z);
for j=1:Y
    for i=1:X
        
        var_U=(4*img(i,j,1))/(img(i,j,1)+(15*img(i,j,2)+(3*img(i,j,3))));
        var_V=(9*img(i,j,2))/(img(i,j,1)+(15*img(i,j,2)+(3*img(i,j,3))));
        var_Y=img(i,j,2)/100;
        if (var_Y > 0.008856) 
            var_Y=var_Y^(1/3);
        else
            var_Y=(7.787*var_Y)+(16/116);
        end
        ref_X=95.047;
        ref_Y=100;
        ref_Z=108.883;
        ref_U=(4*ref_X)/(ref_X+(15*ref_Y)+(3*ref_Z));
        ref_V=(9*ref_Y)/(ref_X+(15*ref_Y)+(3*ref_Z));
        R(i,j,1)=(116*var_Y)-16;
        R(i,j,2)=13*R(i,j,1)*(var_U-ref_U);
        R(i,j,2)=13*R(i,j,1)*(var_V-ref_V);
    end
end
end