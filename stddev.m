function kdevs=stddev(number_of_clusters,data,ind)   
%%%STANDARD DEVIATION OF ALL CLUSTERS
% clusters_number = Number of clusters 
% data = data matrix
% ind   = Indexes for each data point to which cluster it belongs

%removing nan rows from distM (input data)matrix
[row, col ] = find(isnan(data));
%nanrows = distM(any(isnan(distM),2),:);
data(row,:) = [];
ind(row, :) = [];

k=number_of_clusters;

% stds is the matrix which holds the standard deviation of all clusters
stds = [];
for i=1:k
    indi=find(ind==i);
    clust = data(indi,:);
    [dim1, dim2] = size(clust);
    if(dim1==1)
        stds = [stds; zeros(1,dim2)];
    else    
        stds = [stds; std(clust)];
    end    
end

% calculate sum(mean(stddev))
%sm = sum(mean(stds));
%kdevs = sm;
if(size(stds,1)==1)
    kdevs = stds;
else
    kdevs = mean(stds);
end
