function drawcircle   %(pos,size,color,vel,width,height)
global pos vel vel2 width height size color1 color2 pos2 cres


disp(width)
%pause
%for i=1:1000
tic
edge11=0;
edge12=0;
edge21=0;
edge22=0;
while 1
    cla
    
    if (pos(1)+size> width | pos(1)-size <0)
        if edge11==0
            vel(1)=-(cres*vel(1));
            edge11=1;
        end
    else
        edge11=0;
    end
    
    if pos(2)+size>height | pos(2)-size<0
           if edge12==0
            vel(2)=-(cres*vel(2));
            edge12=1;
           end
     else
            edge12=0;
    end
    
     if (pos2(1)+size> width | pos2(1)-size <0)
        if edge21==0
            vel2(1)=-(cres*vel2(1));
            edge21=1;
        end
     else
        edge21=0;
    end
    if pos2(2)+size>height | pos2(2)-size<0
           if edge22==0
            vel2(2)=-(cres*vel2(2));
            edge22=1;
           end
     else
            edge22=0;
     end
        
    
    if ((pos2(2)-pos(2))^2+(pos2(1)-pos(1))^2) <= 4*size^2
        
            disp('Collision........')
            collisionvelocities();
%             xi=(pos(1)+pos2(1))/2;
%             yi=(pos(2)+pos2(2))/2;
%             plot(xi,yi,'kO','Markersize',size+10,'MarkerFaceColor','black')
%             axis([0, width, 0, height])
            
     %   break
       
    end
    
    pos(1)=pos(1)+vel(1);
    pos(2)=pos(2)+vel(2);
    
    pos2(1)=pos2(1)+vel2(1);
    pos2(2)=pos2(2)+vel2(2);
    X =[ pos(1) pos2(1)];
    Y= [ pos(2),pos2(2)];
    txt1=strcat('Kinetic Energy: ',num2str(0.5*(vel(1)^2+vel(2)^2+vel2(1)^2+vel2(2)^2)));
    text(100,410,txt1);

    
    %plot(X(1),Y(1),'rO','Markersize',size,'MarkerFaceColor',color1)
    %pdecirc(X(1),Y(1),size)
    circle2(X(1),Y(1),size);
    hold on
    %plot(X(2),Y(2),'gO','Markersize',size,'MarkerFaceColor',color2)
    circle2(X(2),Y(2),size);
    hold off
    axis([0, width, 0, height])
    drawnow
    
end
toc

function h = circle(x,y,r)
hold on
th = 0:pi/50:2*pi;
xunit = r * cos(th) + x;
yunit = r * sin(th) + y;
h = plot(xunit, yunit);
hold off

function h = circle2(x,y,r)
d = r*2;
px = x-r;
py = y-r;
h = rectangle('Position',[px py d d],'Curvature',[1,1]);
daspect([1,1,1])