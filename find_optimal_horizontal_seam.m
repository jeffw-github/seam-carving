function horizontalSeam = find_optimal_horizontal_seam(cumulativeEnergyMap)
    [m, n] = size(cumulativeEnergyMap);
    horizontalSeam = ones(n, 1);
     for i = n:-1:1
             if(i == n)
                [~, horizontalSeam(i)] = min(cumulativeEnergyMap(:,i));
             else
                if(horizontalSeam(i + 1) == 1)
                    if(cumulativeEnergyMap(horizontalSeam(i + 1), i ) > cumulativeEnergyMap(horizontalSeam(i + 1) + 1, i))
                        horizontalSeam(i) = horizontalSeam(i + 1) + 1;
                    else
                        horizontalSeam(i) = horizontalSeam(i + 1);
                    end
                elseif(horizontalSeam(i + 1) == m)
                    if(cumulativeEnergyMap(horizontalSeam(i + 1), i ) > cumulativeEnergyMap(horizontalSeam(i + 1) - 1, i) )
                        horizontalSeam(i) = horizontalSeam(i + 1) - 1;
                    else
                        horizontalSeam(i) = horizontalSeam(i + 1);
                    end
                else
                    if(cumulativeEnergyMap(horizontalSeam(i + 1), i ) > cumulativeEnergyMap(horizontalSeam(i + 1) - 1, i) )
                        if(cumulativeEnergyMap(horizontalSeam(i + 1) + 1, i)  > cumulativeEnergyMap(horizontalSeam(i + 1) - 1, i) )
                            horizontalSeam(i) = horizontalSeam(i + 1) - 1;
                        else
                            horizontalSeam(i) = horizontalSeam(i + 1) + 1;
                        end
                    else
                        if(cumulativeEnergyMap(horizontalSeam(i + 1) + 1, i)  > cumulativeEnergyMap(horizontalSeam(i + 1), i ))
                            horizontalSeam(i) = horizontalSeam(i + 1);
                        else
                            horizontalSeam(i) = horizontalSeam(i + 1) + 1;
                        end
                    end
                end
             end
     end
end