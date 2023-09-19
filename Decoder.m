function [D]=Decoder(A,R,Decision,Ap,BitStream)
if (max (A)~=0)
    A=A/Ap;
end

switch Decision
    case 1 %unipoler
        A_decoded=A;
        
    case 0 %polar
        for i=1:length(A)
            switch A(i)
                case 1
                    A_decoded(i)=1;
                case -1
                    A_decoded(i)=0;
            end
        end
end
%%%%% convert from bits to levels %%%
%%%%% put the stream of bits into L*R matrix B
L=length(A_decoded)/R;
B=reshape(A_decoded,[R,L]);
B=transpose(B);

%%% convert value of each row in B into matrix C
C=zeros(1,L);

for i=1:L
    for j = 1:R
        C(i) = C(i) + (B(i,j)) * 2^(j-1);
    end
end

%convert levels to voltage
for i=1:L
    D(i)=BitStream(length(BitStream)-C(i));
end
end