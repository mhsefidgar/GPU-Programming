function mandelbrotGPU(n, niter)

tic;
xlim = [-0.748766713922161, -0.748766707771757];
ylim = [ 0.123640844894862,  0.123640851045266]; 

x = gpuArray.linspace(xlim(1),xlim(2),n);
y = gpuArray.linspace(ylim(1),ylim(2),n);
whos x y



[xGrid,yGrid] = meshgrid(x,y);
z0 = complex(xGrid,yGrid);
count = ones(size(z0),'gpuArray');


z = z0;
for n = 0:niter
    z = z.*z + z0;
    inside = abs(z) <= 2;
    count = count + inside;
end
count = log(count);



imagesc(x,y,count)
colormap([jet();flipud(jet());0 0 0]);


axis off
title('GPU Base Mandelbrot Algorithm Calculation')
toc


end 