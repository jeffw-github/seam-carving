function [reducedColorImage,reducedEnergyImage] = reduce_height(im,energyImage)
    cumulativeEnergyMap = cumulative_minimum_energy_map(energyImage, 'HORIZONTAL');
    horizontalSeam = find_optimal_horizontal_seam(cumulativeEnergyMap);
    [m,n,~] = size(im);
    reducedColorImage = im2uint8(zeros(m-1,n,3));
    reducedEnergyImage = zeros(m-1,n);
    for i = 1:n
        imRow = im(:,i,:);
        enRow = energyImage(:,i,:);
        imRow(horizontalSeam(i),:,:) = [];
        enRow(horizontalSeam(i),:,:) = [];
        reducedColorImage(:,i,:) = imRow;
        reducedEnergyImage(:,i,:) = enRow;
    end
    
end