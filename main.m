clc;
clear
A=[0 1 0 1 1 1 0 0 1 1 0 1 0 1 1];
[S,D,Tb,Ap,R]=Encoder(A);     % [encoded signal, decision(poler/ unipolar)]=
                      % Encoder(quantized signal)
%%disp(S);



ps=bandpower(A);      % estimating power of signal
t = 0:Tb:Tb*(length(S)-1);

figure;
tiledlayout(4,1)

% for N=0.5
N=0.5;
pn=(N)^2;             % signal power
y = awgn(S,ps/pn);
nexttile
stairs(t,S,'linewidth',1)
hold on
stairs(t,y,'linewidth',1)
legend('Pure Sampled Signal','Signal with Noise')
title('For Standerd deviation =0.5')



% for N=1
N=1;
pn=(N)^2;             % signal power
y = awgn(S,ps/pn);
nexttile
stairs(t,S,'linewidth',1)
hold on
stairs(t,y,'linewidth',1)
legend('Pure Sampled Signal','Signal with Noise')
title('For Standerd deviation =1')

% for N=3
N=3;
pn=(N)^2;             % signal power
y = awgn(S,ps/pn);
nexttile
stairs(t,S,'linewidth',1)
hold on
stairs(t,y,'linewidth',1)
legend('Pure Sampled Signal','Signal with Noise')
title('For Standerd deviation =3')

% for N=05
N=5;
pn=(N)^2;             % signal power
y = awgn(S,ps/pn);
nexttile
stairs(t,S,'linewidth',1)
hold on
stairs(t,y,'linewidth',1)
legend('Pure Sampled Signal','Signal with Noise')
title('For Standerd deviation =5')




% figure;
% tiledlayout(4,1)
% 
% % for N=0.5 Regenerator
% N=0.5;
% pn=(N)^2;             % signal power
% y = awgn(S,ps/pn);
% Q=Regenerater(y,R,D,Ap);
% W=Decoder(Q,R,D,Ap);
% nexttile
% stairs(t,S,'linewidth',1)
% hold on
% stairs(t,y,'linewidth',1)
% stairs(t,W,'linewidth',1)
% legend('Encoded Signal','Noisy Signal','Decoded Message')
% title('For Noise Standerd deviation =0.5')
% 
% % for N=1 Regenerator
% N=1;
% pn=(N)^2;             % signal power
% y = awgn(S,ps/pn);
% Q=Regenerater(y,R,D,Ap);
% W=Decoder(Q,R,D,Ap);
% nexttile
% stairs(t,S,'linewidth',1)
% hold on
% stairs(t,y,'linewidth',1)
% stairs(t,W,'linewidth',1)
% legend('Encoded Signal','Noisy Signal','Decoded Message')
% title('For Noise Standerd deviation =1')
% 
% 
% 
% % for N=3 Regenerator
% N=3;
% pn=(N)^2;             % signal power
% y = awgn(S,ps/pn);
% Q=Regenerater(y,R,D,Ap);
% W=Decoder(Q,R,D,Ap);
% nexttile
% stairs(t,S,'linewidth',1)
% hold on
% stairs(t,y,'linewidth',1)
% stairs(t,W,'linewidth',1)
% legend('Encoded Signal','Noisy Signal','Decoded Message')
% title('For Noise Standerd deviation =3')
% 
% 
% % for N=5 Regenerator
% N=5;
% pn=(N)^2;             % signal power
% y = awgn(S,ps/pn);
% Q=Regenerater(y,R,D,Ap);
% W=Decoder(Q,R,D,Ap);
% nexttile
% stairs(t,S,'linewidth',1)
% hold on
% stairs(t,y,'linewidth',1)
% stairs(t,W,'linewidth',1)
% legend('Encoded Signal','Noisy Signal','Decoded Message')
% title('For Noise Standerd deviation =5')
% 
% 
% 
% 
% % W=Decoder(S,3,D);     % decoder (signal, number-of-bits-per-sample,
% %                       % encoder decision (poler/ unipolar)) 
% % t = 0:Tb:Tb*(length(W)-1);
% % figure;
% % stairs(t,S,'linewidth',1)
% % hold on
% % stairs(t,W,'linewidth',1)
% 
% 
% %%Q=Regenerater(y,3,D,Ap);
% %%disp(Q)


