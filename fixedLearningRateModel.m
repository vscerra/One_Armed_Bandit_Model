function [V] = fixedLearningRateModel(r,alpha)
%fixedLearningRateModel makes a value prediction from t-1 and t reward
%values, giving an average with incorporated error prediction that equals a
%fixed learning rate alpha
V = zeros(size(r));
for t = 1:length(r)
    if t == 1
        V(t) = r(t);
    else
        V(t) = V(t-1)+ alpha*(r(t)-V(t-1));
    end
end

end

