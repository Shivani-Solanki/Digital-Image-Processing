im = imread('pout.tif');%reading the image which is to be equalized
v=myequalize_22(im);%call the my equalize function
subplot(1,2,1),imshow(im);title('input image')%subplotting input image
subplot(1,2,2),imshow(v);title('equalized image')%subplotting equalized image
