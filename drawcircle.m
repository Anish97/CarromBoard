function drawcircle   %(pos,size,color,vel,width,height)
global pos vel vel2 width height size color1 color2 pos2 cres cfric theta1 theta2 ang1 ang2 beta


%pause
%for i=1:1000

tic
edge11=0;
edge12=0;
edge21=0;
edge22=0;
ke1=0;
ke2=0;

while 1
    cla
    if (pos(1)+size> width | pos(1)-size <0)
        if edge11==0
            in=vel(1)*(1+cres);
            it=(vel(2)+sign(pos(1)-2*size)*size*ang1)/3;
            it*sign(it)*cfric*abs(in);
            if(abs(it)>cfric*abs(in))
             it=sign(it)*cfric*abs(in);
             
            end
             vel=vel-[in it];
             ang1=ang1-sign(pos(1)-2*size)*2*it/size; 
         
            edge11=1;
        end
    else
        edge11=0;
end
    
    if (pos(2)+size>height | pos(2)-size<0)
           if edge12==0
            in=vel(2)*(1+cres);
            it=(vel(1)-sign(pos(2)-2*size)*size*ang1)/3;
            if(abs(it)>cfric*abs(in))
             it=sign(it)*cfric*abs(in);
             
            end
           
             vel=vel-[it in];
             ang1=ang1+sign(pos(2)-2*size)*2*it/size; 
             
   
             
            edge12=1;
           end
     else
            edge12=0;
    end
    
     if (pos2(1)+size> width | pos2(1)-size <0)
        if edge21==0
            in=vel2(1)*(1+cres);
            vel2(1)=vel2(1)-in;
            it=(vel2(2)+sign(pos2(1)-2*size)*size*ang2)/3;
            if(abs(it)>cfric*abs(in))
             it=sign(it)*cfric*abs(in);
            end
             
             vel2(2)=vel2(2)-it;
             ang2=ang2-sign(pos2(1)-2*size)*2*it/size; 

            edge21=1;
        end
     else
        edge21=0;
    end
    if pos2(2)+size>height | pos2(2)-size<0
           if edge22==0
            in=vel2(2)*(1+cres);
            vel2(2)=vel2(2)-in;
            it=(vel2(1)-sign(pos2(2)-2*size)*size*ang2)/3;
            if(abs(it)>cfric*abs(in))
            it=sign(it)*cfric*abs(in);
            end
             
             vel2(1)=vel2(1)-it;
             ang2=ang2+sign(pos2(2)-2*size)*2*it/size; 

            edge22=1;
           end
     else
            edge22=0;
    end
     
    if edge11+edge12+edge21+edge22>0
        checkke();
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
    
%    if sum(vel.^2)>5
    pos(1)=pos(1)+vel(1);
    pos(2)=pos(2)+vel(2);
    if theta1>2*pi
        theta1=mod(theta1,2*pi);
    end
    theta1=theta1+ang1;
%    end
 %   if sum(vel2.^2)>5
    pos2(1)=pos2(1)+vel2(1);
    pos2(2)=pos2(2)+vel2(2);
    if theta2>2*pi
        theta2=mod(theta2,2*pi);
    end
    theta2=theta2+ang2;
%    end
    
    X =[pos(1) pos2(1)];
    Y= [pos(2) pos2(2)];
    
%     vel
%     vel2
%     ang1
%     ang2
    
   txt1=strcat('Kinetic Energy: ',num2str(0.5*(vel(1)^2+vel(2)^2+vel2(1)^2+vel2(2)^2+0.5*(ang1*size)^2+0.5*(ang2*size)^2)));
%    txt1=strcat('Kinetic Energy: ',num2str(0.5*(vel(1)^2+vel(2)^2+0.5*(ang1*size)^2)));
    text(100,410,txt1);
    ke1=0.5*(vel(1)^2+vel(2)^2+0.5*(ang1*size)^2);
    ke2=0.5*(vel2(1)^2+vel2(2)^2+0.5*(ang2*size)^2);
    ke=0.5*(vel(1)^2+vel(2)^2+vel2(1)^2+vel2(2)^2+0.5*(ang1*size)^2+0.5*(ang2*size)^2);
    
    %plot(X(1),Y(1),'rO','Markersize',size,'MarkerFaceColor',color1)
    %pdecirc(X(1),Y(1),size)
    
    circle2(X(1),Y(1),size,theta1);
    hold on
    %plot(X(2),Y(2),'gO','Markersize',size,'MarkerFaceColor',color2)
    circle2(X(2),Y(2),size,theta2);
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

function h = circle2(x,y,r,theta)
d = r*2;
px = x-r;
py = y-r;
h = rectangle('Position',[px py d d],'Curvature',[1,1]);
daspect([1,1,1])
line([x x+r*cos(theta)],[y y+r*sin(theta)]); 

function edge = xwallcollision(pos,vel,ang,edge)
global size width cres cfric
if (pos(1)+size> width | pos(1)-size <0)
        if edge==0
            in=vel(1)*(1+cres);
            it=(vel(2)+sign(pos(1)-2*size)*size*ang)/3;
            if(abs(it)>cfric*abs(in))
             it=sign(it)*cfric*in;
            end

             vel=vel-[in it];
             ang=ang-sign(pos(1)-2*size)*2*it/size; 
         
            edge=1;
        end
    else
        edge=0;
end

function checkke
global vel vel2 size ang1 ang2 ke1 ke2
if ke1<0.5*(vel(1)^2+vel(2)^2+0.5*(ang1*size)^2)
        disp('Ball1');
          disp(ke1-0.5*(vel(1)^2+vel(2)^2+0.5*(ang1*size)^2));
end
if ke2<0.5*(vel2(1)^2+vel2(2)^2+0.5*(ang2*size)^2)
          disp('Ball2');
           disp(ke2-0.5*(vel2(1)^2+vel2(2)^2+0.5*(ang2*size)^2));
end


