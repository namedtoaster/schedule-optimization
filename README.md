# schedule-optimization
 To run the program, first make sure the directory where the matlab files are saved are added to PATH:
 - addpath 'path to matlab files'
 
 Next, assign the location of the 'scheduling.xlsx' file to the variable filename
 - filename = 'file location of scheduling.xlsx'
 
 Finally, run these commands
 
studTable = readtable(filename, 'Sheet', 'Students');<br />
rewardTable = readtable(filename, 'Sheet', 'Reward');<br />
requirements = xlsread(filename, 3);<br />
[f,A,b,Aeq,beq,staffNumberVector] = makeMILPMatricesStuds(studTable,rewardTable,requirements);<br />
nVars=numel(f);<br />
lb = zeros(nVars,1);<br />
ub = ones(nVars,1);<br />
[x,cost] = intlinprog(-f,1:nVars,A,b,Aeq,beq,lb,ub);<br />
gatherDisplayStuds;<br />

For any questions please contact [Dave Campbell](mailto:d0camp03@louisville.edu) or [Thomas Constantino](mailto:thomas.constantino@louisville.edu)
