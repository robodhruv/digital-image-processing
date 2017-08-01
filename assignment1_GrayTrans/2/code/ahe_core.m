function val = ahe_core (i, j, windowsize, org)

mycdf = cumsum(imhist(org(i-windowsize:i+windowsize, j-windowsize:j+windowsize)))...
    / numel(org(i-windowsize:i+windowsize, j-windowsize:j+windowsize)); % numel fixed at 961
val = mycdf(org(i, j));

end