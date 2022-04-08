function [] = plot_barcode_3d(barcode_array)
%PROJECTION_BARCODE_3D Summary of this function goes here
%   Detailed explanation goes here
    map = [1 1 1
           0 0 0];
    figure('visible','on')
    title('Représentation 3D du code-barres')
    for i = 1:224
        x = barcode_array(i:i+2,1);
        y = barcode_array(i:i+2,2);
        z = barcode_array(i:i+2,3);
        c = barcode_array(i,4);
        T = delaunay(x,y);
        trisurf(T,x,y,z,c,'EdgeColor','none')
        hold on
    end
    xlim([-100 100]) 
    ylim([-100 100])
    zlim([-200 0])
    xlabel('x-axis [mm]')
    ylabel('y-axis [mm]')
    zlabel('z-axis [mm]')
    colormap(map)
end