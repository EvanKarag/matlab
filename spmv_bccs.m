function [y]= spmv_bccs(y,x,nb,val,brow_idx,bcol_ptr)
% Author : ? .KARAGIANNIS , ?? 1062660 , Date : 24/12/21

r=zeros(length(x),1);
count_id=0;
%Anazitish mh midenikwn ypopinakwn ston synueto pinaka
for i=1:nb*nb:length(val)
    count_id=count_id+1;
    c=-1;
    row_point=(brow_idx(count_id)-1)*nb+1;
    helper_var=find(bcol_ptr==count_id);
    if ~isempty(helper_var)
        col_point=(helper_var-1)*nb+1;
    end
   for j=0:nb-1
       for k=0:nb-1
           c=c+1;
           r(row_point+k)=r(row_point+k)+val(i+c)*x(col_point+j); % Pollaplasiasmos toy synthetoy pinaka me to dianysma x
       end
   end
end

y=y+r; %Prosthesh toy dianismatos y me to apotelesma toy pollaplasiasmoy


end