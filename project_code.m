%Note that the functions for each question have been added in the end after all the major codes so as the code would run without any error  
%% Question 1 (Linear Algebra)
%Initialisation
clear vars;
format compact;

for i=1:5
%Title
fprintf('\nQ1V%d \n',i);

%Randomising matrix and vector
x = randi([-10 10],3,3);
a = randi([-7 -3]);
b = randi([1 5]);
y = x(:,3);
x(:,3) = a * x(:,1)+b*x(:,2);

%Calculations
k1 = x(:,1);
k2 = x(:,2);
p = dotproduct(k1,k2);
k2 = k2 - (p/squarelength(k1))*k1;
k1 = k1/sqrt(squarelength(k1));
k2 = k2/sqrt(squarelength(k2));

%Creating options
answer = dotproduct(y,k1)*k1+dotproduct(y,k2)*k2;
optiona = (answer+y)/2;
optionc = y;
optiond = dotproduct(y,k1)*k2+dotproduct(y,k2)*k1;

%Printing the question and options
disp('Question: A vector v is called a least squares solution of the linear system Ax = B, where A is a 3x3 matrix and B is a 3x1 vector, if and only if')
disp('the distance of B from Av is the least, i.e., ||Av-B||<=||Az-B|| for all z ∈ R3x1. Find out the value of Av such that v is a least squares solution. ');
disp(' A ='); disp(x);disp(' B =');disp(y);
disp('(a)');disp(optiona);
disp('(b)');disp(answer);
disp('(c)');disp(optionc);
disp('(d)');disp(optiond);

%Printing correct answer
disp('correct answer is: option b'),disp(answer)
end

%Solution explanation
fprintf('\nSOLUTION Q1:\nWe know that from matrix multiplication, Av is a linear combination of the columns of A. That means the vector Av is in\n'); 
fprintf('the subspace spanned by the column vectors of A. We also know that the projection of a vector onto a subspace will be the vector in the\n'); 
fprintf('subspace, which is at the least distance from the vector. Therefore, we need to find the projection of B on the subspace spanned by the column vectors of A.\n');
fprintf('So, first we need to use the Gram-Schmidt orthogonalization and find an orthonormal basis for the subspace, and then we can project\n');
fprintf('the vector B onto them, which will be our desired vector Av.\n');



%Code 1 ends

%% Question 2 (Linear Algebra)
%Initialisation
clearvars;
format compact;

for i=1:5
%Title
fprintf('\nQ2V%d \n',i);

%Randomising eigenvalues and sums
x = randi([-10 10]);
y=x;
while y==x
 y = randi([-10 10]);
end
k = randi([-10 10]);
p = randi([-10 10]);
q = randi([-10 10]);

%Finding the unknown elements in the matrices
[a(1),b(1),c(1)] = f(x,x,y,k,p,q);
[a(2),b(2),c(2)] = f(x,y,x,k,p,q);
[a(3),b(3),c(3)] = f(y,x,x,k,p,q);

%Calculation of matrices L and U
for i=1:3
L = [1 0 0;a(i) 1 0;b(i) c(i) 1];
if(i==1)U = [x a(i) b(i);0 x c(i);0 0 y];
else 
    if(i==2)U = [x a(i) b(i);0 y c(i);0 0 x];
    else 
        U = [y a(i) b(i);0 x c(i);0 0 x];
    end
end

%Creating options
if(i==1) optiona = L*U;
else 
    if(i==2) optiond = L*U;
    else optionc = L*U;
    end
end
end
L = [1 0 0;a(1) 1 0;b(1) c(1) 1];
U = [y a(1) b(1);0 x c(1);0 0 y];
optionb = L*U;

%Printing the question and options
  fprintf('Consider the LU-decomposotion of a 3x3 matrix A such that U has the eigen values %d,%d,%d. The sum of the elements of L is %d.\n',x,x,y,k);
  fprintf('The sum of first row, last column of U matrix are %d, %d, respectively. Also, the matrix L+U is symmetric. Then which of\n',p,q)
  fprintf('the following matrix is not a possibility of A.\n');
  disp('(a)'),disp(optiona);
  disp('(b)'),disp(optionb);
  disp('(c)'),disp(optionc);
  disp('(d)'),disp(optiond);

%Printing the answer
  disp('answer = (b)'),disp(optionb);
end

%Solution explanation
fprintf('\nSOLUTION Q2:\nWe know L and U matrices represent lower and upper triangular matrices, respectively. We also know that the eigenvalues of a\n');
fprintf('upper triangular matrix are its diagonal elements. Let the eigenvalues of U be (1, 1, 3). So, we can assume the matrices L and U as\n');
fprintf('[1 0 0;a 1 0;b c 1], [1 d e;0 1 f;0 0 3]. Given that L+U is symmetric, which implies a=d, b=e, and c=f, And after finding the unknown\n');
fprintf('elements, we can find the matrix A from L*U. Since there are three possible ways of arranging eigenvalues (1, 1, and 3) in the diagonal, we\n');
fprintf('will get three possibilities of A. The remaining option will not be a possibility of A and it will be the answer.\n');



% code 2 ends



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
gradh1 = [a(1);b(1);c(1);d(1)];
gradh2 = [a(2);b(2);c(2);d(2)];
gradh3 = [a(3);b(3);c(3);d(3)];

%Creating random vectors for making linear combinations using those values 
p = randi([-10,10],3);
q = randi([-10,10],3);
r = randi([-10,10],3);
s = randi([1,20],4);

%Creating options
optiona = (p(1)*gradh1) + (q(1)*gradh2) + (r(1)*gradh3);
optionb = (p(2)*gradh1) + (q(2)*gradh2) + (r(2)*gradh3);
optionc = (p(3)*gradh1) + (q(3)*gradh2) + (r(3)*gradh3);
answer = [s(1)*a(4);s(2)*b(4);s(3)*c(4);s(4)*d(4)];

%Printing the question and options
disp('Which of the following options cannot be a possible gradient of the unknown function f(x, y, z, w) at the point (x1, y1, z1, w1),')
disp('where the point (x1,y1,z1,w1) is the point of minima of function following the equality constraints which are h1,h2 and h3.')
fprintf('h1: %dx + %dy + %dz + %dw = %d\n',a(1),b(1),c(1),d(1),e(1));
fprintf('h2: %dx + %dy + %dz + %dw = %d\n',a(2),b(2),c(2),d(2),e(2));
fprintf('h3: %dx + %dy + %dz + %dw = %d\n',a(3),b(3),c(3),d(3),e(3));
disp('(a)');disp(optiona);
disp('(b)');disp(optionb);
disp('(c)');disp(optionc);
disp('(d)');disp(answer);

%Printing the answer 
fprintf('\ncorrect answer = option (d)\n'),disp(answer);
end

%Solution explanation
fprintf('\nSOLUTION Q3: \nFor minimising the function f(x,y,z,w), we differentiate the Langrangian function, which is\n');
fprintf('f(k)+a*h1(k)+b*h2(k)+c*h3(k) and make it equal to zero. That is, gradf+a*gradh1(k)+b*gradh2(k)+c*gradh3(k) = 0 (grad =gradient).\n');
fprintf('Therefore, the gradient of the function f is a linear combination of constraints. The option that is not a\n');
fprintf('linear combination of the constraints gradient is the answer.\n');

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


%% Question 5 (Statistics)

clearvars;
format compact;
Values = randi([10, 100], 5, 3);

for j=1:5
    fprintf('\nQ5V%d \n',j);
    Value_iteration = Values(j,:);

    %Question statement
    fprintf('Question : There are k boxes, each having m blue and n red balls. A ball is randomly chosen from the first box and transferred to the second box. Then, a ball is randomly chosen from the second box and transferred to the third box and this process is repeated until we reach the last box. What is the probability that a ball chosen randomly from the last box is red?\n ');
    fprintf('Two students have conflicting thoughts regarding the solution of this problem. Kunal thinks the answer would depend on the number of boxes whereas, Harjas thinks it would not. They carry out some experiments with different values. What would be the answer for each experiment?\n');
    fprintf('The values of m,n and k respectively are:\n')
    String_Valueitr = sprintf('%.0f,' , Value_iteration);
    String_Valueitr = String_Valueitr(1:end-1);
    disp(String_Valueitr);
    m=Value_iteration(1);
    n=Value_iteration(2);
    k=Value_iteration(3);

    % Calculates Answer in rational form
    format rat
    [num, dem] = rat(n/(m+n));
    
    %Makes 4 options
    N=[num num+1 num-1 num];
    D=[dem dem+1 dem+k dem+k-1];
        for i=1:4
            R(i)=N(i)/D(i);     
        end
    Choices=R;
    
    % Assigns random letters from a,b,c,d to the options
    Choices_Rand=Choices(randperm(4));
         for i=1:4
              fprintf('\n %c.', i-1+'a');
              disp(Choices_Rand(i));
                if Choices_Rand(i)==R(1)
                   AnsOption= char(i-1+'a');           
                   %Checks for Answer option , correct option is AnsOption
                end
         end
         fprintf('\nCorrect answer is: option %c \n', AnsOption);
    
end
fprintf('SOLUTION Q5: \nThe two conflicted students perform experiments by varying the number of blue, red balls per box and the number of boxes.\n');
fprintf('The probability of chosing a blue ball from box 1 is m/(m+n) and for red ball, it is n/(m+n).\n');
fprintf('Now,the probability of picking a red ball from box 2 is divided into two parts.\n');
fprintf('The first case A is that a blue ball is transferred from box 1 to box 2 and the other case is that a red ball is transferred from box 1 to box 2.\n');
fprintf('We find the probaility of picking a red ball from box 2 using the total probability theorem and we find out that is n/(m+n) which is same as for box 1.\n');
fprintf('Similarly, probability of picking a blue ball from box 2 is same as box 1 equal to m/(m+n).\n');
fprintf('Thus, starting from box 2, we have the same conditions as for box 1 and thus, for any box number, the probability of picking a red ball is always n/(m+n) and is independent of k.\n')
fprintf('\n')

% code 5 ends

%% Question 6 (Statistics)


clearvars;  format compact;
k= randi([5, 15], 5, 1);

for j=1:5
    fprintf('\nQ6V%d \n',j);
    sum_n=0;
    n_values = randi([5,15],1,k(j,1));

    %Finding sum of all n values to be used later
    for i=1:k(j,1)
        sum_n = sum_n+n_values(i);
    end
    Values=[k(j,1),n_values];

    %Question statement
    fprintf('Question : Skysports wants to find out the probability of Manchester United goalkeeper David De Gea saving a penalty for their TV show. To do this they put the goalkeeper under penalty situations and note down the first time he saves a penalty as n_i. This would be a geometric probabilty distribution with parameter p being the probabilty of saving the penalty. This is done k times and p is estimated using Maximum Likelihood Estimation(MLE). What is p?\n ');
    fprintf('The values of k and n are as follows: (First value is k and then there are k number of n values)\n')
    
    %Converts the value array into strings for printing
    String_Values = sprintf('%.0f,' , Values);
    String_Values = String_Values(1:end-1);
    disp(String_Values);
    
    % Calculates Answer
    p=double(k(j,1)/sum_n);

    %Makes 4 options
    options=[k(j,1)/sum_n ,k(j,1)/(sum_n+1), ((k(j,1))+1)/sum_n, ((k(j,1))^2)/(sum_n)^2];
        for i=1:4
            R(i)=double(options(i));     
        end
    Choices=R;
    %Assigns random letters from a,b,c,d for each ooption
    Choices_Rand=Choices(randperm(4));
         for i=1:4
              fprintf('\n %c.', i-1+'a');
              disp(Choices_Rand(i));
                if Choices_Rand(i)==R(1)
                   AnsOption= char(i-1+'a');            %Checks for Answer option , correct option is AnsOption
                end
         end
         fprintf('\nCorrect answer is: option %c \n', AnsOption);
    
end




fprintf('SOLUTION Q6: \nThe value of the first time the goalkeeper saves the penalty is decided by a geometric distribution with parameter p(probability of saving a penalty) and this variable is denoted by n.\n');
fprintf('We repeat this experiment a k number of times and we get different values of n for each iteration. \n');
fprintf('Now, we use Maximum Likelihood Estimation to find the value of parameter p which is the desired probabilty of saving a penalty.\n');
fprintf('In MLE we multipy the probability distribution for each iteration. This function of p is called the likelihood function.\n');
fprintf('Then we take log of the likelihood function and differentiate it with respect to p and equate it to 0 thus, finding the value of p\n');
fprintf('The final answer that we get after the above steps is summation of all values of n divided by k.\n');
fprintf('\n')

% code 6 ends


%Functions made for question 1
function x = dotproduct(k1,k2)
x = k1(1)*k2(1)+k1(2)*k2(2)+k1(3)*k2(3);
end

function t = squarelength(x)
 t = x(1)^2 + x(2)^2+x(3)^2;
end

%Functions made for question 2
%Function made for finding unknown elements
function [a,b,c] = f(x,~,z,k,p,q)
a = -q+z+k-3;
b = q-z-k+3-x+p;
c=k-3+x-p;
end
