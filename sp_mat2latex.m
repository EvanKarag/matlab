function [val,row_ip,col_ip]= sp_mat2latex(A,sp_type)
% Author : ? .KARAGIANNIS , ?? 1062660 , Date : 24/12/21

switch lower(sp_type) % lower gia thn apofygh bugs apo kefalaia grammata

    case 'csr'
        check_bit_mat=[A~=0]; %logical array gia thn eyresh twn mh mhdenikwn stoixeiwn
        nz_id=1; %non-zero id gia thn arithmish twn stoixeiwn
        row_ip=[];
        col_ip=[];
        val=[];
        for i=1:length(A(1,:))
                row_ip=[row_ip nz_id]; %append ths row_ip array me to non-zero id sto kathe row
         for j=1:length(A(:,1))
              if (check_bit_mat(i,j)) % elegxos mh mhdenikwn stoixeiwn
                 nz_id=nz_id+1;
                 col_ip=[col_ip j] ; %append toy col_ip array me ta columns poy antistoixoyn ta non-zero stoixeia
                 val=[val A(i,j)];
                end
           end 
        end
        row_ip=[row_ip nz_id]; %append ths row_ip array me to non-zero id toy stoixeioy poy anamenetai na kataxorithei
        
       
        % Antistoixh arxh leitoyrgias, me col_ip na apothikeyei ta non-zero id
    case 'csc'
        check_bit_mat=[A~=0];
        nz_id=1;
        row_ip=[];
        col_ip=[];
        val=[];
        for j=1:length(A(:,1))
         col_ip=[col_ip nz_id];
         for i=1:length(A(1,:))
              if (check_bit_mat(i,j))
                 nz_id=nz_id+1;
                 row_ip=[row_ip i];
                 val=[val A(i,j)];
                end
           end 
        end
        col_ip=[col_ip nz_id];

end
end