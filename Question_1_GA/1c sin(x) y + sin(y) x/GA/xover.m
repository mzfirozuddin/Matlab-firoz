function [c1, c2] = xover(p1, p2)

cp = round(unifrnd(1,length(p1),1,1));

for i = 1:cp
    c1(i) = p1(i);
    c2(i) = p2(i);
end

for i = cp + 1:length(p1)
    c1(i) = p2(i);
    c2(i) = p1(i);
end
