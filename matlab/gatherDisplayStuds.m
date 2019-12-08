numStud = size(studTable,1); % Total number of staff available

% Convert from indices in x to employee and shift information
selected = find(x);
% hoursMatrix is the schedule
hoursMatrix = zeros(numStud,5); % second parameter is # of rides for this line

for n = 1:numel(selected);
    thisEntry =selected(n);
    thisStaff = staffNumberVector(thisEntry);
    hoursOnDuty = -Aeq(1:5,thisEntry);
    hoursMatrix(thisStaff,:) = hoursOnDuty;
end

% Make a figure in a suitable location
hf = figure('name', 'Flying Schedule', 'visible','off','units','pixel');%,'position',[100 100 560 400]);
movegui(hf,'center');
set(hf,'visible','on');

% Draw the employee work schedule matrix
%subplot(211);
h = imagesc(0.5:4.5,1:5,hoursMatrix) % 4.5 = 1/2 less than number of "rides"; 7 is # of IPs
set(gca,'xtick',0.5:4.5, 'xticklabel', studTable.NextEvent); % second parameter is # of rides for this line
set(gca,'ytick',1:numStud,'yticklabel',studTable.StudentCrewName);
axis tight;
set(gca,'xlimmode','manual','ylimmode','manual','layer','bottom');
hold all;
ylabel('Crew','FontSize',12);
xlabel('Event', 'FontSize', 12);

% Let's make the grid lines manually...
for n = 0.5:numStud+0.5
    plot(xlim,[n n],'k');
end
for n = 0:5  % second parameter is # of rides for this line
    plot([n n], ylim,'k');
end

title(['Crew event schedule' 10 ...
       'Total reward of schedule over 1 day: ' num2str(-cost)],'FontSize',16);
colormap([1 1 1; 0 0.5 1]);

% % Draw the required vs. actual staff
% subplot(212);
% plot(0.5:4.5,requirements(2,:),'b.-','linewidth',3,'markersize',30);
% actualHours = -A(1:5,:)*x; % second parameter is # of rides for this line
% hold on;
% plot(0.5:4.5,actualHours,'r:.','linewidth',2,'markersize',16);
% xlim([0 5]); % second parameter is # of rides for this line
% set(gca,'xtick',0:5,'ytick',0:10); % second parameter is # of rides for this line
% ylim([0 10]);
% grid on;
% title(['Hourly Staff Count'],'FontSize',16);
% legend({'Employees Required', 'Employees Scheduled'});
% xlabel('Time of day','fontsize',12);
% ylabel('Employee count','fontsize',12);