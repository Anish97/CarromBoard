function collisionvelocities
global pos vel vel2 width height size color1 color2 pos2 cres cfric theta1 theta2 ang1 ang2 beta
% theta=atan((pos2(2)-pos(2))/(pos2(1)-pos(1)));
% sint=sin(theta);
% cost=cos(theta);

% B=[vel(2)*cost-vel(1)*sint; vel2(2)*cost-vel2(1)*sint; (vel(1)*cost+vel(2)*sint)*(1+cres)/2+(vel2(1)*cost+vel2(2)*sint)*(1-cres)/2; (vel(1)*cost+vel(2)*sint)*(1-cres)/2+(vel2(1)*cost+vel2(2)*sint)*(1+cres)/2];
% A=[-sint cost 0 0;0 0 -sint cost;0 0 cost sint;cost sint 0 0];
% pCell = num2cell(inv(A)*B);
% [vel(1) vel(2) vel2(1) vel2(2)] = pCell{:};
velv=[vel 0];
vel2v=[vel2 0];
k=pos2-pos;
k=[k/norm(k) 0];
ang1v=[0 0 ang1];
ang2v=[0 0 ang2];
g=velv-vel2v;
s=0.5*(ang1v+ang2v);
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
B

J=A*k+B*j;

vel=vel+J(1:2);
vel2=vel2-J(1:2);

angv=cross(k,J)*2/size;
ang1=ang1+angv(3);
ang2=ang2+angv(3);
end

% function v=cross(X,Y)
% v=X(1)*Y(2)-X(2)*Y(1);
% end