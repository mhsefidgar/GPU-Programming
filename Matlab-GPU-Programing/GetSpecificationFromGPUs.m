function GetSpecificationFromGPU
n = gpuDeviceCount;
for ii = 1:n
    gpuDevice(ii)
end
end 