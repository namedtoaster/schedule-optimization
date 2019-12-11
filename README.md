# schedule-optimization
 To run the program, first make sure the directory where the matlab files are saved are added to PATH:
 - addpath 'path to matlab files'
 
 Next, assign the location of the 'scheduling.xlsx' file to the variable filename
 - filename = 'file location of scheduling.xlsx'
 
 Finally, run these commands
 
studTable = readtable(filename, 'Sheet', 'Students');
rewardTable = readtable(filename, 'Sheet', 'Reward');
requirements = xlsread(filename, 3);
[f,A,b,Aeq,beq,staffNumberVector] = makeMILPMatricesStuds(studTable,rewardTable,requirements);
nVars=numel(f);
lb = zeros(nVars,1);
ub = ones(nVars,1);
[x,cost] = intlinprog(-f,1:nVars,A,b,Aeq,beq,lb,ub);
gatherDisplayStuds;
