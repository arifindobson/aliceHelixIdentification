%Helix Kalman Filter Error Calculation
%Label (e) from the Figure.
filenameP=sprintf('helixID.csv');
params = load(filenameP);

for j = 1:rows(params)
  xC = params(j,3);
  yC = params(j,4);
  R  = params(j,5); 
  filenameKN = sprintf('%d_mcHelix.csv',j);
  [Ak,P,Pm,Residue,Chi2,mMse] = HelixFitterExtendedKalmanMOD(M = csvread(filenameKN),Pc =[xC yC]',r= R, tanLamda = (-120 / (2 * pi) )/r,processError=[10 1 1 10 1]',measError=[r/10 r/10 r/10]');
  
  chiDat(j,1)=j;
  mseDat(j,1)=j;
  chiDat(j,2)=mean(Chi2);
  mseDat(j,2)=mMse;

endfor

errFile1 = sprintf('chiErrorHKF.csv');
errFile2 = sprintf('mseErrorHKF.csv');
csvwrite(errFile1,chiDat);
csvwrite(errFile2,mseDat);
