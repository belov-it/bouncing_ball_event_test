function res = rightPart(t,q,p)
  x = q(1);
  vx = q(2);
  y = q(3);
  vy = q(4);

  dx = vx;
  dvx = 0;
  dy = vy;
  dvy = -p.g;

  res = [dx, dvx, dy, dvy];
end
