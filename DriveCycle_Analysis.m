% ******************************
DriveCycle=xlsread('FUDS');
V=DriveCycle(:,2)*1.6;
N=length(V); % Find out how many readings.
D=zeros(1,N); % Record of distance travelled in km.
for C=2:N
    %Acceleration
    accel=(V(C) - V(C-1))/3.6;
    %Distance Travelled
    D(C) = D(C-1) + (V(C)/3.6/1000);%Distance
    TIME(C)=C; % Time
    VEL(C)=V(C); %Velocity (Drive Cycle)
    ACC(C)=accel; %Acceleration (Drive Cycle)
    DIST(C)=D(C); % Current from Battery
    Vmax=max(VEL);
    Accmax=max(ACC);
end
subplot(3,1,1);
plot(TIME,VEL,"LineWidth",1);
xlabel('Time(sec)');
ylabel('Vehicle Speed (km/hr)');
str=['Max Velocity :',num2str(Vmax),' km/hr'];
title(str);
subplot(3,1,2);
plot(TIME,ACC);
xlabel('Time(sec)');
ylabel('Vehicle Acceleration(m/s2)');
str=['Max Acc :',num2str(Accmax),' m/s2'];
title(str);
subplot(3,1,3);
plot(TIME,DIST);
xlabel('Time(sec)');
ylabel('Distance covered (km)');
str=['Distance travelled :',num2str(DIST(:,end)),' km'];
title(str);