function mandelbrot(n, niter)
tic
x0 = -0.748766713922161;   x1 = -0.748766707771757;
y0 = 0.123640844894862; y1 = 0.123640851045266;

[x,y] = meshgrid(linspace(x0, x1, n), linspace(y0, y1, n));

c = x + 1i * y;
z = zeros(size(c));
k = zeros(size(c));
whos x y
for ii = 1:niter
    z   = z.^2 + c;
    k(abs(z) > 2 & k == 0) = niter - ii;
end

figure,
imagesc(k),
colormap([jet();flipud(jet());0 0 0]);
title('CPU Base Mandelbrot Algorithm Calculation')

axis off
%colormap hot
toc
axis square