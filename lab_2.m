%---THINK BEFORE YOU PROGRAM ...TO KNOW WHAT COMPUTER WILL GIVE YOU
disp('success problem 1');
%--Problem_1
%--x(n)=3d(n+2)+2d(n)-d(n-3)+5d(n-7); d=delta
nr=-5:15;
x= 3*delfcn(-2,nr)+2*delfcn(0,nr)- delfcn(3,nr)+ 5*delfcn(7,nr);
figure stem(x,nr);
grid;