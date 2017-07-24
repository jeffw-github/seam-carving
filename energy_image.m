function energyImage = energy_image(im)
   im = rgb2gray(im);
   im = imsharpen(im);
   [energyImage, ~] = imgradient(im);
   
end