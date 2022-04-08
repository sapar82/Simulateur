%a = readtable("697929110035.csv");
%b = table2array(a);
%[m, v] = barcode_reader(b)
%imshow(m)

function [image_matrice] = build_image(x)
    grey = mat2gray(x);
    image_matrice = [grey(1)];
    
    for i = 2 : length(grey)
        image_matrice = [image_matrice grey(i)];
    end
    
    for i = 1 : 10
        image_matrice = [image_matrice;image_matrice];
    end
end
