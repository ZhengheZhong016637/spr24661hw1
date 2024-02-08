traj20 = solve(20);
traj40 = solve(40);
traj80 = solve(80);

cla;
hold on
xaxis = linspace(-1.5,1.5);
yaxis = linspace(-1.5,1.5);
[Xaxis,Yaxis] = meshgrid(xaxis,yaxis);
a1 = plot(traj20(1,:),traj20(2,:)); M1 = "N=20";
a2 = plot(traj40(1,:),traj40(2,:)); M2 = "N=40";
a3 = plot(traj80(1,:),traj80(2,:)); M3 = "N=80";
legend([a1,a2,a3],[M1,M2,M3]);
saveas(gcf,"mdptfe.jpg");

function traj = solve(N)    
    h = 2*pi/N;
    traj = zeros(2,2*N+1);
    
    y_n = [1;0;0;1];
    traj(:,1)=y_n(1:2);
    
    for t = 2:2*N+1
        y_np1 = y_n+h*f(y_n+h*f(y_n)/2);
        traj(:,t)=y_np1(1:2);    
        y_n=y_np1;
    end
end

function dy = f(y)
    dy = [y(3);y(4);-(y(1)/(y(1)^2+y(2)^2));-(y(2)/(y(1)^2+y(2)^2))];
end