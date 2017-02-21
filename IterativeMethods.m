%Exercise 1
AD = zeros(50,1);
for i = 1:50
    AD(i) = 2;
end
AD = diag(AD);

AU = zeros(49,1);
AL = zeros(49,1);
for i = 1:49
    AU(i) = -1;
    AL(i) = -1;
end
AU = diag(AU,1);
AL = diag(AL,-1);

A = AD + AL + AU;

% (a)
j = 1:50; j = j.';

rho = 2*(1 - cos(23*pi/51))*sin(23*pi*j/51);

M = -(AD\(AL+AU));
%Also: M = A-AD; -> M = M/2; Because diagonal is all 2s

c = AD\rho;
%Also c = rho/2 as diagonal is all 2s
A1 = [M c];
save('A1.dat', 'A1', '-ascii');

% (b)
tol = 1.e-4;
k = 1;
error = tol*2; %ensures while loop begins
phi = ones(50,1);
while error >= tol
    phi(:,k+1) = M*phi(:, k) + c;
    error = norm(phi(:,k+1) - phi(:,k), Inf);
    k = k + 1;
end

A2 = phi(:,end);
save('A2.dat', 'A2', '-ascii');
A3 = k - 1;
save('A3.dat', 'A3', '-ascii');

% (c)
L = tril(A);
U = A - L;  %U = upper triangular
M = -L\U;
c = L\rho;
A4 = [M c];
save('A4.dat', 'A4', '-ascii');

% (d)
phi2 = ones(50,1);
error = tol*2;
j = 1;
while error >= tol
    phi2(:,j+1) = M*phi2(:,j) + c;
    error = norm(phi2(:,j+1) - phi2(:,j),Inf);
    j = j + 1;
end
A5 = phi2(:,end);
save('A5.dat', 'A5', '-ascii');

A6 = j - 1;
save('A6.dat', 'A6', '-ascii');



% Exercise 2 

% (a)
omega = 1.5;
new_M = -1 * inv(AD + (omega*AL)) * ((omega*AU) + (omega-1)*AD);
new_c = inv(AD + (omega * AL)) * omega * rho;

A7 = [new_M, new_c];
save('A7.dat', 'A7', '-ascii');

% (b)

eigen = zeros(50,100);
l = 1;
for w = 1:0.01:1.99
    B = (AD+(w*AL))\(-((w*AU)+(w*AD)-AD)); 
    eigen(:,l) = eig(B);
    l = l + 1;
end
eigen = abs(eigen);
eigen = eigen.';
A8 = eigen;
save('A8.dat', 'A8', '-ascii');

max_values = zeros(100,1);
for i = 1:100
   max_values(i) = max(eigen(i,:));
end
A9 = [1.89;min(max_values)];
save('A9.dat', 'A9', '-ascii');
%DON'T CHANGE ANYTHING ABOVE THIS%

% (c)
residual = ones(100,1);
counter = 1;
result = [];
for w = 1:0.01:1.99
    phi200 = ones(50,1);
    c = inv(AD + (w * AL)) * w * rho;
    M = -1 * inv(AD + (w*AL)) * ((w*AU) + (w-1)*AD);
    for iter = 1:200
        %phi200(:,iter+1) = (AD+(w*AL))\(-(w*AU + (w-1)*AD))*phi(:,iter)+((AD+w*L)\(w*rho));
        phi200 = M*phi200 + c;
    end
    residual = (A*phi200(:,end))-rho;
    norm_res = norm(residual);
    result = [result;norm_res];
    counter = counter + 1;
end
A10 = result;
save('A10.dat', 'A10', '-ascii');

% (d)
iterations = 1;
error = 2*tol;
phi = ones(50,1);

c = inv(AD + (1.89 * AL)) * 1.89 * rho;
M = -1 * inv(AD + (1.89*AL)) * ((1.89*AU) + (1.89-1)*AD);

phi = ones(50,1);
while error >= tol
    phi(:,iterations + 1) = M*phi(:,iterations) + c;
    error = norm(phi(:,iterations+1) - phi(:,iterations), Inf);
    iterations = iterations + 1;
end

A11 = phi(:,end);
save('A11.dat', 'A11', '-ascii');


A12 = iterations -1;
save('A12.dat', 'A12', '-ascii');