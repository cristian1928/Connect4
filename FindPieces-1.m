function [layout] = FindPieces(filename)

    minheight = -1;
    maxheight = -1;
    minlength = -1;
    maxlength = -1;

    pixels = imread(filename);
    [height,width,~] = size(pixels);

    for r = 1:height
        for c = 1:width
            if pixels(r,c,2) < 100
                minheight = r;
                break;
            end
        end

        if minheight ~= -1
            break
        end
    end

    for c = 1:width
        if pixels(minheight+100,c,2) < 100
            minlength = c;
            break;
        end
    end

    for c = width:-1:1
        if pixels(minheight+100,c,2) < 100
            maxlength = c;
            break;
        end
    end      

    xfall = round(minlength+(maxlength-minlength)/4);   
    for r = height:-1:1
        if pixels(r,xfall,1) < 100
            maxheight = r;
            break;
        end
    end


    width = maxlength-minlength;
    height = maxheight - minheight;
    xarea = (width*0.8)/6 ;
    yarea = (height*0.8)/5 ; 

    layout = zeros(6,7);

    y = minheight + height * 0.1;
    for r = 1:6
        x = minlength + width*0.1;
        for c = 1:7
            red = pixels(round(y), round(x)-1 , 1);
            green =  pixels(round(y), round(x)-1 , 2);
            blue = pixels(round(y), round(x)-1 , 3);

            if red > 100 && green < 50 && blue < 50 
                layout(r, c) = 1;
            elseif red > 150 && green > 100 && blue < 50
                layout(r, c) = 2;
            end

            x = x+xarea;
        end
        y = y+yarea;
    end 

end  