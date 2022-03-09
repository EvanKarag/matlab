%% ask 1
% Author : ? .KARAGIANNIS , ?? 1062660 , Date : 24/12/21
clc
clear

A=[
0.3984 0.1895 0.8423 0.0000;
0.0000 0.5458 0.0000 0.0000;
0.9416 0.4122 0.1788 0.0000;
0.0000 0.0000 0.7134 0.0000;
]

[val,row_ip,col_ip]= sp_mat2latex(A,'csr')



%% ask 2

clc
clear
n=5;
A=[2 2 2;2 2 2;2 2 2]
B=[1 1 1; 1 1 1;1 1 1]
C=[3 3 3;3 3 3;3 3 3]
r=blkToeplitzTrid(n,B,A,C)





%% ask 3
clc
clear

A=[
0 0 0 0 4 2;
0 0 1 1 2 2;
6 3 0 0 0 0;
3 0 0 0 0 0;
2 1 0 0 2 1;
1 1 0 0 1 1]
nb=2; 
[val,brow_idx,bcol_ptr]= sp_mx2bccs(A,nb)
        
  
%% ask 4
clc
clear

A=[
0 0 0 0 4 2;
0 0 1 1 2 2;
6 3 0 0 0 0;
3 0 0 0 0 0;
2 1 0 0 2 1;
1 1 0 0 1 1]



nb=2
x=[1;2;3;4;5;6]
y=[1;1;1;1;1;1]

[val,brow_idx,bcol_ptr]= sp_mx2bccs(A,nb)
[y]= spmv_bccs(y,x,nb,val,brow_idx,bcol_ptr)



%% ask 5
clc 
clear
m=32;
n=64;
nb=m;
y=eye(n*m,1);
x=ones(n*m,1);
T=toeplitz([4,-1,zeros(1,m-2)]);
S=blkToeplitzTrid(n,inv(T),T^2,T);

[val,brow_idx,bcol_ptr]= sp_mx2bccs(S,nb);
[y]= spmv_bccs(y,x,nb,val,brow_idx,bcol_ptr);



