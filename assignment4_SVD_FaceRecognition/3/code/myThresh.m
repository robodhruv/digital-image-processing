function [thresh, U, alpha, avg] = myThresh(k)

[U, alpha, avg ] =mySVDDatabasing(k);
[least_distance_hits, least_distance_miss, hit_rate] = mySVDChecker( U, alpha, avg);
thresh = floor(mean(least_distance_miss)+mean(least_distance_hits));
thresh=thresh/2;

end


