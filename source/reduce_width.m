function [reducedColorImage,reducedEnergyImage] = reduce_width(im,energyImage)
    cumulativeEnergyMap = cumulative_minimum_energy_map(energyImage, 'VERTICAL');
    verticalSeam = find_optimal_vertical_seam(cumulativeEnergyMap);
    [m,n,~] = size(im);
    reducedColorImage = im2uint8(zeros(m,n-1,3));
    reducedEnergyImage = zeros(m,n-1);
    for i = 1:m
        imRow = im(i,:,:);
        enRow = energyImage(i,:,:);
        imRow(:,verticalSeam(i),:) = [];
        enRow(:,verticalSeam(i),:) = [];
        reducedColorImage(i,:,:) = imRow;
        reducedEnergyImage(i,:,:) = enRow;
    end
    
end