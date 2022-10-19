function [value,isterminal,direction] = h0EventFnc (t, q, p)
  y = q(3);
  value = y;
  isterminal =  1; % Остановить процесс интегрирования
  direction  = 0; %
end
