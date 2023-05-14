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
