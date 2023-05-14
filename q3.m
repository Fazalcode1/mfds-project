%% Question 3 (Optimization)
%Initialisation
clearvars;
format compact;

for i=1:5
 %Title
fprintf('\nQ3V%d \n',i);

%Creating random matrix for specifying constraint vectors
x = randi([-10 10],5,5);
a = x(:,1);
b = x(:,2);
c = x(:,3);
d = x(:,4);
e = x(:,5);
gradh1 =[a(1);b(1);c(1);d(1)];
gradh2 = [a(2);b(2);c(2);d(2)];
gradh3 = [a(3);b(3);c(3);d(3)];

%Creating random vectors for making linear combinations using those values 
p = randi([-10,10],3);
q = randi([-10,10],3);
r = randi([-10,10],3);

%Creating options
optiona = (p(1)*gradh1) + (q(1)*gradh2) + (r(1)*gradh3);
optionb = (p(2)*gradh1) + (q(2)*gradh2) + (r(2)*gradh3);
optionc = (p(3)*gradh1) + (q(3)*gradh2) + (r(3)*gradh3);
answer = [a(4);b(4);c(4);d(4)];

%Printing the question and options
disp('Which of the following options cannot be a possible gradient of the unknown function f(x, y, z, w) at the point (x1, y1, z1, w1),')
disp('where the point (x1,y1,z1,w1) is the point of minima of function following the equality constraints which are h1,h2 and h3.')
fprintf('h1: %dx+%dy+%dz+%dw=%d\n',a(1),b(1),c(1),d(1),e(1));
fprintf('h2: %dx+%dy+%dz+%dw=%d\n',a(2),b(2),c(2),d(2),e(2));
fprintf('h3: %dx+%dy+%dz+%dw=%d\n',a(3),b(3),c(3),d(3),e(3));
disp('(a)');disp(optiona);
disp('(b)');disp(optionb);
disp('(c)');disp(optionc);
disp('(d)');disp(answer);

%Printing the answer 
disp('correct answer = option (d)'),disp(answer);
end
