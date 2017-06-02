function DI=dunns(number_of_clusters,data,ind)   
%%%Dunn's index for clustering compactness and separation measurement
% dunns(clusters_number,distM,ind)
% clusters_number = Number of clusters 
% distM = Dissimilarity matrix
% ind   = Indexes for each data point aka cluster to which each data point
% belongs
i=number_of_clusters;
%denominator=[];
interdis = [];
intradis = []; 

%removing nan rows from distM (input data)matrix
[row, col ] = find(isnan(data));
%nanrows = distM(any(isnan(distM),2),:);
data(row,:) = [];
ind(row, :) = [];


% finding minimum distance between clusters
for i2=1:i
    indi=find(ind==i2);
    indj=find(ind~=i2);
    x=indi;
    y=indj;
    %temp=distM(x,y);
    temp = abs(pdist2(data(x,:), data(y,:)));
    %denominator=[denominator;temp(:)];
    dxy = min(temp(:));    
    interdis = [interdis;dxy];    
end
dmin = min (interdis(:));

% finding maximum distance in a cluster
for i2=1:i
    indi=find(ind==i2);
    x=indi;
    temp = abs(pdist(data(x,:)));
    %denominator=[denominator;temp(:)];
    dx = max(temp(:));    
    intradis = [intradis;dx];    
end
dmax = max (intradis(:));

DI = dmin/dmax ;
end



%num=min(min(denominator)); 
%neg_obs=zeros(size(distM,1),size(distM,2));

%for ix=1:i
%    indxs=find(ind==ix);
%    neg_obs(indxs,indxs)=1;
%end

%dem=neg_obs.*distM;
%dem=max(max(dem));

%DI=num/dem;
%end