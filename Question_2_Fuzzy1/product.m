function mu = product(A, B)
len1 = length(A);
len2 = length(B);
len = max(len1, len2);
for i = 1:len
	mu(i) = abs(A(i) * B(i));
end