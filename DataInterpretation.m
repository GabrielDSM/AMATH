% Gabriel Menescal
% HW4
% Exercise 1

load salmon_data.csv;
t = (1:length(salmon_data));

% (a)
Q = zeros(2,2);
Q(1,1) = sum(t.^2);
Q(1,2) = sum(t);
Q(2,1) = sum(t);
Q(2,2) = 77;

R = zeros(2,1);
R(1,1) = sum(t*salmon_data);
R(2,1) = sum(salmon_data);

P = Q\R;

save('A1.dat', 'Q', '-ascii');
save('A2.dat', 'R', '-ascii');
save('A3.dat', 'P', '-ascii');

% (b)
A4 = polyfit(t,salmon_data.',2);
A5 = polyfit(t,salmon_data.',5);
A6 = polyfit(t,salmon_data.',8);

save('A4.dat', 'A4', '-ascii');
save('A5.dat', 'A5', '-ascii');
save('A6.dat', 'A6', '-ascii');

% (c)
extrapolation_2 = polyval(A4,78);
extrapolation_5 = polyval(A5,78);
extrapolation_8 = polyval(A6,78);

A7 = [extrapolation_2;extrapolation_5;extrapolation_8];
save('A7.dat', 'A7', '-ascii');

% (d)
coarse_salmon = salmon_data(1:4:length(salmon_data));
coarse_time = 1:4:77;
save('A8.dat', 'coarse_salmon', '-ascii');

% (e)
A9 = interp1(coarse_time,coarse_salmon,t,'nearest').';
A10 = interp1(coarse_time,coarse_salmon,t,'linear').';
A11 = interp1(coarse_time,coarse_salmon,t,'cubic').';
A12 = interp1(coarse_time,coarse_salmon,t,'spline').';

save('A9.dat', 'A9', '-ascii');
save('A10.dat', 'A10', '-ascii');
save('A11.dat', 'A11', '-ascii');
save('A12.dat', 'A12', '-ascii');

% (f)
RMS = zeros(4,1);
RMS(1,1) = sqrt((1/77)*sum((salmon_data - A9).^2));
RMS(2,1) = sqrt((1/77)*sum((salmon_data - A10).^2));
RMS(3,1) = sqrt((1/77)*sum((salmon_data - A11).^2));
RMS(4,1) = sqrt((1/77)*sum((salmon_data - A12).^2));

save('A13.dat', 'RMS', '-ascii');