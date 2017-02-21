clear all; close all;

%Initiates all the variables necessary for exercise one
A = [-1 3;2 1];
B = [5 -4;1 -3];
C = [1 1 6;1 -9 -4];
D = [1 -4;1 -3;-2 3];
x = [2;0];
y = [0;-1];
z = [-2;4;1];

%Performs the first 10 calculations of exercise one and saves each to a
%.dat file
%(a)
A1 = A - B;
save('A1.dat', 'A1', '-ascii');

%(b)
A2 = 4*x - 2*y;
save('A2.dat', 'A2', '-ascii');

%(c)
A3 = A*y;
save('A3.dat', 'A3', '-ascii');

%(d)
A4 = A * (y + x);
save('A4.dat', 'A4', '-ascii');

%(e)
A5 = D*x;
save('A5.dat', 'A5', '-ascii');

%(f)
A6 = D*y + z;
save('A6.dat', 'A6', '-ascii');

%(g)
A7 = A*B;
save('A7.dat', 'A7', '-ascii');

%(h)
A8 = B*A;
save('A8.dat', 'A8', '-ascii');

%(i)
A9 = A*C;
save('A9.dat', 'A9', '-ascii');

%(j)
A10 = C*D;
save('A10.dat', 'A10', '-ascii');

%The answers to (g) and (h) are different because in matrix multiplicatiothe order matters. By 
%reversing the order you are changing which components are being multiplied to one another.

%(k)
A11 = C(:,2);
save('A11.dat', 'A11', '-ascii');

%(l)
A12 = D(2:3,:);
save('A12.dat', 'A12', '-ascii');

%(m)
A13 = C(2,1:2);
save('A13.dat', 'A13', '-ascii');

%Exercise 2
sum = 0;
x1 = 2000;
x2 = 2000;
x3 = 2000;
x4 = 2000;
for i = 1:20000
    sum = sum + 0.1;
end
x1 = x1 - sum;

sum = 0;
for i = 1:16000
    sum = sum + 0.125;
end
x2 = x2 - sum;

sum = 0;
for i = 1:10000
    sum = sum + 0.2;
end
x3 = x3 - sum;

sum = 0;
for i = 1:8000
    sum = sum + 0.25;
end
x4 = x4 - sum;

A14 = [x1;x2;x3;x4];
save('A14.dat', 'A14', '-ascii');

%Not certain as to how the numbers are stored differently such that it causes a difference between
%x1, x2, x3, & x4.
