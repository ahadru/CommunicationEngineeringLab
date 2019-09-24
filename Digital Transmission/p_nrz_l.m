input_bits = [1 0 1 1 1 0 0 1 0 0 1];
subplot(311);
stem(input_bits,'c','LineWidth',1);
title('Inputs');

bitrate = 1;
T = length(input_bits)/bitrate;
n = 200;
N = n*length(input_bits);
dt = T/N;
t = 0:dt:T;
signal = zeros(1,length(t));
 
for i = 0:length(input_bits)-1
    if input_bits(i+1) == 1
        signal(i*n+1:(i+1)*n) = 1;
    else
        signal(i*n+1:(i+1)*n) = -1;
    end
end

subplot(312);
plot(t,signal,'g','LineWidth',2);
title('Signal');
  
%demodulation
output_bits = zeros(1,length(input_bits));
for i = 0:length(input_bits)-1
    if signal(i*n+1) == 1
        output_bits(i+1) = 1;
    end        
end 

subplot(313);
stem(output_bits,'b','LineWidth',1);
title('Outputs');  