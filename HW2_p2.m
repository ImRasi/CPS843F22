%Dehazing
A=imread('night.jpg');
imshow(A);

AInv=imcomplement(A);
imshow(AInv);
BInv=imreducehaze(AInv);
imshow(BInv);
B=imcomplement(BInv);
montage({A, B});

BInv=imreducehaze(AInv, 'Method', 'approx', 'ContrastEnhancement', 'boost');
BImp=imcomplement(BInv);
figure, montage({A, BImp});

%Poorly lit
I=imread('pooly.jpg');
IInv=imcomplement(I);
IbInv=imreducehaze(IInv, 'ContrastEnhancement','none');
Ib=imcomplement(IbInv);
montage({I, Ib});

Lab=rgb2lab(I);
LInv=imcomplement(Lab(:,:,1) ./ 100);
LEnh=imcomplement(imreducehaze(LInv, 'ContrastEnhancement','none'));
LabEnh(:,:,1)   = LEnh .* 100;
LabEnh(:,:,2:3) = Lab(:,:,2:3) * 2; 
AEnh = lab2rgb(LabEnh);
montage({I,AEnh});
%Denoising
B=imguidedfilter(BImp);
montage({BImp, B});

%illumination Map
A = imread('night.jpg');
AInv = imcomplement(A);
[BInv,TInv] = imreducehaze(AInv,'Method','approxdcp','ContrastEnhancement', 'none');
T = imcomplement(TInv);
tiledlayout(1,2)
nexttile
imshow(A)
title('Lowlight Image')
nexttile
imshow(T)
title('Illumination Map')
colormap(hot)
