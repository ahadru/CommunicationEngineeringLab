function [t,x] = hdb3(bits,bitrate)
    T = length(bits)/bitrate;
    n = 200;
    N = n*length(bits);
    dt = T/N;
    t = 0:dt:T;
    x = zeros(1,length(t));
    polarity = 1;
    pos_count = 0;
    i = 0;
    while i < length(bits) 
        if bits(i+1) == 1
            x(i*n+1:(i+1)*n) = polarity;
            polarity = -polarity;
            pos_count++;
            i = i + 1;
        else if i+4 <= length(bits)
            if bits(i+2) == 0 && bits(i+3) == 0 && bits(i+4) == 0
                if mod(pos_count,2) != 0   
                    x(i*n+1:(i+3)*n) = 0;    
                    x((i+3)*n+1:(i+4)*n) = -polarity;                  
                else
                    x(i*n+1:(i+1)*n) = polarity;        
                    x((i+1)*n+1:(i+3)*n) = 0;    
                    x((i+3)*n+1:(i+4)*n) = polarity;
                    polarity = -polarity;                   
                end
                pos_count = 0;
                i = i + 4;
            else
                x(i*n+1:(i+1)*n) = 0;
                i = i + 1;        
            end
        else
            x(i*n+1:(i+1)*n) = 0;
            i = i + 1;        
        end
    end
end