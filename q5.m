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
