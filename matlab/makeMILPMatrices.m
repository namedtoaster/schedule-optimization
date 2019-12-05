function [f,A,b,staffNumberVector] = makeMILPMatrices(staffTable,requirements)
% Convert the staff information and requirements into the necessary
% matrices for input to INTLINPROG

% _Copyright 2015 The MathWorks, Inc._

numStaff = size(staffTable,1); % Total number of staff available

% Initialize various variables
totalHourMatrix = [];
staffNumberVector = [];
staffNumberEntryCount = [];
f = []; % Cost vector for linear programming

for n = 1:numStaff % For each staff...
    minHours = staffTable.MinHours(n);
    maxHours = staffTable.MaxHours(n);
    hourMatrix = [];
    
    for hours = minHours:maxHours % ...generate all possible work hours
        % the second parameter of zeros() needs to be changeable depending
        % on the number of rides on a line
        hourVector = zeros(1,5);
        hourVector(1:hours) = 1;
        
        % GALLERY is a quick way to make a circulant matrix
        % If an employee starts a shift late at night,
        % the hours will "loop back over" into the morning.
        newHourMatrix = (gallery('circul',hourVector)');
        hourMatrix = [hourMatrix newHourMatrix];
    end
    
    % If needed, filter out the entries that are out of availability
    availableTimes = staffTable.Availability(n);
    if iscell(availableTimes)
        availableTimes = availableTimes{1};
    end
    if ~isnan(availableTimes)
        available = false(24,1);
        % Convert from text (ex: "6-12")...
        availableTimes = regexp(availableTimes,'\d+-\d+','match');
        for k = 1:numel(availableTimes)
            % ...to MATLAB numerical values (ex: [6 12])
            startStopTimes = sscanf(availableTimes{k},'%d-%d');  
            available(startStopTimes(1)+1:startStopTimes(2)) = true;
        end
        hourMatrix = hourMatrix(:,~any(bsxfun(@and,~available,hourMatrix)));
    end
    
    totalHourMatrix = [totalHourMatrix hourMatrix];
    
    % Keep track of which columns are for which employee
    staffNumberEntryCount(n) = size(hourMatrix,2);
    staffNumberVector = [staffNumberVector repmat(n,1,staffNumberEntryCount(n))];
    
    % Wages are total hours worked * hourly wage
    f = [f sum(hourMatrix)*staffTable.HourlyWage(n)];
end

% Constraint: The total hours must be >= the minimum required
A_hours = totalHourMatrix;
b_hours = requirements(2,:)';


% Constraint: You can only go to work once a day
% In our case, we don't count hours, we go by time slots. For now at least
%A_oneTime = arrayfun(@(n)ones(1,n), staffNumberEntryCount,'Uniform',false);
%A_oneTime = blkdiag(A_oneTime{:});
%b_oneTime = ones(numStaff,1);

%% 3. Combine both of the constraints into one A and b matrix
% We apply a (-) to the Hours constraint because Ax >= b means -Ax <= -b
A = [-A_hours];%; A_oneTime];
b = [-b_hours];%; b_oneTime];