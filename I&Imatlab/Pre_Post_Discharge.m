% Calculating Deviations for each month for pre and post Discharge: 
close all, clear all, clc

% Import Data from 2020
BC_Post = readmatrix('Post_PS_Stations_by_Sheet.xlsx',...
                     'Sheet','BriarCliff','Range','B2:K427');
BC_Pre  = readmatrix('Pre_PS_Stations_by_Sheet.xlsx',...
                     'Sheet','BriarCliff','Range','B2:K762');

BC_TD_Post = cell(1,12);
BC_TD_Pre = cell(1,12);

for i = 1:12
    ind = find(BC_Post(:,3) == i);
    BC_TD_Post{i} = BC_Post(ind,10);  
    ind = find(BC_Pre(:,3) == i);
    BC_TD_Pre{i} = BC_Pre(ind,10);  

    BC_Mean_Post(i) = mean(BC_TD_Post{i});
    BC_STD_Post(i)  = std(BC_TD_Post{i});
    BC_Mean_Pre(i) = mean(BC_TD_Pre{i});
    BC_STD_Pre(i)  = std(BC_TD_Pre{i});

end

figure(1)
errorbar(1:12,BC_Mean_Post,BC_STD_Post,'bo-','linewidth',2)
hold on
errorbar(1:12,BC_Mean_Pre,BC_STD_Pre,'ko-','linewidth',2)
xticks(0:13)
xticklabels({'','Jan','Feb','Mar','Apr','May','June','July','Aug','Sept','Oct','Nov','Dec',''})
legend('Before Rehab','After Rehab','fontsize',18)
title('College Gardens','fontsize',20,'interpreter','latex')
xlim([0 13])


% Error bar plots: 
for j = 1:12

    [h(j),p(j),ci(:,j),stats] = ttest2(BC_TD_Pre{j}, BC_TD_Post{j}, 'Tail','right');

end
    grid minor

