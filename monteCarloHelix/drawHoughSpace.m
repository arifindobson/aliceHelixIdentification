%Function to Draw Hough Circle Finder Parameter
%Label (b) from the Figure.
function drawHoughSpace(xx,yy,R)
  %data=load(filename);

  X=xx;
  Y=yy;

  rx=(max(X)-min(X))/2;
  ry=(max(Y)-min(Y))/2;
  %Ravg=(rx+ry)/2;
  Ravg=R;

  theta=[1:15:360];

  tic; %Processing

  %Hough Transform
  for j=1:rows(X)
    for i=1:length(theta)
      a(j,i)=X(j)-Ravg*cosd(theta(i));
      b(j,i)=Y(j)-Ravg*sind(theta(i));
    endfor
  endfor

  t=toc %Processing Time
  figure
  plot(a,b,'k')
  hold on
  plot(X,Y,'*')
  hold off
  %figure,surface(a.*b)
  %plot3(X,Y,Z)
