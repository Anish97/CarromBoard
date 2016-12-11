function CircCollision

global vel vel2 size color1 color2 pos pos2 width height cres

cres=0.99;
size =20;
width=400;
height =400;
% x=(width)/2;
% y=(height)/2;

pos =[size+randi(width-2*size)-1+rand(1) size+randi(height-2*size)-1+rand(1)]
% pos=[size+randi(width-2*size)-1+rand(1) pos(2)]
pos2=[size+randi(width-2*size)-1+rand(1) size+randi(height-2*size)-1+rand(1)]

vel =[rand(1)+randi(7)-1 rand(1)+randi(7)-1];
vel(1)=vel(1)*(2*randi(2)-3);
 vel(2)=vel(2)*(2*randi(2)-3);
vel

 vel2 =[rand(1)+randi(7)-1 rand(1)+randi(7)-1];
 vel2(1)=vel2(1)*(2*randi(2)-3); %randomize direction
 vel2(2)=vel2(2)*(2*randi(2)-3);
 vel2


color1 ='red';
color2 ='green';
figure(1)
         %(pos,15,'red',vel,width,height)

end

function drawcircle   %(pos,size,color,vel,width,height)
global pos vel vel2 width height size color1 color2 pos2 cres

disp(width)
%pause
%for i=1:1000
tic
while 1
    if pos(1)+size> width | pos(1)-size <0
        vel(1)=-(cres*vel(1));
    end
    if pos(2)+size>height | pos(2)-size<0
        vel(2)=-(cres*vel(2));
    end
       
    
    if pos2(1)+size> width | pos2(1)-size <0
        vel2(1)=-cres*vel2(1);
    end
    if pos2(2)+size>height | pos2(2)-size<0
        vel2(2)=-cres*vel2(2);
    end
    
    pos(1)=pos(1)+vel(1);
    pos(2)=pos(2)+vel(2);
    
    pos2(1)=pos2(1)+vel2(1);
    pos2(2)=pos2(2)+vel2(2);
    X =[ pos(1) pos2(1)];
    Y= [ pos(2),pos2(2)];
    
    %plot(X(1),Y(1),'rO','Markersize',size,'MarkerFaceColor',color1)
    pdecirc(X(1),Y(1),size)
    hold on
    %plot(X(2),Y(2),'gO','Markersize',size,'MarkerFaceColor',color2)
    pdecirc(X(2),Y(2),size)
    hold off
    axis([0, width, 0, height])
    drawnow
    
    if pos(1) <pos2(1)+size & pos(1) >pos2(1)-size
        if pos(2) <pos2(2)+size & pos(2) >pos2(2)-size
            disp('Collision........')
            collision
%             xi=(pos(1)+pos2(1))/2;
%             yi=(pos(2)+pos2(2))/2;
%             plot(xi,yi,'kO','Markersize',size+10,'MarkerFaceColor','black')
%             axis([0, width, 0, height])
            
        break
        end
    end
end
toc
end