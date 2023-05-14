
%% Question 1 (Linear Algebra)

for i=1:5
fprintf('\nQ1V%d \n',i);
clear all

x = randi([-10 10],3,3);
a = randi([-7 -3]);
b = randi([1 5]);
y = x(:,3);
x(:,3) = a * x(:,1)+b*x(:,2);
k1 = x(:,1);
k2 = x(:,2);
p = dotproduct(k1,k2);
k2 = k2 - (p/squarelength(k1))*k1;
k1 = k1/sqrt(squarelength(k1));
k2 = k2/sqrt(squarelength(k2));
answer = dotproduct(y,k1)*k1+dotproduct(y,k2)*k2;
optiona = (answer+y)/2;
optionc = y;
optiond = dotproduct(y,k1)*k2+dotproduct(y,k2)*k1;

disp('Question: A vector v is called a least squares solution of the linear system Ax = B, where A is a 3x3 matrix and B is a 3x1 vector, if and only if')
disp('the distance of B from Av is the least, i.e., ||Av-B||<=||Az-B|| for all z ∈ R3x1. Find out the value of Av such that v is a least squares solution. ');
disp(' A ='); disp(x);disp(' B =');disp(y);
disp('(a)');disp(optiona);
disp('(b)');disp(answer);
disp('(c)');disp(optionc);
disp('(d)');disp(optiond);
disp('correct answer is: option b'),disp(answer)

end

fprintf('\nSOLUTION Q1:\nWe know that from matrix multiplication, Av is a linear combination of the columns of A. That means the vector Av is in\n'); 
fprintf('the subspace spanned by the column vectors of A. We also know that the projection of a vector onto a subspace will be the vector in the\n'); 
fprintf('subspace, which is at the least distance from the vector. Therefore, we need to find the projection of B on the subspace spanned by the column vectors of A.\n');
fprintf('So, first we need to use the Gram-Schmidt orthogonalization and find an orthonormal basis for the subspace, and then we can project\n');
fprintf('the vector B onto them, which will be our desired vector Av.\n');

function x = dotproduct(k1,k2)
x = k1(1)*k2(1)+k1(2)*k2(2)+k1(3)*k2(3);
end
function t = squarelength(x)
 t = x(1)^2 + x(2)^2 + x(3)^2;
end
