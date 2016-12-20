function drawcircle   %(pos,size,color,vel,width,height)
global vel size color1 color2 pos width height cres cfric theta ang beta particles edge


%pause
%for i=1:1000

tic
edge=zeros(particles,2);
col=zeros(particles,particles);
ke1=0;
ke2=0;

while 1
    cla
for i=1:particles
    xwallcollision(i);    
    ywallcollision(i);
   
%     if (pos(1,2)+size>height | pos(1,2)-size<0)
%            if edge12==0
%             in=vel(1,2)*(1+cres);
%             it=(vel(1,1)-sign(pos(1,2)-2*size)*size*ang(1))/3;
%             if(abs(it)>cfric*abs(in))
%              it=sign(it)*cfric*abs(in);
%              
%             end
%            
%              vel=vel-[it in;0 0];
%              ang(1)=ang(1)+sign(pos(1,2)-2*size)*2*it/size; 
%              
%    
%              
%             edge12=1;
%            end
%      else
%             edge12=0;
%     end
    
%      if (pos2(1)+size> width | pos2(1)-size <0)
%         if edge21==0
%             in=vel2(1)*(1+cres);
%             vel2(1)=vel2(1)-in;
%             it=(vel2(2)+sign(pos2(1)-2*size)*size*ang2)/3;
%             if(abs(it)>cfric*abs(in))
%              it=sign(it)*cfric*abs(in);
%             end
%              
%              vel2(2)=vel2(2)-it;
%              ang2=ang2-sign(pos2(1)-2*size)*2*it/size; 
% 
%             edge21=1;
%         end
%      else
%         edge21=0;
%     end
%     if pos2(2)+size>height | pos2(2)-size<0
%            if edge22==0
%             in=vel2(2)*(1+cres);
%             vel2(2)=vel2(2)-in;
%             it=(vel2(1)-sign(pos2(2)-2*size)*size*ang2)/3;
%             if(abs(it)>cfric*abs(in))
%             it=sign(it)*cfric*abs(in);
%             end
%              
%              vel2(1)=vel2(1)-it;
%              ang2=ang2+sign(pos2(2)-2*size)*2*it/size; 
% 
%             edge22=1;
%            end
%      else
%             edge22=0;
%     end
     
    if sum(edge)>0
        checkke();
    end
        
    for j=i+1:particles
    if ((pos(j,2)-pos(i,2))^2+(pos(j,1)-pos(i,1))^2) <= 4*size^2
            if col(i,j)==0
            disp('Collision........')
            collisionvelocities(i,j);
            col(i,j)=1;
            end
            else
                col(i,j)=0;
    end
    end
    
%    if sum(vel.^2)>5
   

    if theta(i)>2*pi
        theta(i)=mod(theta(i),2*pi);
    end
end
     pos=pos+vel;
    theta=theta+ang;

%     vel
%     vel2
%     ang1
%     ang2
    
    txt1=strcat('Kinetic Energy: ',num2str(sum(0.5*(sum(vel.^2)+0.5*sum(ang.^2)*size^2))));
%    txt1=strcat('Kinetic Energy: ',num2str(0.5*(vel(1)^2+vel(2)^2+0.5*(ang1*size)^2)));
    text(100,410,txt1);
%    ke1=0.5*(vel(1)^2+vel(2)^2+0.5*(ang1*size)^2);
%    ke2=0.5*(vel2(1)^2+vel2(2)^2+0.5*(ang2*size)^2);
    ke=0.5*(sum(vel.^2))+0.25*size^2*sum(ang.^2);
    
    %plot(X(1),Y(1),'rO','Markersize',size,'MarkerFaceColor',color1)
    %pdecirc(X(1),Y(1),size)
    for i=1:particles
    circle2(i);
    end
    hold on
    
    %plot(X(2),Y(2),'gO','Markersize',size,'MarkerFaceColor',color2)
%    circle2(2);
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

function h = circle2(i)
global pos theta size
r=size;
d = r*2;
px = pos(i,1)-r;
py = pos(i,2)-r;
h = rectangle('Position',[px py d d],'Curvature',[1,1]);
daspect([1,1,1])
line([pos(i,1) pos(i,1)+r*cos(theta(i))],[pos(i,2) pos(i,2)+r*sin(theta(i))]); 

function edge = xwallcollision(i)
global size width cres cfric pos vel edge ang
if (pos(i,1)+size> width | pos(i,1)-size <0)
        if edge(i,1)==0
            in=vel(i,1)*(1+cres);
            it=(vel(i,2)+sign(pos(i,1)-2*size)*size*ang(i))/3;
            it*sign(it)*cfric*abs(in);
            if(abs(it)>cfric*abs(in))
             it=sign(it)*cfric*abs(in);
             
            end
             vel(i,:)=vel(i,:)-[in it];
             ang(i)=ang(i)-sign(pos(i,1)-2*size)*2*it/size; 
         
            edge(i,1)=1;
        end
    else
        edge(i,1)=0;
end

function edge = ywallcollision(i)
global size height cres cfric pos vel edge ang
if (pos(i,2)+size>height | pos(i,2)-size<0)
           if edge(i,2)==0
            in=vel(i,2)*(1+cres);
            it=(vel(i,1)-sign(pos(i,2)-2*size)*size*ang(i))/3;
            if(abs(it)>cfric*abs(in))
             it=sign(it)*cfric*abs(in);
             
            end
           
             vel(i,:)=vel(i,:)-[it in];
             ang(i)=ang(i)+sign(pos(i,2)-2*size)*2*it/size; 
             
   
             
            edge(i,2)=1;
           end
     else
            edge(i,2)=0;
end
    

function checkke
global vel size ang ke1 ke2
if ke1<0.5*(vel(1,1)^2+vel(1,2)^2+0.5*(ang(1)*size)^2)
        disp('Ball1');
          disp(ke1-0.5*(vel(1,1)^2+vel(1,2)^2+0.5*(ang(1)*size)^2));
end
if ke2<0.5*(vel(2,1)^2+vel(2,2)^2+0.5*(ang(2)*size)^2)
        disp('Ball1');
          disp(ke2-0.5*(vel(2,1)^2+vel(2,2)^2+0.5*(ang(2)*size)^2));
end

