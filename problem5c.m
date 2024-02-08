N = 80;
h = 2*pi/N;
traj = zeros(2,2*N+1);

y_nm1 = [1;0;0;1];
traj(:,1)=y_nm1(1:2);
y_n = [cos(2*pi/N);sin(2*pi/N);-cos(2*pi/N);-sin(2*pi/N)];
traj(:,2)=y_n(1:2);

for t = 3:2*N+1
    y_np1 = -4*y_n+5*y_nm1+h*(-6*f(y_n)+2*f(y_nm1));
    traj(:,t)=log(y_np1(1:2));
    y_nm1=y_n;
    y_n=y_np1;
end

plot(traj(1,:),traj(1,:))


function dy = f(y)
    dy = [y(3);y(4);-(y(1)/(y(1)^2+y(2)^2));-(y(2)/(y(1)^2+y(2)^2))];
end