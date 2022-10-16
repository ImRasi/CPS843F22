%Problem1
I=imread('house.jpg');
greyImage = rgb2gray(im2double(I));
imshow(greyImage);
%Roberts
rx=[+1 0; 0 -1];
ry=[0 +1; -1 0];
fx=imfilter(greyImage, rx);
fy=imfilter(greyImage, ry);
R=abs(fx)+abs(fy);
figure("Name", "Roberts Edge"); imshow(R);
%Prewitts
P=edge(greyImage, "prewitt");
figure("Name", "Prewitts Edge"); imshow(P);
%Sobels
S=edge(greyImage, "sobel");
figure("Name", "Sobels Edge"); imshow(S);

%Problem3
blStrength=3;
blimage=imgaussfilt(greyImage,blStrength);
figure("Name", "Blurred Image"); imshow(blimage);
mask=greyImage - blimage;
figure("Name", "Mask"); imshow(mask);
k=5;
highBoost5= greyImage + k*mask;
figure("Name", "Highboost k=5"); imshow(highBoost5);
k=1;
highBoost1= greyImage + k*mask;
figure("Name", "Highboost k=1"); imshow(highBoost1);

%Problem4
figure("Name", "Greyscale Image"); imshow(greyImage);
noiseImage=imnoise(greyImage, "gaussian", 0, 0.05);
figure("Name", "Gaussian Intensity = 0.05"); imshow(noiseImage);
noiseImage2=imnoise(greyImage, "gaussian", 0 , 0.15);
figure("Name", "Gaussian Intensity = 0.15"); imshow(noiseImage2);

filter7=filter2(fspecial("average", 7), noiseImage);
figure("Name", "Gaussian Intensity = 0.05"); imshow(filter7);
filter10=filter2(fspecial("average", 10), noiseImage2);
figure("Name", "Gaussian Intensity = 0.15"); imshow(filter10);