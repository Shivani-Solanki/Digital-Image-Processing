function v = countGL_0( im )
%COUNTGL_0 Counts the number of pixels at each graylevel in uint8 image.
%
%v = countGL_0( im ) where im is an image of type uint8 and v is a vector
%where v(i) is the number of pixels with graylevel i-1.

% Check if uint8 type
if ~isa(im, 'uint8')
    disp('Image matrix must be of type uint8')
    v = [];
    return;
end

% Count number of pixels at each graylevel
for gl = 0 : 255
    mask = (im == gl);
    v(gl+1) = sum(sum(mask));   % Note: sum(sum(mask))=sum(mask(:))
end
