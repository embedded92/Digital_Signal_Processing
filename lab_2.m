%---THINK BEFORE YOU PROGRAM ...TO KNOW WHAT COMPUTER WILL GIVE YOU
disp('success problem 1');
%--Problem_1
%--x(n)=3d(n+2)+2d(n)-d(n-3)+5d(n-7); d=delta
nr=-5:15;
x= 3*delfcn(-2,nr)+2*delfcn(0,nr)- delfcn(3,nr)+ 5*delfcn(7,nr);
figure stem(x,nr);
grid;

%% Periodic Signal 

n1=[-12:12];
x1=[-2 -1 0 1 2];
x=x1'*ones(1,5);
x=(x(:))';
stem(n1,x);
title('Periodic Signal with 5 periods');
xlabel('Discrete Time (n) \rightarrow');
ylabel('Amplitude \rightarrow');

%% Delta Function Signal Operation
%Range of n
n1=-5:15;
yd=3*delta(n1+2)+2*delta(n1)-delta(n1-3)+5*delta(n1-7);
% Plot the desired function
figure
stem(n1,yd);
title('Plot for 3\delta(n+2)+2\delta(n)-\delta(n-3)+5\delta(n-7)');
xlabel('Discrete Time (n) \rightarrow');
ylabel('Amplitude \rightarrow');
grid on;
