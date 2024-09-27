% Ethan Edwards
% Your Lab Partner(s) Name: Brian Long
% Your Lab Partner(s) UnityID:  balong
% 9 Sep 2024
% Lab Section #209
% Lab D
clear; clc; close all;

%% TA Guided
clc; clear; close all
%create a 10x10 matrix w/ rand int from 0 to 100
mat = randi([0,100],10,10);

%find mean of mat with mean function
meanFunction = mean(mean(mat));

%find the mean with a for loop

[rows,columns] = size(mat);

%define a sum and count
sum = 0;
count = 0;

for row = 1:rows %goes through every row im mat
    for column = 1:columns %goes through every column in mat
        sum = sum + mat(row,column); %update sum
        count = count+1; %how many numbers we've added up so far
    end
end

%calculate average
meanFor = sum/count;

%find the mean of mat with a while loop

%define row2
row2 = 1;
column2 = 1;

sum2=0;
count2=0;
while row2 <= rows
    column2 = 1;
    while column2 <= columns
           sum2 = sum2 + mat(row2,column2); %update sum
        count2 = count2+1; %how many numbers we've added up so far
        column2 = column2+1; %update count
    end
   row2 = row2+1; %update row counter
end

meanWhile = sum2/count2;
%% Problem 2: Nested Loops to Print a Pattern
clc; clear; close all
rows = 4; % Number of lines
for i = 1:rows
    % Print underscores
    for j = 1:rows - i
        fprintf('_');%underscores
    end
    % Print asterisks
    for k = 1:i
        fprintf('*');%asterisks
    end
    fprintf('\n'); % New line
end
%% Problem 3: Random Integer Loop Until Square Root Condition
clc; clear; close all
count = 0;
conditionMet = false;

while conditionMet==0
    num1 = randi([1, 16]); % Generate random number between 1 and 16
    num2 = randi([1, 16]); % Generate random number between 1 and 16
    count = count + 1; % Increment count (round number)
    
    % Display round number, num1, and num2 for each iteration
    fprintf('Round %d: num1 = %d, num2 = %d\n', count, num1, num2);
    
    % Check if one number is the square root of the other
    if num1 == sqrt(num2) || num2 == sqrt(num1)
        conditionMet = true;
    end
end

fprintf('It took %d iterations to find two numbers where one is the square root of the other.\n', count);

%% Problem 4: Efficiency with For Loops and Vectorization
clc; clear; close all
mat = magic(5000); % Create a 5000x5000 magic square matrix

% Double-check size
[r, c] = size(mat);

% Using for loops to count even numbers
tic; %start clock
count = 0; %reset count
for i = 1:r
    for j = 1:c
        if rem(mat(i,j), 2) == 0%check for even numbers
            count = count + 1; %update count
        end
    end
end
time1 = toc;

% vetorized to count even numbers
tic;%start timer
evenNumbers = sum(rem(mat(:), 2) == 0); % Flatten the matrix into a vector using mat(:)
time2 = toc; %stop timer

% Time Comparison
% time1 = 0.721017(loop)
% time2 = 0.135879
% Vectorized code is much faster than loops because matlab is optimized for
% for linear operations. for large datasets, vectorization significantly
% improves performance. Time 2 is around 7x faster on my computer 

