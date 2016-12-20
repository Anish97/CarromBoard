function collisionvelocities(p,q)
global vel size color1 color2 pos width height cres cfric theta ang beta particles
% theta=atan((pos2(2)-pos(2))/(pos2(1)-pos(1)));
% sint=sin(theta);
% cost=cos(theta);

% B=[vel(2)*cost-vel(1)*sint; vel2(2)*cost-vel2(1)*sint; (vel(1)*cost+vel(2)*sint)*(1+cres)/2+(vel2(1)*cost+vel2(2)*sint)*(1-cres)/2; (vel(1)*cost+vel(2)*sint)*(1-cres)/2+(vel2(1)*cost+vel2(2)*sint)*(1+cres)/2];
% A=[-sint cost 0 0;0 0 -sint cost;0 0 cost sint;cost sint 0 0];
% pCell = num2cell(inv(A)*B);
% [vel(1) vel(2) vel2(1) vel2(2)] = pCell{:};
velv=[vel zeros(particles,1)];
k=pos(q,:)-pos(p,:);
k=[k/norm(k) 0];
angv=[zeros(particles,2) ang];
g=velv(p,:)-velv(q,:);
s=0.5*(angv(p,:)+angv(q,:));
A=-0.5*(1+cres)*dot(g,k);
G=g+2*size*cross(s,k);
j=cross(cross(G,k),k)/norm(cross(G,k));

if k(2)==0
    j=[-sign(G(2)) 0 0];
end

mu=3*cfric*(1+cres)/(1+beta);
phi=acos(dot(g,k)/norm(g));
if tan(phi)<mu
    B=-(1+beta)*dot(G,j)/6;
else
    B=-cfric*A;
end

J=A*k+B*j;
vel([p q],:)=vel([p q],:)+[J(1:2);-J(1:2)];

angj=cross(k,J)*2/size;
ang([p q])=ang([p q])+angj(:,3);
end

% function v=cross(X,Y)
% v=X(1)*Y(2)-X(2)*Y(1);
% end