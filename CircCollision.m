function CircCollision

global vel vel2 size color1 color2 pos pos2 width height cres cfric theta1 theta2 ang1 ang2

cres=1;
cfric=1000000000;
size =20;
width=400;
height =400;

% x=(width)/2;
% y=(height)/2;

pos =[size+randi(width-2*size)-1+rand(1) size+randi(height-2*size)-1+rand(1)];
% pos=[size+randi(width-2*size)-1+rand(1) pos(2)]
pos2=[size+randi(width-2*size)-1+rand(1) size+randi(height-2*size)-1+rand(1)];
ang1=rand(1);
ang2=rand(1);
ang1
ang2
theta1=randi(7)*(2*pi/7)
theta2=randi(7)*(2*pi/7)

vel =[rand(1)+randi(10)-1 rand(1)+randi(10)-1];
% vel(1)=vel(1)*(2*randi(2)-3);
%vel(2)=vel(2)*(2*randi(2)-3);
vel

 vel2 =[rand(1)+randi(10)-1 rand(1)+randi(10)-1];
 vel2(1)=vel2(1)*(2*randi(2)-3); %randomize direction
 vel2(2)=vel2(2)*(2*randi(2)-3);
 vel2


color1 ='red';
color2 ='green';
figure(1)
         %(pos,15,'red',vel,width,height)

end
