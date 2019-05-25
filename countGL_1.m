function v = countGL_1( im )
%COUNTGL_1 Counts the number of pixels at each graylevel in uint8 image.
%
%v = countGL_1( im ) where im is an image of type uint8 and v is a vector
%where v(i) is the number of pixels with graylevel i-1.

% Check if uint8 type
%  Different and more difficult way of checking than countGL_0
if ~(isinteger(im) & (min(min(im)) >= 0) & (max(max(im)) <= 255))
    disp('Image matrix must be of type uint8')
    v = [];
    return;
end

% Count number of pixels at each graylevel
for gl = 0 : 255
    mask = (im == gl);
    v(gl+1) = sum(sum(mask));
end
