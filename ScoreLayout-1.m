function [red,yellow] = ScoreLayout(layout)

    redpoints = 0;
    yellowpoints = 0;
    
    r = 6;
    c = 7;

    for i = 1:r
        for j = 1:c
            %Counting Right
            if j + 3 <= c
                %Counting Reds, Yellows, and Empties
                empty = 0; red = 0; yellow = 0;
                for k = 0:3
                    if layout(i, j+k) == 2
                        red = red + 1;
                    elseif layout(i, j+k) == 1
                        yellow = yellow + 1;
                    else
                        empty = empty + 1;
                    end 
                end

                %Checking the Score
                if yellow == 4
                    redpoints = redpoints + 1000;
                elseif yellow == 3 && empty == 1
                    redpoints = redpoints + 100;
                elseif yellow == 2 && empty == 2
                    redpoints = redpoints + 10;
                elseif yellow == 1 && empty == 3
                    redpoints = redpoints + 1;
                elseif red == 4 
                    yellowpoints = yellowpoints + 1000;
                elseif red == 3 && empty == 1
                    yellowpoints = yellowpoints + 100;
                elseif red == 2 && empty == 2
                    yellowpoints = yellowpoints + 10;
                elseif red == 1 && empty == 3
                    yellowpoints = yellowpoints + 1;
                end

            end
            %Counting Diagonal Right-Down
            if i + 3 <= r && j + 3 <=c
                %Counting Reds, Yellows, and Empties
                empty = 0; red = 0; yellow = 0;
                for k = 0:3
                    if layout(i+k, j+k) == 2
                        red = red + 1;
                    elseif layout(i+k, j+k) == 1
                        yellow = yellow + 1;
                    else
                        empty = empty + 1;
                    end
                end

                %Checking the Score
                if yellow == 4
                    redpoints = redpoints + 1000;
                elseif yellow == 3 && empty == 1
                    redpoints = redpoints + 100;
                elseif yellow == 2 && empty == 2
                    redpoints = redpoints + 10;
                elseif yellow == 1 && empty == 3
                    redpoints = redpoints + 1;
                elseif red == 4 
                    yellowpoints = yellowpoints + 1000;
                elseif red == 3 && empty == 1
                    yellowpoints = yellowpoints + 100;
                elseif red == 2 && empty == 2
                    yellowpoints = yellowpoints + 10;
                elseif red == 1 && empty == 3
                    yellowpoints = yellowpoints + 1;
                end

            end

            %Counting Down
            if i + 3 <=r
                %Counting Reds, Yellows, and Empties
                empty = 0; red = 0; yellow = 0;
                for k = 0:3
                    if layout(i+k , j) == 2
                        red = red + 1;
                    elseif layout(i+k, j) == 1
                        yellow = yellow + 1;
                    else
                        empty = empty + 1;
                    end
                end

               %Checking the Score
                if yellow == 4
                    redpoints = redpoints + 1000;
                elseif yellow == 3 && empty == 1
                    redpoints = redpoints + 100;
                elseif yellow == 2 && empty == 2
                    redpoints = redpoints + 10;
                elseif yellow == 1 && empty == 3
                    redpoints = redpoints + 1;
                elseif red == 4 
                    yellowpoints = yellowpoints + 1000;
                elseif red == 3 && empty == 1
                    yellowpoints = yellowpoints + 100;
                elseif red == 2 && empty == 2
                    yellowpoints = yellowpoints + 10;
                elseif red == 1 && empty == 3
                    yellowpoints = yellowpoints + 1;
                end

            end
            %Counting Diagonal Left-Down
            if i + 3 <=r && j - 3 > 0
                %Counting Reds, Yellows, and Empties
                empty = 0; red = 0; yellow = 0;
                for k= 0:3
                    if layout(i+k , j-k) == 2
                        red = red + 1;
                    elseif layout(i+k , j-k) == 1
                        yellow = yellow + 1;
                    else
                        empty = empty + 1;
                    end
                end

                %Checking the Score
                if yellow == 4
                    redpoints = redpoints + 1000;
                elseif yellow == 3 && empty == 1
                    redpoints = redpoints + 100;
                elseif yellow == 2 && empty == 2
                    redpoints = redpoints + 10;
                elseif yellow == 1 && empty == 3
                    redpoints = redpoints + 1;
                elseif red == 4 
                    yellowpoints = yellowpoints + 1000;
                elseif red == 3 && empty == 1
                    yellowpoints = yellowpoints + 100;
                elseif red == 2 && empty == 2
                    yellowpoints = yellowpoints + 10;
                elseif red == 1 && empty == 3
                    yellowpoints = yellowpoints + 1;
                end
            end

        end
    end

    red = redpoints;
    yellow = yellowpoints;
end