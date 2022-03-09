function R=blkToeplitzTrid(n,B,A,C)
% Author : ? .KARAGIANNIS , ?? 1062660 , Date : 24/12/21
R=[];
m=length(A(1,:));
N=n*m;
for i=1:n                                               % kataskeyh pinaka
R=[R ; zeros(m,(i-1)*m) B A C zeros(m,N-m-(i-1)*m)];    %[B A C 0 0]   
end                                                     %[0 B A C 0]
                                                        %[0 0 B A C]


R(:,1:m)=[];                                            % Afairesh ths prwths column toy synthetoy pinaka
R(:,(end-(m-1)):end)=[];                                % Afairesh ths teleytaias column toy synthetoy pinaka
end