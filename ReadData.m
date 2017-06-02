%    2. THE SECOND STEP IS TO READ DATA FROM CLEANED DATASETS
%   ---------------------------------------------------------
function cdata = ReadData(inpfilec)
%distM = [1;7;3;2];
%distM = [1,1;3,3;5,5;3,3;9,9;10,10;15,15;25,25;26,26;30,30];
%{
dat = inputdlg('data file name');
filename = dat{:};
data= xlsread(filename);
k1 = inputdlg('Number of clusters');
% To calculate the execution time we use tic; toc; commands
tic;
%}
cdata= xlsread(inpfilec);
% k is the number of clusters
%k = str2num(k1{:});

[row, col ] = find(isnan(cdata));
cdata(row,:) = [];
%index = kddcluster1(k, data);

end