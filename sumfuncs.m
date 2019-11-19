%%problem 15 lab 1

function[s]=sumfuncs(Y) %s=vector; sum of all rows
%sum up the rows(individual functions)of Y
sizeY= size(Y);
nrowsY= sizeY(1);
ncolsY= sizeY(2);%no.of columns

s=zeros(1,ncolsY);
for ii= 1:nrowsY
    s(1,:)=  s(1,:)+ Y(ii,:);%add row 0and 1;then 01and 2 then012and 3...
end;

%%
%slower way would be doing element wise in each row
%for ii=1:nrowaY
%    for jj= 1:ncolsY
%        s(1,jj) =s(1,jj)+ Y(ii,jj);
%    end;
%end;