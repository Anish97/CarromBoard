function CircCollision

global vel vel2 size color1 color2 pos pos2 width height cres cfric theta1 theta2 ang1 ang2 beta

cres=1;
cfric=10000;
beta=0;
size =20;
width=400;
height =400;

% x=(width)/2;
% y=(height)/2;

%pos =[size+randi(width-2*size)-1+rand(1) size+randi(height-2*size)-1+rand(1)];
pos=[200 200]
%pos2=[size+randi(width-2*size)-1+rand(1) pos(2)]
%pos2=[size+randi(width-2*size)-1+rand(1) size+randi(height-2*size)-1+rand(1)];
pos2=[300 200]
ang1=rand(1);
ang2=rand(1);
ang1=ang1*(2*randi(2)-3);
ang2=ang2*(2*randi(2)-3);
ang1=2;
ang2=-2;
theta1=randi(7)*(2*pi/7)
theta2=randi(7)*(2*pi/7)

vel =[rand(1)+randi(10)-1 rand(1)+randi(10)-1];
vel(1)=vel(1)*(2*randi(2)-3);
%vel(2)=vel(2)*(2*randi(2)-3);
vel(1)=10;
vel(2)=0;
vel

 vel2 =[rand(1)+randi(10)-1 rand(1)+randi(10)-1];
 vel2(1)=vel2(1)*(2*randi(2)-3); %randomize direction
% vel2(2)=vel2(2)*(2*randi(2)-3);
vel2(1)=-5;
 vel2(2)=0;
 vel2


color1 ='red';
color2 ='green';
figure(1)
         %(pos,15,'red',vel,width,height)

end