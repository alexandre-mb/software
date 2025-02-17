close all
clear all
clc

% Preparing images for DeepLearning
count = 0;
origImg = imread('IDRiD_01.jpg');
% origImg = imread('IDRiD_01_EX.tif');
[m,n,p] = size(origImg);
for j = 1:(n/224)
    for i = 1:(m/224)
        count = count+1;
        offset_i = i*224;
        offset_j = j*224;
        A = origImg((offset_i-223):offset_i,(offset_j-223):offset_j,:);
        txt = sprintf('C:/Users/Alexandre/Desktop/Software/Preparing Imagens/image_1%d.jpg',count);
%         txt = sprintf('C:/Users/Alexandre/Desktop/Software/Preparing Imagens/gt_%d.jpg',count);
        imwrite(A,txt);
    end
end