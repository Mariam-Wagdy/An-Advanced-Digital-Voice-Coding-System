function [A_encoded,decision,Tb,Ap,R]=Encoder(A)
% A is L*R matrix, R is number of bits/sample, L is number of samples
[L,R]=size(A);
B=zeros(1,L*R);
%%% put the bits into a stream, from A (L*R) ->>> B(1*LR)
k=1;
for i=1:L
    for j=1:R
        B(k)=A(i,j);
        k=k+1;
    end
end
% B=reshape(A,[1,L*R]);
% B=transpose(B);

decision=input('Enter 1 for unipoler or 0 for polar representation');
while(decision ~=1 && decision ~=0)
    disp("Choice isn't valid, try again");
    decision=input('Enter 1 for unipoler, or 0 for polar representation');
end

switch decision
    case 1
        Ap=input('enterc pulse amplitude in volt');
        Tb=input('enter bit duration in s');
        A_encoded=Ap.*B;
    case 0
        Ap=input('enter pulse amplitude in volt');
        Tb=input('enter bit duration in s');
        for i=1:length(B)
            switch B(i)
                case 1
                    A_encoded(i)=Ap;
                case 0
                    A_encoded(i)=-Ap;
            end
        end
        
end
t = 0:Tb:Tb*(length(1:10)-1);

figure;
hold on
stairs(t,A_encoded(1:10))
hold off
title('Encoded Message')

end