function seam_carving_reduce_height
    im = imread('inputSeamCarvingPrague.jpg');
    energyImage = energy_image(im);
    for i = 1:50
        [im,energyImage] = reduce_height(im, energyImage);
    end
    imwrite(im,'outputReduceHeightPrague.png','png');
end