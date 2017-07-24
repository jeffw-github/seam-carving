function verticalSeam = find_optimal_vertical_seam(cumulativeEnergyMap)
    [m, n] = size(cumulativeEnergyMap);
    verticalSeam = ones(m, 1);
     for i = m:-1:1
             if(i == m)
                [~, verticalSeam(i)] = min(cumulativeEnergyMap(i,:));
             else
                if(verticalSeam(i + 1) == 1)
                    if(cumulativeEnergyMap(i, verticalSeam(i + 1)) > cumulativeEnergyMap(i, verticalSeam(i + 1) + 1))
                        verticalSeam(i) = verticalSeam(i + 1) + 1;
                    else
                        verticalSeam(i) = verticalSeam(i + 1);
                    end
                elseif(verticalSeam(i + 1) == n)
                    if(cumulativeEnergyMap(i, verticalSeam(i + 1)) > cumulativeEnergyMap(i, verticalSeam(i + 1) - 1))
                        verticalSeam(i) = verticalSeam(i + 1) - 1;
                    else
                        verticalSeam(i) = verticalSeam(i + 1);
                    end
                else
                    if(cumulativeEnergyMap(i, verticalSeam(i + 1)) > cumulativeEnergyMap(i, verticalSeam(i + 1) - 1))
                        if(cumulativeEnergyMap(i, verticalSeam(i + 1) + 1) > cumulativeEnergyMap(i, verticalSeam(i + 1) - 1))
                            verticalSeam(i) = verticalSeam(i + 1) - 1;
                        else
                            verticalSeam(i) = verticalSeam(i + 1) + 1;
                        end
                    else
                        if(cumulativeEnergyMap(i, verticalSeam(i + 1) + 1) > cumulativeEnergyMap(i, verticalSeam(i + 1)))
                            verticalSeam(i) = verticalSeam(i + 1);
                        else
                            verticalSeam(i) = verticalSeam(i + 1) + 1;
                        end
                    end
                end
             end
     end
end