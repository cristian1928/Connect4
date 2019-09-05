
function [column] = FindBestMove(layout)
newlayout = layout;
bestscore = -9999999999999999999999;

for i= 1:7
    for k = 6:-1:1
        if newlayout(k,i) ~= 0
            continue
        elseif newlayout(k,i) == 0
            newlayout(k,i) = newlayout(k,i)+1;
            break
        end
    end
    Nombre = i;
    [red,yellow] = ScoreLayout(newlayout);
    score = red - yellow;
    if score > bestscore
        bestscore = score;
        column = Nombre;
    end 
    newlayout = layout;
end
end
