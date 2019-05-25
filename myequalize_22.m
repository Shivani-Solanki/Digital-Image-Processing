function im2 = myequalize_22(im)
% im is input of uint8 image type
% im2 is output of uint8 image type
% define variable with maximum gray level
mgl = 255;
[rows,cols]=size(im); %calculating rows and column
level = imhist(im);%histogram of the original image
N = sum(level); %calculating the total number of pixels
%determine point operation, A
A = (mgl / N) * cumsum( level );
A = uint8(round( A ));%the values considered should be of uint-8 type 
% apply point function value to each pixel of original image
for i = 1 : rows
for j = 1 : cols
new = im(i,j) + 1;
im2(i, j) = A( new );
end
end