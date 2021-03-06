%% GTbinarize(GTstruct, 'ResField', value, 'BinFieldName', value)
%
% this function binarize a matrix. Positive values are retained as 1.
% Negative values or zeros, as 0. Usually it is used after the function
% GTthreshold.
%
% INPUTS:
%
% - GTstruct: a GTstruct
% - ResField: a name with the field containing the matrix on which
%             apply the GTthreshold.
%
% - BinFieldName: a string with the output name for the binarized matrix.
%
%
% OUTPUTS:
%
% GTstruct_bin: the original GTstruct with the addition one field:
%               - BinFieldName (a as argument) the binarized matrix
%               (specified in the ResField).
%
% Author: Giorgio Arcara
%
% versione: 7/03/2018


function GTstruct_bin = GTbinarize(GTstruct, varargin)
p = inputParser;
addParameter(p, 'ResField', [], @ischar);
addParameter(p, 'BinFieldName', [], @ischar);


parse(p, varargin{:});

ResField = p.Results.ResField;
BinFieldName =  p.Results.BinFieldName;


% initialize results
GTstruct_bin = GTstruct;

% loop over all objects in GTstruct and compute the measure.
for iK = 1:length(GTstruct)
    Res = GTstruct_bin(iK).(ResField) ~= 0 & ~isnan(GTstruct_bin(iK).(ResField));
    GTstruct_bin(iK).(BinFieldName) = double(Res);
    % note that numbers are stored as double cause several measures in BCT
    % functions expect numbers
end;


end