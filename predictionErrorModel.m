function [V] = predictionErrorModel(r)
%predictionErrorModel1 makes a value prediction from t-1 and t reward
%values, giving an average with incorporated error prediction
V = zeros(size(r));
for t = 1:length(r)
    if t == 1
        V(t) = r(t);
    else
        V(t) = V(t-1)+(1/t)*(r(t)-V(t-1));
    end
end

end

