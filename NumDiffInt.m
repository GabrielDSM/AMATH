% Gabriel Menescal
% HW6
% Exercise 1

N = [ 7.24; 9.64; 12.87; 17.07; 23.19; 31.44; 38.56; 50.19; 62.98; ...
      76.21; 92.23; 106.02; 123.20; 132.16; 151.33; 179.32; 203.30; ...
      226.54; 248.71; 281.42; 307.75];
t = 1810:10:2010;

n = length(N);

dNdt = zeros(n,1);

% Changed to generalized
dNdt(1) = (-N(3)+4*N(2)-3*N(1))/(t(2)-t(1)+t(3)-t(2));  % forward diff at f(x_1)
for i=2:n-1
    dNdt(i)  = (N(i+1)-N(i-1))/(t(i+1)-t(i-1)); % central in between
end
dNdt(n) = (N(n-2)-4*N(n-1)+3*N(n))/(t(n)-t(n-1)+t(n-1)-t(n-2));  % backward diff at f(x_n)

save('A1.dat', 'dNdt', '-ascii');

%Exercise 2
r = [0.308; 0.325; 0.342; 0.359; 0.376; 0.393; 0.410
     0.427; 0.444; 0.461; 0.478]; %Feet
T = [640; 794; 885; 943; 1034; 1064; 1114; 1152 
     1204; 1222; 1239]; %Fahrenheit

 
r_l = 0.308;
r_0 = 0.478;
theta_p = 0.7051;

% (a)
num = r.*T*theta_p;
denom = r*theta_p;
top = 0;
h = (r_0-r_l)/10;
for i = 1:floor(length(T)/2)
    top = (top + r(2*i - 1)*T(2*i - 1) + 4*r(2*i)*T(2*i) + r(2*i + 1)*T(2*i + 1));
end
bottom = 0;
for i = 1:floor(length(T)/2)
    bottom = (bottom + r(2*i - 1) + 4*r(2*i) + r(2*i + 1));
end
numerator = top*theta_p*(h/3);
denominator = bottom*theta_p*(h/3);
T_avg = numerator / denominator;


save('A2.dat', 'numerator', '-ascii');
save('A3.dat', 'denominator', '-ascii');
save('A4.dat', 'T_avg', '-ascii');

% (b)
table = [r T];
x = 1:11;
A5 = trapz(table(x,1),table(x,1).*table(x,2).*theta_p);
A6 = trapz(r,denom);
A7 = A5/A6;

save('A5.dat', 'A5', '-ascii');
save('A6.dat', 'A6', '-ascii');
save('A7.dat', 'A7', '-ascii');
