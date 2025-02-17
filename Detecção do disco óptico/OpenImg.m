close all
clear all
clc

origImg = imread('IDRiD_01.jpg');
% origImg = imread('IDRiD_02.jpg');
% origImg = imread('IDRiD_03.jpg');
% origImg = imread('IDRiD_16.jpg');
grayOrig = rgb2gray(origImg);
binOrig = im2bw(grayOrig,0.7);

binGT = im2bw(imread('IDRiD_01_OD.tif'),0.2);
% binGT = im2bw(imread('IDRiD_02_OD.tif'),0.2);
% binGT = im2bw(imread('IDRiD_03_OD.tif'),0.2);
% binGT = im2bw(imread('IDRiD_16_OD.tif'),0.2);
% dummy = splitRGB(origImg);
[m,n] = size(binGT);
sum = zeros(m,n);

% for j=1:n,
%     for i=1:m,
%         sum(i,j) = origImg(i,j,1) + im2uint8(binGT(i,j));
%     end
% end
tic
bw1 = edge(binGT,'sobel');
bw2 = edge(binGT,'canny');

% sum = origImg(:,:,2) + im2uint8(binGT);
sumR = origImg(:,:,1) + im2uint8(bw1) + im2uint8(bw2);
sumG = origImg(:,:,2) + im2uint8(bw1) + im2uint8(bw2);
sumB = origImg(:,:,3) + im2uint8(bw1) + im2uint8(bw2);
toc
figure,imshow(sumR)
figure,imshow(sumG)
figure,imshow(sumB)

newimg = origImg;
origImg = imread('IDRiD_01.jpg');
newimg(:,:,1) = origImg(:,:,1);
newimg(:,:,2) = origImg(:,:,1);
newimg(:,:,3) = origImg(:,:,1);
figure, imshow(newimg)

% figure,imshow(binOrig)