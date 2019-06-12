%% Init ROS

if(~robotics.ros.internal.Global.isNodeActive)
  rosinit('172.28.34.99');
end

%% Plot robot
clear all
%Bottom Cube
posX = [];
posY = [];
posZ = [];
angX = [];
angY = [];
angZ = [];

dataX = [];
dataY = [];
dataZ = [];

%Odom subscriber
subOdom = rossubscriber('/robot1/odom');

%Lasers subscriber
subScan = rossubscriber('/robot1/scan');

while(true)
    updatePos();
    updateScan();
    
    plot3(posX,posY,posZ,'ro', 'MarkerFaceColor', 'r');
    pause(.5);
end


function [] = updatePos()
msg = receive(subOdom,10);

posX = horzcat(posX, msg.Pose.Pose.Position.X);
posY = horzcat(posY, msg.Pose.Pose.Position.Y);
posZ = horzcat(posZ, msg.Pose.Pose.Position.Z);
angX = horzcat(angX, msg.Twist.Twist.Angular.X);
angY = horzcat(angY, msg.Twist.Twist.Angular.Y);
angZ = horzcat(angZ, msg.Twist.Twist.Angular.Z);
end


function [] = updateScan()
msg = receive(subScan,10);
distance = msg.Ranges(1);

dataX = horzcat(dataX, msg.Pose.Pose.Position.X);
dataY = horzcat(dataY, msg.Pose.Pose.Position.Y);
dataZ = horzcat(dataZ, msg.Pose.Pose.Position.Z);
end