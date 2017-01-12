function CircCollision

global vel size color1 color2 pos width height cres cfric theta ang beta particles

cres=0.9;
cfric=0.1;
beta=0.5;
size =10;
width=200;
height =200;
particles=5;
maxvel=10;
maxang=1;
% x=(width)/2;
% y=(height)/2;

%pos =[size+randi(width-2*size)-1+rand(1) size+randi(height-2*size)-1+rand(1)];
pos=size+randi(width-2*size,particles,2)-1+rand(particles,2)
%pos2=[size+randi(width-2*size)-1+rand(1) pos(2)]
%pos2=[size+randi(width-2*size)-1+rand(1) size+randi(height-2*size)-1+rand(1)];

ang=rand(particles,1).*(2*randi(2,particles,1)-3)*maxang
%ang2=rand(1)*(2*randi(2)-3);
%ang1=20;
%ang2=20;
theta=rand(particles,1)*(2*pi/7)
%theta2=randi(7)*(2*pi/7)

vel =(rand(particles,2)+randi(maxvel,particles,2)-1).*(2*randi(2,particles,1)-3)
%vel(1)=10;
%vel(2)=0;
color1 ='red';
color2 ='green';
%pos(1,:)=[153 100.2];
%pos(2,:)=[52 100.2];
%vel(1,:)=[-5 0];
%vel(2,:)=[3 0];
figure(1)
         %(pos,15,'red',vel,width,height)

end