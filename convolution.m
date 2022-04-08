function [irradiance] = convolution(x,y,barcode_image,noyau_gaussien)
%CONVOLUTION Summary of this function goes here
%   Detailed explanation goes here
    i_size = size(barcode_image);
    n = i_size(1); m = i_size(2);
    y = y + fix(n/2); x = x + fix(m/2);

    k_size = size(noyau_gaussien);
    p = k_size(1); o = k_size(2);
    b = fix(p/2); a = fix(o/2);
    
    if (x > a) && (x < m-a) && (y > b) && (y < n-b) %   convolution
        irradiance = sum(barcode_image(y-b:y+b,x-a:x+a).*noyau_gaussien,'all');
    else
        irradiance = 255;
    end
end