% Gabriel Menescal
% HW5
% Exercise 1

% (a)
% f(TH,R) = abs(sqrt(2)/(81*sqrt(pi)) * (6R - R.^2) * e.^(-R/3) *
% cos(TH)).^2

[TH, R] = meshgrid(0:0.05*pi:2*pi,0:0.5:20);
F = (sqrt(2)/(81.*sqrt(pi)) .* (6.*R - R.^2) .* exp(-R/3) .* cos(TH)).^2;
[X,Y] = pol2cart(TH,R);
surf(X,Y,F); %remember to comment out when done.
save('A1.dat', 'X', '-ascii');
save('A2.dat', 'Y', '-ascii');
save('A3.dat', 'F', '-ascii');

% (b)
A4 = fminsearch('ProbDens',[0,1]);
A5 = fminsearch('ProbDens',[0,10]);
A6 = fminsearch('ProbDens',[pi,1]);
A7 = fminsearch('ProbDens',[pi,10]);

save('A4.dat', 'A4', '-ascii');
save('A5.dat', 'A5', '-ascii');
save('A6.dat', 'A6', '-ascii');
save('A7.dat', 'A7', '-ascii');

% (c)
A8 = newton_method(@(v) G(v),@(v) DG(v),[0;1],1e-4);
A9 = newton_method(@(v) G(v),@(v) DG(v),[0;10],1e-4);
A10 = newton_method(@(v) G(v),@(v) DG(v),[pi;1],1e-4);
A11 = newton_method(@(v) G(v),@(v) DG(v),[pi;10],1e-4);

save('A8.dat', 'A8', '-ascii');
save('A9.dat', 'A9', '-ascii');
save('A10.dat', 'A10', '-ascii');
save('A11.dat', 'A11', '-ascii');

% Exercise 2
% (a)
f = zeros(3,1);
f(1) = 40 - ((0.1*32)+(0.22*45)+(0.15*30));
f(2) = 50 - ((0.23*32)+(0.25*45)+(0.17*30));
f(3) = 75 - ((0.31*32)+(0.38*45)+(0.27*30));
save('A12.dat', 'f', '-ascii');

% (b)
A = [0.1 0.23 0.31;0.22 0.25 0.38;-0.1 -0.23 -0.31;0.37 0.42 0.65;0 0 0.27;-1 0 0;0 -1 0;0 0 -1];
b = [5;7;-4;15;2;-2;-3;-1];

save('A13.dat', 'A', '-ascii');
save('A14.dat', 'b', '-ascii');

%(c)

% S = sol(1);
% M = sol(2);
% L = sol(3);
f_linprog = -f;
sol = round(linprog(f_linprog,A,b));
save('A15.dat', 'sol', '-ascii');

