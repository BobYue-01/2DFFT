%%小波变换加水印，解水印大家按照加的思路逆过来就好
clc;clear;close all;
%% read data
im = double(imread('Lenna.png'))/255;
mark = double(imread('logo.png'))/255;
figure, imshow(im),title('original image');
figure, imshow(mark),title('watermark');
%% RGB division
im=double(im); 
mark=double(mark); 
imr=im(:,:,1); 
markr=mark(:,:,1); 
img=im(:,:,2); 
markg=mark(:,:,2); 
imb=im(:,:,3); 
markb=mark(:,:,3); 
%% parameter
r=0.04; 
g = 0.04; 
b = 0.04;
%% wavelet tranform and add watermark
% for red
[Cwr,Swr]=wavedec2(markr,1,'haar'); 
[Cr,Sr]=wavedec2(imr,2,'haar'); 
% add watermark
Cr(1:size(Cwr,2)/16)=... 
Cr(1:size(Cwr,2)/16)+r*Cwr(1:size(Cwr,2)/16); 
k=0; 
while k<=size(Cr,2)/size(Cwr,2)-1 
Cr(1+size(Cr,2)/4+k*size(Cwr,2)/4:size(Cr,2)/4+... 
(k+1)*size(Cwr,2)/4)=Cr(1+size(Cr,2)/4+... 
k*size(Cwr,2)/4:size(Cr,2)/4+(k+1)*size(Cwr,2)/4)+... 
r*Cwr(1+size(Cwr,2)/4:size(Cwr,2)/2); 
Cr(1+size(Cr,2)/2+k*size(Cwr,2)/4:size(Cr,2)/2+... 
(k+1)*size(Cwr,2)/4)=Cr(1+size(Cr,2)/2+... 
k*size(Cwr,2)/4:size(Cr,2)/2+(k+1)*size(Cwr,2)/4)+... 
r*Cwr(1+size(Cwr,2)/2:3*size(Cwr,2)/4); 
Cr(1+3*size(Cwr,2)/4+k*size(Cwr,2)/4:3*size(Cwr,2)/4+... 
(k+1)*size(Cwr,2)/4)=Cr(1+3*size(Cr,2)/4+... 
k*size(Cwr,2)/4:3*size(Cr,2)/4+(k+1)*size(Cwr,2)/4)+... 
r*Cwr(1+3*size(Cwr,2)/4:size(Cwr,2)); 
k=k+1; 
end; 
Cr(1:size(Cwr,2)/4)=Cr(1:size(Cwr,2)/4)+r*Cwr(1:size(Cwr,2)/4); 

% for green
[Cwg,Swg]=wavedec2(markg,1,'haar'); 
[Cg,Sg]=wavedec2(img,2,'haar'); 
Cg(1:size(Cwg,2)/16)=... 
Cg(1:size(Cwg,2)/16)+g*Cwg(1:size(Cwg,2)/16); 
k=0; 
while k<=size(Cg,2)/size(Cwg,2)-1 
Cg(1+size(Cg,2)/4+k*size(Cwg,2)/4:size(Cg,2)/4+... 
(k+1)*size(Cwg,2)/4)=Cg(1+size(Cg,2)/4+... 
k*size(Cwg,2)/4:size(Cg,2)/4+(k+1)*size(Cwg,2)/4)+... 
g*Cwg(1+size(Cwg,2)/4:size(Cwg,2)/2); 
Cg(1+size(Cg,2)/2+k*size(Cwg,2)/4:size(Cg,2)/2+... 
(k+1)*size(Cwg,2)/4)=Cg(1+size(Cg,2)/2+... 
k*size(Cwg,2)/4:size(Cg,2)/2+(k+1)*size(Cwg,2)/4)+... 
g*Cwg(1+size(Cwg,2)/2:3*size(Cwg,2)/4); 
Cg(1+3*size(Cg,2)/4+k*size(Cwg,2)/4:3*size(Cg,2)/4+... 
(k+1)*size(Cwg,2)/4)=Cg(1+3*size(Cg,2)/4+... 
k*size(Cwg,2)/4:3*size(Cg,2)/4+(k+1)*size(Cwg,2)/4)+... 
g*Cwg(1+3*size(Cwg,2)/4:size(Cwg,2)); 
k=k+1; 
end; 
Cg(1:size(Cwg,2)/4)=Cg(1:size(Cwg,2)/4)+g*Cwg(1:size(Cwg,2)/4); 

% for blue
[Cwb,Swb]=wavedec2(markb,1,'haar'); 
[Cb,Sb]=wavedec2(imb,2,'haar'); 
Cb(1:size(Cwb,2)/16)+b*Cwb(1:size(Cwb,2)/16); 
k=0; 
while k<=size(Cb,2)/size(Cwb,2)-1 
Cb(1+size(Cb,2)/4+k*size(Cwb,2)/4:size(Cb,2)/4+... 
(k+1)*size(Cwb,2)/4)=Cb(1+size(Cb,2)/4+... 
k*size(Cwb,2)/4:size(Cb,2)/4+(k+1)*size(Cwb,2)/4)+... 
g*Cwb(1+size(Cwb,2)/4:size(Cwb,2)/2); 
Cb(1+size(Cb,2)/2+k*size(Cwb,2)/4:size(Cb,2)/2+... 
(k+1)*size(Cwb,2)/4)=Cb(1+size(Cb,2)/2+... 
k*size(Cwb,2)/4:size(Cb,2)/2+(k+1)*size(Cwb,2)/4)+... 
b*Cwb(1+size(Cwb,2)/2:3*size(Cwb,2)/4); 
Cb(1+3*size(Cb,2)/4+k*size(Cwb,2)/4:3*size(Cb,2)/4+... 
(k+1)*size(Cwb,2)/4)=Cb(1+3*size(Cb,2)/4+... 
k*size(Cwb,2)/4:3*size(Cb,2)/4+(k+1)*size(Cwb,2)/4)+... 
b*Cwb(1+3*size(Cwb,2)/4:size(Cwb,2)); 
k=k+1; 
end; 
Cb(1:size(Cwb,2)/4)=Cb(1:size(Cwb,2)/4)+b*Cwb(1:size(Cwb,2)/4); 
%% image reconstruction
imr=waverec2(Cr,Sr,'haar'); 
img=waverec2(Cg,Sg,'haar'); 
imb=waverec2(Cb,Sb,'haar'); 
imsize=size(imr); 
FAO=zeros(imsize(1),imsize(2),3); 
for i=1:imsize(1); 
for j=1:imsize(2); 
FAO(i,j,1)=imr(i,j); 
FAO(i,j,2)=img(i,j); 
FAO(i,j,3)=imb(i,j); 
end 
end 
figure, imshow(FAO); title('watermarked image');