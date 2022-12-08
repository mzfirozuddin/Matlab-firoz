function result = obj(a, b, c, d)
%result = power((a - b),2) + power((c - d),2) - power((a - 30),3) - power((c - 40),3)
result = ((a-b)*(a-b)) + ((c-d)*(c-d)) - ((a-30)*(a-30)*(a-30)) - ((c-40)*(c-40)*(c-40));
