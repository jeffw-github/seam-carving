function seam_carving_reduce_width
    im = imread('inputSeamCarvingPrague.jpg');
    energyImage = energy_image(im);
    for i = 1:200
        [im,energyImage] = reduce_width(im, energyImage);
    end
    imwrite(im,'outputReduceWidthPrague.png'.png','png');
end