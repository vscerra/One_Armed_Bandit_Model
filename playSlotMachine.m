function [r] = playSlotMachine(p_win, t)
%This script simulates a simple slot machine with probability p_win of
%success in t trials. For use in 1-armed bandit simulations
trials = ones(1,t);
r = binornd(trials,p_win);
end

