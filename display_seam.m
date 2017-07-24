function display_seam(im, seam, seamDirection)
    seamLength = length(seam);
    vector = 1:seamLength;
    
    figure
    imshow(im)
    hold on
    if(strcmp(seamDirection, 'HORIZONTAL'))
        plot(seam, 'red')
    else
        plot(seam, vector, 'red')
    end
end
