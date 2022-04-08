function [barcode_array] = ...
    barcode(x0, y0, z0, length, height, radius, ...
            z_rotation, x_rotation, base10_code)
%BARCODE
%   Build barcode_array from input parameters
    base2_code = base10_to_base2(char(base10_code));
    
    % precompute rotation matrix trigo functions
    phi = deg2rad(z_rotation); theta = deg2rad(x_rotation);
    cos_phi = cos(phi); sin_phi = sin(phi);
    cos_theta = cos(theta); sin_theta = sin(theta);
    
    barcode_array = zeros(226, 4); %    preallocation
    j = 1;
    X = linspace(-length/2, length/2, 113);
    for i = 1:113
        x = X(i); w = base2_code(i);
    
        if radius % cylindrical barcode
            alpha = x/radius;
            x = radius*sin(alpha);
            z = radius*cos(alpha) - radius;
        else %  plan barcode
            z = 0;
        end
    
        for y = [-height/2, height/2]
            %   apply rotation
            x_prime = x*cos_phi - y*sin_phi;
            y_prime = x*sin_phi*cos_theta + y*cos_phi*cos_theta - z*sin_theta;
            z_prime = x*sin_phi*sin_theta + y*cos_phi*sin_theta + z*cos_theta;
            %   apply translation
            x_prime = x_prime + x0;
            y_prime = y_prime + y0;
            z_prime = z_prime + z0;
            
            barcode_array(j,:) = [x_prime, y_prime, z_prime, str2double(w)];
            j = j + 1;
        end
    end
end


function [base2_code] = base10_to_base2(base10_code)
%BASE10_TO_BASE2
%   Convert base10_code to base2_code
    base2_code = "000000000101"; %  quiet zone + start
    L = containers.Map({'0', '1', '2', '3', '4', '5', '6', '7', '8', '9'}, ...
        ["0001101", "0011001", "0010011", "0111101", "0100011", ...
         "0110001", "0101111", "0111011", "0110111", "0001011"]);
    R = containers.Map({'0', '1', '2', '3', '4', '5', '6', '7', '8', '9'}, ...
        ["1110010", "1100110", "1101100", "1000010", "1011100", ...
         "1001110", "1010000", "1000100", "1001000", "1110100"]);
    for i = base10_code(1:6)
        base2_code = base2_code + L(i);
    end
    base2_code = base2_code + "01010"; %    middle
    for i = base10_code(7:12)
        base2_code = base2_code + R(i);
    end
    base2_code = base2_code + "101000000000"; % end + quiet zone
    base2_code = char(base2_code);
end