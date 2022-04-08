barcode_array = barcode(0,0,-100,50,30,0,0,0,'111111111111');
% plot_barcode_3d(barcode_array)
barcode_image = projection_image(barcode_array);
% barcode_image = projection_image_output(1);
% ratio_x = projection_image_output(2);
% ratio_y = projection_image_output(3);


noyau = noyau_gaussien(0.1,-50,-100,0.16,0.16);
a = 7.023;
pwm_period = 3e-5;
scan_period = 0.1;
Ts = 1e-6;
% figure('visible','on');
% imshow(barcode_image)