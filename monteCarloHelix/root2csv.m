%Function to Sort TPC ROOT file to CSV
%The ROOT file consist of gx0,gx1,gx2
%Label (a) from the Figure.

function root2csv(fileRead,fileWrite)
  dataLoad = dlmread(fileRead,'*',3,2);
  dataCut  = dataLoad(1:rows(dataLoad)-2,1:3);
  dataSort = sortrows(dataCut,3);
  csvwrite(fileWrite, dataSort);
  
  gx0 = dataSort(:,1);
  gx1 = dataSort(:,2);
  gx2 = dataSort(:,3);
  
  a=min(gx2);
  b=max(gx2);
  figure,plot3(gx2,gx0,gx1,'.');
  xlabel('Z axis');
  ylabel('X axis');
  zlabel('Y axis');
  title (sprintf("Data Points from Z=%dcm until %dcm",a,b));
  
  
end
