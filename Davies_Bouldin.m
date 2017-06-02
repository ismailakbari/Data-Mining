function DBI=Davies_Bouldin(clusters_number,data,ind)   
%%%Davies_Bouldin index for clustering compactness and separation measurement
% Davies_Bouldin(clusters_number,data,ind)
% clusters_number = Number of clusters 
% distM = Dissimilarity matrix
% ind   = Indexes for each data point i.e. cluster to which each data point
% belongs
k=clusters_number;
%denominator=[];
dk = [];
G = []; 
%removing nan rows from distM (input data)matrix
[row, col ] = find(isnan(data));
%nanrows = distM(any(isnan(distM),2),:);
data(row,:) = [];
ind(row, :) = [];


% finding maximum distance in a cluster
for i=1:k
    indi=find(ind==i);
    x=indi;
    clust = data(x,:);
    %check if the cluster has only one member
    if (size(clust,1)==1)
        Gk = clust;
    else
        Gk = mean(clust);
    end    
    G = [G; Gk];
    temp = abs(pdist2(clust, Gk));
    deltak = sum(temp);
    csize = size(x, 1);
    dk = [dk; deltak/csize];   
    %intradis = [intradis;dx];    
end

maxk = [];
for i=1:k
    dkp = dk;
    dkp(i,:) = [];
    surat = dk(i) + dkp;
    Gp = G;
    Gp(i,:) = [];
    makhraj = abs(pdist2(Gp, G(i,:)));
    M = surat./makhraj;
    maxk= [maxk; max(M)];
end

DBI = sum(maxk)/k;
end
