function [val,brow_idx,bcol_ptr]= sp_mx2bccs(A,nb)
% Author : ? .KARAGIANNIS , ?? 1062660 , Date : 24/12/21
      
check_bit_mat=[A~=0];
        check_bit_block_mat=[];
        for i=1:nb:length(check_bit_mat(1,:))                 %Dhmioyrgeia check_bit_block_mat gia ton syntheto pinaka
            r_bl_check=[];
            for j=1:nb:length(check_bit_mat(:,1))
              r_bl_check=[r_bl_check sum(sum(check_bit_mat(i:i+nb-1,j:j+nb-1)))~=0];
            end
            check_bit_block_mat=[check_bit_block_mat ;r_bl_check];
        end
  % Efarmogh algorithmoy csc gia ton syntheto pinaka
        nz_id=1;
        brow_idx=[];
        bcol_ptr=[];
        val=[];
        for j=1:length(check_bit_block_mat(:,1))
         bcol_ptr=[bcol_ptr nz_id];
         for i=1:length(check_bit_block_mat(1,:))
              if (check_bit_block_mat(i,j))
                 nz_id=nz_id+1;
                 brow_idx=[brow_idx i];
                 val=[val reshape(A(((i-1)*nb+1):((i-1)*nb+nb),((j-1)*nb+1):((j-1)*nb+nb)),[1,nb*nb])]; %Apothikeysh twn stoixeiwn twn mh midenikwn ypopinakwn
                 end
           end 
        end
        bcol_ptr=[bcol_ptr nz_id];

end