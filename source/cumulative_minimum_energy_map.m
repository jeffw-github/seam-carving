function cumulativeEnergyMap = cumulative_minimum_energy_map(energyImage,seamDirection)
    [m, n] = size(energyImage);
    cumulativeEnergyMap = zeros(m, n);
    %VERTICAL
    if(strcmp(seamDirection, 'VERTICAL'))
        for i = 1:m
            for j = 1:n
                if i == 1 
                    cumulativeEnergyMap(i, :) = energyImage(i, :);
                    continue;
                end
                % at left edge
                if (j == 1)
                    cumulativeEnergyMap(i, j) = energyImage(i, j) + min( cumulativeEnergyMap(i - 1, j),...
                        cumulativeEnergyMap(i - 1, j + 1));
                % at right edge
                elseif (j == n)
                    cumulativeEnergyMap(i, j) = energyImage(i, j) + min( cumulativeEnergyMap(i - 1, j - 1),...
                        cumulativeEnergyMap(i - 1, j));
                else
                    cumulativeEnergyMap(i, j) = energyImage(i, j) + min( min( cumulativeEnergyMap(i - 1, j - 1),...
                        cumulativeEnergyMap(i - 1, j)), cumulativeEnergyMap(i - 1, j + 1));
                end
            end
        end
    else 
        for j = 1:n
            for i = 1:m
                if j == 1 
                    cumulativeEnergyMap(:, j) = energyImage(:, j);
                    continue;
                end
                % at left edge
                if (i == 1)
                    cumulativeEnergyMap(i, j) = energyImage(i, j) + min( cumulativeEnergyMap(i, j - 1),...
                        cumulativeEnergyMap(i + 1, j - 1));
                % at right edge
                elseif (i == m)
                    cumulativeEnergyMap(i, j) = energyImage(i, j) + min( cumulativeEnergyMap(i - 1, j - 1),...
                        cumulativeEnergyMap(i, j - 1));
                else
                    cumulativeEnergyMap(i, j) = energyImage(i, j) + min( min( cumulativeEnergyMap(i - 1, j - 1),...
                        cumulativeEnergyMap(i, j - 1)), cumulativeEnergyMap(i + 1, j - 1));
                end
            end
        end
    end
end