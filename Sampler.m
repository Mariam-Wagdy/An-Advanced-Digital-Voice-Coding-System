function [smapledSignal] = Sampler(signal, fs)
% this function samples signals with a given sampling frequancy
% signal = two vector signal (a time vector & an amplitude vector)
% fs = sampling frequancy

%% intiations
dTs = 1/fs;  % Ts
v = size(signal);
dTm = signal(2,1)-signal(1,1);
n = dTm/dTs;
SignalElementsNo = v(1);
c = 1; % counter

%% sampling
for Ts = 0:dTs:SignalElementsNo
    smapledSignal(c+1,1) = Ts;
    i = floor((c-1)/n)+1;
    if i > SignalElementsNo
        break
    end
    smapledSignal(c,2) = signal(i,2);
    c = c + 1;
end



%% plotting
plot(signal(:,1),signal(:,2),'bo-',smapledSignal(:,1),smapledSignal(:,2),'rx-');
xlabel('Time (s)'); ylabel('Voltage (V)');
legend('Signal','SampledSignal');

    title('The Sampled Signal')

figure

end

