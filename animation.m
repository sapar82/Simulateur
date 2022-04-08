imshow(barcode_image)
hold on
p = plot(out.x_pixel.Data(1),out.y_pixel.Data(1),...
         'o','MarkerFaceColor','red');
hold off
axis manual

for i = 2:2:5000
    p.XData = out.x_pixel.Data(i);
    p.YData = out.y_pixel.Data(i);
    drawnow
end