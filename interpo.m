
pkg load image

[lat,lon,value] = textread ('TiePoints.dat','%f %f %f','headerlines',1);

# Delaunay triangulate to intermediate (but even) size
yi = linspace(10, 16, 10).';
xi = linspace(121, 131, 14).';
[xa, ya] = meshgrid(xi, yi); 
zi = griddata( lon, lat, value, ya, xa );  

surf(xa, ya, zi);

figure

# Transform to Wave Number space
wn = fft2(zi);
wn = fftshift(wn);

#  Center low res approximation in bigger field with nulled higher 
#  spatial frequencies
bigger = padarray(wn,[40,56]/2,'both');
bigger = ifftshift(bigger);
# Transform back to lat,lon (note results 'nearly' real)
interp = ifft2(bigger); 

# Correct heights by inverting conventional FFT normalization
scale = numel(interp)/numel(zi);
interp = scale * interp;

XX = linspace(121,131, 70);
YY = linspace(10, 16, 50);

# Compensate for small imaginary component by taking absolute value
surf(XX, YY, abs(interp));  
 