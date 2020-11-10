function words = proj_extraction(img, thrshld)
%Line segmentation based on  projection profiles.
%lines will be returned in cell array format, the function takes an input
%image and the threshold, if threshold is not provided the mean will be
%used. The plot of the projections will also be shown for the purpose of
%changing the threshold in case the mean gives poor results.
%create the projection profiles
horizontalProfile = sum(img, 1);
%plot it to get an idea of the threshold to use
plot(horizontalProfile, 'r');
grid on;
if (nargin<2)
    proj_mean =  mean(horizontalProfile)
    words = horizontalProfile < (proj_mean);
else
    words = horizontalProfile < thrshld;
end
upper = find(diff(words) == 1);
lower = find(diff(words) == -1);
%now find and extract the lines
words = cell(length(upper),1);
for k = 1 : (length(upper))
    aa = upper(k);
    bb = lower(k);
    words{k} = img(:, aa:bb);
end