disp('Program Complete...yessss')
%% vector
vect = [1,2,3,4,5];
disp('vector =')
disp(vect);
%% matrix
matrix =[3,4,6;6,7,8;3,4,5];
disp('matrix =')
disp(matrix);

%%Sine wave ..problem 11
x = 0:pi/100:2*pi;
y = sin(x);
plot(x,y)

%% 3D plot
[X,Y] = meshgrid(1:0.5:10,1:20);
Z = sin(X) + cos(Y);
surf(X,Y,Z)

%% zeros vector
z= zeros(5,1);
disp('zeros vector =')
disp(z);
%matrix
zz= zeros(5);
disp('zeros matrix =')
disp(zz);
%% random matrix
r=rand(1,5);
disp('random matrix =')
disp(r);

%% complex_____incomplete
acomp = uint8([1;2;3;4]);
bcomp = uint8([2;2;7;7]);
comp = complex(acomp,bcomp);
disp('complex vector =')
disp(comp);
