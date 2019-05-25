function v = countGL_2( im )
%COUNTGL_2 Counts the number of pixels at each graylevel in uint8 image.
%
%v = countGL_2( im ) where im is an image of type uint8 and v is a vector
%where v(i) is the number of pixels with graylevel i-1.

% Check if uint8 type
if ~isa(im, 'uint8')
    disp('Image matrix must be of type uint8')
    v = [];
    return;
end


% Count number of pixels at each graylevel
v = zeros(1, 256);
[rows, cols] = size(im);
for i = 1 : rows,
    for j = 1 : cols,
        index = uint16( im(i,j) ) +1; % Need to cast to larger type to hold 256 (could also use double)
        v(index) = v(index) + 1;
    end
end