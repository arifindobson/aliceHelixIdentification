%Label (b) from the Figure.
function generateHelixTrackCSV(x0, y0, z0, pt , pt_Angle,iterr,filename)

  %{
  pt        = 30;
  pt_Angle  = 45;
  iterr     = 15;
  x0 = 20;
  y0 = 20;
  z0 = 0;
  %}

  A = pt * sind(pt_Angle);
  B = pt * cosd(pt_Angle);
  t = [0:0.1:iterr];

  for i=1:length(t)
    x(i) = x0 + A*cos(t(i));
    y(i) = y0 - A*sin(t(i));
    z(i) = z0 + B*t(i);
  endfor
  
  dataSort = [x' y' z'];
  csvwrite(filename, dataSort);
  
  plot3(z,x,y,'.','markersize',10)
  hold on 
  %plot3(z0,x0,y0,'k*')
  xlabel('Z Axis');
  ylabel('X Axis');
  zlabel('Y Axis');
  %figure, plot(ang);
  %{
  figure, plot(x,y,'rx')
  hold on
  plot(x0,y0,'k*')
  xlabel('X Axis');
  ylabel('Y Axis');
  %}
end
