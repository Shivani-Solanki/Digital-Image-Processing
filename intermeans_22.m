function thres = intermeans_22(im)
%initializing the variables to zero
sum = 0;
sum1 = 0;
sum_b = 0;
sum1_b = 0;
%calculated no. of pixels at each graylevel
level = imhist(im);
% calculated mean graylevel of the image
mgl = mean2(im);
% rounding off the mean graylevel of the image
mgl = round(mgl);
% assumed previous threshold for comparison
T=1; 
%counters for loop
i=1; %will start with graylevel 1
j=256; %will start with graylevel 2

% comparing the graylevels
while mgl ~= T
   while i <= mgl % taking loop from 1 to mgl
       lv = i*(level(i)); % multiplying the pixels at each gray level with that graylevel
       sum_b = sum_b + lv; % taking summation all above values
       sum1_b = sum1_b + level(i); % taking summation of all pixels
       i = i + 1; % incrementing the graylevel
   end
   while j >= mgl % taking loop from mgl to 256
       lv = j*(level(j)); % multiplying the pixels at each gray level with that graylevel
       sum = sum + lv; % taking summation all above values
       sum1 = sum1 + level(j); % taking summation of all pixels
       j = j - 1 ; % incrementing the graylevel
   end
   mean_1 = sum_b/sum1_b; % mean graylevel before T
   mean_2 = sum/sum1; % mean graylevel after T
   T1 = (mean_1+mean_2)/2; %threshold value
   T1 = round(T1); % rounding off threshold value
   T = mgl; % assigning previous threshold value to T
   mgl = T1; % assigning new threshold value to mgl
end
thres = T1/255; % final threshold value