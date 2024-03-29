% number of rows
numStud = size(staffTable,1); % Total number of staff available

% Convert from indices in x to employee and shift information
% Find the rows where there is a non-zero value
selected = find(x);
% hoursMatrix is the schedule
% matrix with rows that equal numStud and 5 columns
hoursMatrix = zeros(numStud,5); % second parameter is # of rides for this line

% 1 to number of elements in the selected matrix
for n = 1:numel(selected);
    % thisEntry is the index of the selected shift option that satisfies the
    % optimization
    thisEntry =selected(n);
    % thisStaff picks which employee number the shift option applies to
    thisStaff = staffNumberVector(thisEntry);
    % Rows 1 throughh 5 of the thisEntry'th column from the negated A
    % matrix
    hoursOnDuty = -A(1:5,thisEntry);
    hoursMatrix(thisStaff,:) = hoursOnDuty;
end

% Make a figure in a suitable location
hf = figure('visible','off','units','pixel','position',[100 100 560 700]);
movegui(hf,'center');
set(hf,'visible','on');

% Draw the employee work schedule matrix
subplot(211);
imagesc(0.5:4.5,1:7,hoursMatrix) % 4.5 = 1/2 less than number of "rides"; 7 is # of IPs
set(gca,'xtick',0:5); % second parameter is # of rides for this line
set(gca,'ytick',1:numStud,'yticklabel',staffTable.EmployeeName);
axis tight;
set(gca,'xlimmode','manual','ylimmode','manual','layer','bottom');
hold all;
ylabel('Employee Name','FontSize',12);

% Let's make the grid lines manually...
for n = 0.5:numStud+0.5
    plot(xlim,[n n],'k');
end
for n = 0:5  % second parameter is # of rides for this line
    plot([n n], ylim,'k');
end

title(['Employee shift schedule' 10 ...
       'Total wages over 24 hours: $' num2str(cost)],'FontSize',16);
colormap([1 1 1; 0 0.5 1]);

% Draw the required vs. actual staff
subplot(212);
plot(0.5:4.5,requirements(2,:),'b.-','linewidth',3,'markersize',30);
actualHours = -A(1:5,:)*x; % second parameter is # of rides for this line
hold on;
plot(0.5:4.5,actualHours,'r:.','linewidth',2,'markersize',16);
xlim([0 5]); % second parameter is # of rides for this line
set(gca,'xtick',0:5,'ytick',0:10); % second parameter is # of rides for this line
ylim([0 10]);
grid on;
title(['Hourly Staff Count'],'FontSize',16);
legend({'Employees Required', 'Employees Scheduled'});
xlabel('Time of day','fontsize',12);
ylabel('Employee count','fontsize',12);