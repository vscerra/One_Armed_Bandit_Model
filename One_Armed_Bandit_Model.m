% Some basic reinforcement learning concepts,
%including a model of the 1-armed bandit task
% Calls functions: playSlotMachine, simpleModel, predictionErrorModel,
% fixedLearningRateModel
% Vscerra, 2020

clear
%set win probability
p_win = 0.45;
%set number of plays
t = 100;
%now simulate bandit play
r = playSlotMachine(p_win,t);
%compute values from simple model
V_simple = simpleModel(r);
% compute value from model incorporating prediction error
V_predictionError = predictionErrorModel(r);

figure(1);
clf
plot(r,'.','markersize',30)
hold on
plot(V_simple,'linewidth',5)
plot(V_predictionError,'linewidth',2)
plot([0 t],[1 1]*p_win,'k--')
legend({'rewards' 'V_{simple}','V_{predError}','{\it p}_{win}'})
xlabel('play number')
ylabel('reward')
title('1-Armed Bandit Simulation')
set(gca,'fontsize',16)

%% Now simulate a bait and switch situation, where probability of
% winning shifts after a number of trials
p_bait = 0.95;
p_switch = 0.05;
t_bait = 1000;
t_switch = 300;
r_bait = playSlotMachine(p_bait,t_bait);
r_switch = playSlotMachine(p_switch,t_switch);
r = [r_bait r_switch];
alpha = 0.05;
%calculate running value
V_simple = simpleModel(r);
V_predictionError = predictionErrorModel(r);
V_fixedLR = fixedLearningRateModel(r,alpha);

figure(2);
clf
plot(r,'.','markersize',30)
hold on
plot(V_simple,'linewidth',6)
plot(V_predictionError,'linewidth',3)
plot(V_fixedLR,'linewidth',3)

plot([0 t_bait],[1 1]*p_bait,'k--')
plot([t_bait t_switch+t_bait],[1 1]*p_switch,'k--')
legend({'rewards' 'V_{simple}','V_{predError}','V_{fixedLR}','{\it p}_{bait}', '{\it p}_{switch}'})
xlabel('play number')
ylabel('reward')
title('1-Armed Bandit with \Delta p_{win} and Learning Rate')
set(gca,'fontsize',16)