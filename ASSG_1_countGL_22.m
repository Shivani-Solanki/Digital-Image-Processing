%create a function with group number
function v = countGL_22(im)
%the function cannot accept any other image than uint8. hence, isa function
%is used to verify whether the image is of uint8 data type. 
if (isa(im,'uint8')== 0)
    %display error message for non uint8 image types
    disp ( 'Image matrix must be of type uint8')
else
    %for uint8 type images size function is used to return the values into
    %row and column
[row, column] = size(im);
count = 0;
%the vector accepts values only between 1-255, hence the loop will exit
%after 255
for a = 1 : 256
    %the pixel values are read for each row and respective column
    
    for i = 1 : row
        
        for j = 1 : column
            %for each gray level equal to the vector index add 1 until 255
            if (im(i,j)== (a-1))
                count = count + 1;
            end
        end
    end
    v(a) = count;
end
end
 return;

