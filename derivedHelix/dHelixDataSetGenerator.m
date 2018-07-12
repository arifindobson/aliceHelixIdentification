%This program is made by Arifin Dobson
%A Program to generate helix track for UndergradThesis
%The dataset will then be used by Kalman Filter to detect it.
%Label (a) from the Figure.
clear all;
close all;

n_track = 20;
momn=0.5;

for o=1:n_track;
 x0=10*rand;
 y0=20*rand;
 z0=3*rand;
 pt=momn;
 momn = momn + 3.5;
 angle=60;
 r = pt * sind(angle);
 param(o,:)=[o x0 y0 z0 r pt angle];
 filenameP=sprintf('./data/helixParameter.csv');
 csvwrite(filenameP,param);
endfor

for i=1:rows(param)
    x=param(i,2);
    y=param(i,3);
    z=param(i,4);
    p=param(i,6);
    pan=param(i,7);
    filename=sprintf('./data/%d_dHelix.csv',i);
    generateHelixTrackCSV(x,y,z,p,pan,15,filename)
  endfor
