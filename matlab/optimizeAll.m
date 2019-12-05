function [x,cost] = optimizeAll(filename)
staffTable = readtable(filename)
requirements = xlsread(filename, 2);
[f,A,b,staffNumberVector] = makeMILPMatrices(staffTable,requirements);
nVars=numel(f);
lb = zeros(nVars,1);
ub = ones(nVars,1);
[x,cost] = intlinprog(f,1:nVars,A,b,[],[],lb,ub);