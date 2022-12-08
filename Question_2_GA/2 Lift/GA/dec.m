function s = dec(t)

s = 0;

for i = 1:16    
    s = s + t(i) * power(2,(16-i));    
end
