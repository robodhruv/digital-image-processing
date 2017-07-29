function result = profiler_test(Count)

for k = 1:Count
    result(k) = sin(k/50);
    if result(k) < -0.9
        result(k) = gammaln(k);
    end
end