function [V] = simpleModel(r)
%SIMPLEMODEL computes a running average of wins over trials (t)
V = zeros(1,length(r));
for t = 1:length(r)
    V(t) = mean(r(1:t));
end

end

