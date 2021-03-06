function [barcode_image] = projection_image(barcode_array)
%PROJECTION_IMAGE Summary of this function goes here
%   Detailed explanation goes here
    hwidth = 50;
    map = [1 1 1
           0 0 0];
    figure('visible','off')
    for i = 1:224
        x = barcode_array(i:i+2,1);
        y = barcode_array(i:i+2,2);
        z = barcode_array(i:i+2,3);
        c = barcode_array(i,4);
        T = delaunay(x,y);
        trisurf(T,x,y,z,c,'EdgeColor','none')
        hold on
    end
    set(gcf,'position',[0,0,800,800])
    xlim([-hwidth hwidth]) 
    ylim([-hwidth hwidth])
%     zlim([-200 0])
    colormap(map)
    view(2)
    grid off
    F = getframe;
    barcode_image = F.cdata(:,:,1);
end