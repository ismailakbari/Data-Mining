%   1. THE FIRST STEP IS TO CLEAN THE INPUT DATASETS 
%   ------------------------------------------------
function CleanData(inpfile, inpfilec)
%this script reads the input data from an Excel file, cleans it (removes
%the rows with missing values) and then wrties it back to the disk.
% this cleaned file then is used as the input data for all 4 algorithms.
%infile and infilec are defind in mainscript.m 
[raw_data,headers] = xlsread(inpfile);

%headers will be a cell of strings not an array
headers2 = headers(1,:);

% removing the rows with nan elements from data
[row, col ] = find(isnan(raw_data));
raw_data(row,:) = [];
%convert data array to a data cell beacuse headers2 is a cell
cleaned_data = num2cell(raw_data);
%removing the data matrix to save memory
%clear('data');
xlswrite(inpfilec, [headers2;cleaned_data]);
%xlswrite('KDD2014\Results\test\hd-cleaned.csv', data, 'A2');

end