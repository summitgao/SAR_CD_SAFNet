function  [FP,FN,OE,PCC]=DAcom(refImage,tstImage)
% DAcom.m
% Usage: [FA,MA,OE]=DAcom(refImage,testImage)
% Inputs:
%   refImage=reference map
%   testImage=detection map
% Outputs:
%   FA=False alarms
%   MA=Missed alarms
%   OE=Overall Error
% July,15,2009
% Copyright(C) 2008-2009 by Fan
%-------------------------------------------------------------------------
if isempty(refImage)
    error('!!!Not exist reference map');
end

refImage(find(refImage>=128))=255;
refImage(find(refImage<128))=0;

RI=refImage(:);
TI=tstImage(:); 


aa = find(RI==0&TI~=0);
bb = find(RI~=0&TI==0);

FP = numel(aa);
FN = numel(bb);
OE = FP + FN; 
[m,n] = size(tstImage);
PCC = 1 - OE/(m*n);
