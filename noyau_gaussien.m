function noyau = noyau_gaussien(w_0, z_r, z0) 
    w = w_0*sqrt(1+(abs(z0)/z_r)^2);
    [X,Y] = meshgrid(-4:0.16:4,-4:0.16:4);
    Z = exp(-((X).^2+(Y).^2)/w^2);
    noyau = Z/sum(Z, 'all');
end