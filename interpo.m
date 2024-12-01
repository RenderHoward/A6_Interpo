[lat,lon,value] = textread ('TiePoints.dat','%f %f %f','headerlines',1);
yi = linspace(8.653061, 17.22449, 70).';
xi = linspace (121, 131, 70).';
[xa, ya] = meshgrid(xi, yi);
zi = griddata( lon, lat, value, ya, xa );
mesh( ya, xa, zi);
