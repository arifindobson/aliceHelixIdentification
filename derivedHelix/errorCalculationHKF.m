%Helix Kalman Filter Error Calculation
%Label (f) from the Figure.
filenameP=sprintf('./data/helixParameter.csv');
params = load(filenameP);
format short e

for j = 1:rows(params)
  xC = params(j,2);
  yC = params(j,3);
  zC = params(j,4);
  R  = params(j,5); 
  filenameKN = sprintf('./data/%d_dHelix.csv',j);
  [Ak,P,Pm,Residue,Chi2,mMse] = HelixFitterExtendedKalmanMOD(M =  csvread(filenameKN),Pc =[xC yC]',r= R, tanLamda = (-120 / (2 * pi) )/r,processError=[10 1 1 10 1]',measError=[r/10 r/10 r/10]');
  
  chiDat(j,1)=j;
  mseDat(j,1)=j;
  chiDat(j,2)=R;
  mseDat(j,2)=R;
  chiDat(j,3)=mean(Chi2);
  mseDat(j,3)=mMse;
  l=4;
  for i = 2:2:10
    filenameK = sprintf('./data/%d_dHelix_nLvl_%d.csv',j,i);
    [Ak,P,Pm,Residue,Chi2,mMse] = HelixFitterExtendedKalmanMOD(M =  csvread(filenameK),Pc =[xC yC]',r= R, tanLamda = (-120 / (2 * pi) )/r,processError=[10 1 1 10 1]',measError=[r/10 r/10 r/10]');
    chiDat(j,l)=mean(Chi2);
    mseDat(j,l)=mMse;
    l++;
  endfor
endfor

errFile1 = sprintf('./data/chiErrorHKFX.csv');
errFile2 = sprintf('./data/mseErrorHKFX.csv');
csvwrite(errFile1,chiDat);
csvwrite(errFile2,mseDat);
