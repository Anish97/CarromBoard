function collisionvelocities
global pos vel vel2 width height size color1 color2 pos2 cres cfric theta1 theta2 ang1 ang2
theta=atan((pos2(2)-pos(2))/(pos2(1)-pos(1)));
sint=sin(theta);
cost=cos(theta);
% vel2(1)=vel2(1) - vel2(2)*sint*cost + (vel(1)
B=[vel(2)*cost-vel(1)*sint; vel2(2)*cost-vel2(1)*sint; (vel(1)*cost+vel(2)*sint)*(1+cres)/2+(vel2(1)*cost+vel2(2)*sint)*(1-cres)/2; (vel(1)*cost+vel(2)*sint)*(1-cres)/2+(vel2(1)*cost+vel2(2)*sint)*(1+cres)/2];
% disp(B)
A=[-sint cost 0 0;0 0 -sint cost;0 0 cost sint;cost sint 0 0];
pCell = num2cell(inv(A)*B);
[vel(1) vel(2) vel2(1) vel2(2)] = pCell{:};
%[vel(1) vel(2) vel2(1) vel2(2)]=matsplit(B'*inv(A'),1)

end