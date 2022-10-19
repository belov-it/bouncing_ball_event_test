p.g = 9.81;

t0 = 0;
tk = 40;

x0 = 0; vx0 = 0; y0 = 6; vy0 = 0;

N = 10; % count of bounce
yRes = [];
tRes = [];

opt = odeset('Events', @(t,q)h0EventFnc(t,q,p), 'MaxStep',0.1);

for i = 1:N
  solve = ode45(@(t,q) rightPart(t,q,p), [t0 tk], [x0;vx0;y0;vy0],opt);

  tInt = solve.x;
  x = solve.y(1,:);
  vx = solve.y(2,:);
  y = solve.y(3,:);
  vy = solve.y(4,:);

  yRes = [yRes y];
  tRes = [tRes tInt];

  timeEnd = solve.xe(end);
  xe = solve.ye(end,1);
  vxe = solve.ye(end,2);
  ye = solve.ye(end,3);
  vye = -0.9*solve.ye(end,4);

  x0 = xe; vx0 = vxe; y0 = ye; vy0 = vye;
  t0 = timeEnd;
end

figure
plot(tRes,yRes);
grid on;
xlabel('t,c');
ylabel('y,m');
hold off;
