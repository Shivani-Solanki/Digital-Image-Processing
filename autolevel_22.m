function [im2, a] = autolevel_22( fname )
% LEVEL  Levels background of an image.
%
% USAGE: [im2, a] = level( fname ) where 'fname' is a string representing
% the filename of the file containing the image, 'im2' is the levelled
% image, and 'a' is a vector of the 6 unknown coefficients.

% Read in image and display it
im = imread( fname );
imshow(im);
% setting the dimensions of sliding window by hit and trail which fits the
% grain in the block
M = 38;
N = 38;
% automatically selecting the point
[rows, cols] = size(im);
x= []; y = []; I = []; %initializing empty vector
for r = 1 : M : rows - M, %to iterate till rows-length with step size of length 
    for c = 1 : N : cols - N,%to iterate till cols-width with step size of width
        [minv, minr] = min( im(r:r+M-1, c:c+N-1) ); %taking the column wise min value and the row number of the min value
        [minv, minc] = min(minv); %taking minimum of the minval and its respective column number 
        I = [I; minv]; %storing the minimum greylevel
        minr = r + minr(minc) - 1; 
        y = [y; minr];  %storing the row of the minimum grey level
        minc = c + minc - 1;
        x = [x; minc]; %storing the column of the minimum grey level
    end
end
% Plot points
hold on; plot(x, y, 'y+'); hold off %plotting the points

% Fit data at selected points to background function
%  Solve least-squares problem: [C]{a} = {k} using the
%    \ operator, i.e., {a} = [C]\{k}
%  First, compute elements of the matrix [C]
N = length(x);
Sx = sum(x);
Sy = sum(y);
Sxx = sum(x.*x);
Syy = sum(y.*y);
Sxy = sum(x.*y);
Sxxx = sum(x.^3);
Sxxy = sum(x.*x.*y);
Sxyy = sum(x.*y.*y);
Syyy = sum(y.^3);
Sxxxx = sum(x.^4);
Sxxxy = sum(y.*x.^3);
Sxxyy = sum(x.*x.*y.*y);
Sxyyy = sum(x.*y.^3);
Syyyy = sum(y.^4);
C = [N    Sx  Sy   Sxx   Syy   Sxy;
    Sx   Sxx Sxy  Sxxx  Sxyy  Sxxy;
    Sy   Sxy Syy  Sxxy  Syyy  Sxyy;
    Sxx Sxxx Sxxy Sxxxx Sxxyy Sxxxy;
    Syy Sxyy Syyy Sxxyy Syyyy Sxyyy;
    Sxy Sxxy Sxyy Sxxxy Sxyyy Sxxyy];
% Construct {k}
I = double(I);
SI = sum(I);
SxI = sum(x.*I);
SyI = sum(y.*I);
SxxI = sum(x.*x.*I);
SyyI = sum(y.*y.*I);
SxyI = sum(x.*y.*I);
k = [SI SxI SyI SxxI SyyI SxyI]';
% Solve
a = C\k;

% Remove background
% First compute background image
[rows, cols] = size(im);
[x, y] = meshgrid( 1:cols, 1:rows );
back = a(1) + a(2)*x + a(3)*y + a(4)*x.*x + a(5)*y.*y +a(6)*x.*y;
im2 = double(im) - back;
im2 = mat2gray(im2); % Convert matrix of type double to image of type double
im2 = im2uint8(im2); % Convert to uint8 image. Although you were not asked
                     % to do this, it is useful to make output same type as
                     % input image.