function [quantizedSignal,MSQE,BitStream] = Quantizer2(y, isMidrise, L, mp)

% this function quantizes discrete signals
% signal = two vector sampled signal (a time vector & an amplitude vector)
% L = the number of levels
% mp = the peak quantization level
% isMidrise = 1 (mid-rise) or 0 (mid-tread)

%% Intializations
v = size(y);
SignalElementsNo = v(1);
step = 2*mp/L;
R = ceil(log2(L));
quantizedSignal(:,1) = y(:,1);
BitStream(:,1) = y(:,1);

%% Quantization
for i = 1:SignalElementsNo
   % LevelsNo(i,1) = i;          %LevelsNo contains SignalElementsNo corrospening level 
    if isMidrise == 1       % No zero
        if i == 1   % intial value
            quantizedSignal(1,2) = 0.5*step;    % element voltage
            BitStream(1,R+1) = (L/2)+1;         % element level no
            BitStream(1,R+2) = quantizedSignal(1,2); % element level voltage
        elseif quantizedSignal(i-1,2) < y(i,2)
            quantizedSignal(i,2) = quantizedSignal(i-1,2) + step;
            BitStream(i,R+1) = BitStream(i-1,R+1)+1;
            BitStream(i,R+2) = quantizedSignal(i,2);
        elseif quantizedSignal(i-1,2) > y(i,2)
            quantizedSignal(i,2) = quantizedSignal(i-1,2) - step;
            BitStream(i,R+1) = BitStream(i-1,R+1)-1;
            BitStream(i,R+2) = quantizedSignal(i,2);
        elseif quantizedSignal(i-1,2) == y(i,2)
            quantizedSignal(i,2) = quantizedSignal(i-1,2);
            BitStream(i,R+1) = BitStream(i-1,R+1);
            BitStream(i,R+2) = quantizedSignal(i,2);
        end
        
    else        % Mid-tread % with Zero
        if i == 1   % intial value
            quantizedSignal(1,2) = 0;       % element voltage
            BitStream(1,R+1) = L/2;         % element level no
            BitStream(1,R+2) = quantizedSignal(1,2);    % element level voltage
        elseif quantizedSignal(i-1,2) < y(i,2)
            quantizedSignal(i,2) = quantizedSignal(i-1,2) + step;
            BitStream(i,R+1) = BitStream(i-1,R+1)+1;
            BitStream(i,R+2) = quantizedSignal(i,2);
        elseif quantizedSignal(i-1,2) > y(i,2)
            quantizedSignal(i,2) = quantizedSignal(i-1,2) - step;
            BitStream(i,R+1) = BitStream(i-1,R+1)-1;
            BitStream(i,R+2) = quantizedSignal(i,2);
        elseif quantizedSignal(i-1,2) == y(i,2)
            quantizedSignal(i,2) = quantizedSignal(i-1,2);
            BitStream(i,R+1) = BitStream(i-1,R+1);
            BitStream(i,R+2) = quantizedSignal(i,2);
        end
    end       
end

%% BitStreams
disp(max(BitStream(:,R+1)));
disp(min(BitStream(:,R+1)));
%BitStream(:,R+1) = BitStream(:,R+1) - 1; %making the levels start form zero to save R
disp(max(BitStream(:,R+1)));
disp(min(BitStream(:,R+1)));
de2biInput = BitStream(:,R+1);
BitStream(:,1:R) = de2bi(de2biInput,R,'left-msb');    %Each element bit stream

%% Mean Square Quantization Error
MSQE = (1/SignalElementsNo)*sum((y(:,2)-quantizedSignal(:,2)).^2);

%% ploting
plot(y(:,1),y(:,2),'bo-');
hold on
stairs(quantizedSignal(:,1),quantizedSignal(:,2),'rx-')
xlabel('Time (s)'); ylabel('Voltage (V)');
legend('Signal','QuantizedSignal');
if isMidrise == 0
    title('Mid-tread uniform quantizer')
else
    title('Mid-rise uniform quantizer')
end

end



