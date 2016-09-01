function [R]=RGBconvLab(img)
img=RGBconvXYZ(img);
Xn=95.047; Yn=100; Zn=108.883; v_l=0.008856;
[x,y,z]=size(img);
R=zeros(x,y,z);
img(1,1,1),img(1,1,2),img(1,1,3)
img(1,1,1)/Xn
for j=1:y
    for i=1:x
        XlXn=img(i,j,1)/Xn;
        YlYn=img(i,j,2)/Yn;
        ZlZn=img(i,j,3)/Zn;
        if XlXn>v_l
            vx=nthroot(XlXn,3);
        else
            vx=(7.787*XlXn)+(16/116);
        end
        if YlYn>v_l
            vy=nthroot(YlYn,3);
        else
            vy=(7.787*YlYn)+(16/116);
        end
        if ZlZn>v_l
            vz=nthroot(ZlZn,3);
        else
            vz=(7.787*ZlZn)+(16/116);
        end
        R(i,j,1)=(116*vy)-16;
        R(i,j,2)=500*(vx-vy);
        R(i,j,3)=200*(vy-vz);
    end
end
R(1,1,1),R(1,1,2),R(1,1,3)
end