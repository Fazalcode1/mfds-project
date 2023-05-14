%% Question 4 (Optimization)
%Initialisation
clearvars;
format compact;

for i=1:5
 %Title
fprintf('\nQ4V%d \n',i);

%Creating random length and constants 
L = randi([50 500]);
a = randi([1 20]);
b = randi([1 20]);

%Creating options
optiona = L;
optionb = ((L-b)/(3*a));
optionc = (L/4)-(b/(2*a));
answer = (L/3)-((2*b)/(3*a));

%Printing the question and options
fprintf('Question: There is a village with a national highway close to it. The total profit per unit area of square farmland in the village is\n');
fprintf('equal to (%dy+%d), where y is the closest distance of the farmland from the highway. Let the total length available be %d.\n',a,b,L);
fprintf('What is the maximum profit from square farmland in the village? (All the measurements are in metres.)\n');
% disp('where the point (x1,y1,z1,w1) is the point of minima of function following the equality constraints which are h1,h2 and h3.');
disp('(a)');disp(optiona);
disp('(b)');disp(optionb);
disp('(c)');disp(optionc);
disp('(d)');disp(answer);

%Printing the answer 
fprintf('\ncorrect answer = option (d)\n'),disp(answer);
end

%Solution explanation
fprintf('\nSolution Q4: We can get the maximum profit equation by taking a side length (L-y). Differentiating the equation and making it to zero\n');
fprintf('will give the answer. The answer will be (L/3)-((2*b)/(3*a)).');
