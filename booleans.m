function [R]=booleans(a,b,op)
switch op
    case 1
        R=bitand(a,b);
    case 2
        R=bitor(a,b);
    case 3
        R=bitxor(a,b);
    case 4
        R=bitcmp(bitand(a,b));
    case 5
        R=bitcmp(a);
% figure('Name','Boleanas');
% subplot(2,2,1),title('AND');
% imshow(R1);
% subplot(2,2,2),title('OR');
% imshow(R2);
% subplot(2,2,3),title('XOR');
% imshow(R3);
% subplot(2,2,4),title('NOT AND');
% imshow(R4);
end