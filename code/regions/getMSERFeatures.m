function [pixelListCell boundingEllipses ]=getMSERFeatures(I, varargin)
%extractMSERFeatures   Finds MSER regions. Returns pixel list and bounding 
%ellipse for each region.

[Iu8 params] = parseInputs(I,varargin{:});

pixelListCell = ocvExtractMSER(Iu8, params);

boundingEllipses = MSERRegions(pixelListCell);

%==========================================================================
% Parse and check inputs
%==========================================================================
function [Iu8 params] = parseInputs(I, varargin)

validateattributes(I,{'uint8', 'int16', 'uint16', ...
    'single', 'double'}, {'2d', 'nonempty', 'nonsparse', 'real'},...
    mfilename, 'I', 1); % Logical input is not supported

if isa(I,'uint8')
    Iu8 = I;
else
    Iu8 = im2uint8(I);
end

imageSize = size(I);

% Parse the PV pairs
parser = inputParser;
parser.CaseSensitive = true;

parser.addParamValue('ThresholdDelta', 5*100/255, @checkThresholdDelta);
parser.addParamValue('RegionAreaRange', [30 14000], @(x)checkRegionAreaRange(x,imageSize));
parser.addParamValue('MaxAreaVariation', 0.25, @checkMaxAreaVariation);

% Parse input
parser.parse(varargin{:});

% Populate the parameters to pass into OpenCV's ocvExtractMSER()
params.delta        = parser.Results.ThresholdDelta*255/100;
params.minArea      = parser.Results.RegionAreaRange(1);
params.maxArea      = parser.Results.RegionAreaRange(2);
params.maxVariation = parser.Results.MaxAreaVariation;

%--------------------------------------------------------------------------
% Other OpenCV parameters which are not exposed in the main interface
%--------------------------------------------------------------------------
params.minDiversity  = 0.2;
params.maxEvolution  = 200;
params.areaThreshold = 1;
params.minMargin     = 0.003;
params.edgeBlurSize  = 5;

%==========================================================================
function tf = checkThresholdDelta(thresholdDelta)
validateattributes(thresholdDelta, {'numeric'}, {'scalar',...
    'nonsparse', 'real', 'positive', '<=', 100}, mfilename);
tf = true;

%==========================================================================
function tf = checkRegionAreaRange(regionAreaRange, imageSize)
maxValue = imageSize(1)*imageSize(2);
validateattributes(regionAreaRange, {'numeric'}, {'integer',... 
    'nonsparse', 'real', 'positive', 'size', [1,2], ...
    '<', maxValue}, mfilename);

if regionAreaRange(2) < regionAreaRange(1)
  error(message('vision:detectMSERFeatures:invalidRegionSizeRange'));
end
tf = true;

%==========================================================================
function tf = checkMaxAreaVariation(maxAreaVariation)
validateattributes(maxAreaVariation, {'numeric'}, {'nonsparse', ...
    'real', 'scalar', '>=', 0}, mfilename);
tf = true;
