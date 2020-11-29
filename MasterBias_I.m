%Writer: Austen Fourkas | UMD Astronomy | Team Rocket

%Bias imports
%Import .fit files from library
Bias1 = rfits('P Bias\calib-001-bi.fit');
Bias2 = rfits('P Bias\calib-002-bi.fit');
Bias3 = rfits('P Bias\calib-003-bi.fit');
Bias4 = rfits('P Bias\calib-004-bi.fit');
Bias5 = rfits('P Bias\calib-005-bi.fit');
Bias6 = rfits('P Bias\calib-006-bi.fit');
Bias7 = rfits('P Bias\calib-007-bi.fit');
Bias8 = rfits('P Bias\calib-008-bi.fit');
Bias9 = rfits('P Bias\calib-009-bi.fit');
Bias10 = rfits('P Bias\calib-010-bi.fit');

%Data imports
%Pulls 'data' array out of .fit files, which contains the pixel data needed
%for calibration
Bias1data = Bias1.data;
Bias2data = Bias2.data;
Bias3data = Bias3.data;
Bias4data = Bias4.data;
Bias5data = Bias5.data;
Bias6data = Bias6.data;
Bias7data = Bias7.data;
Bias8data = Bias8.data;
Bias9data = Bias9.data;
Bias10data = Bias10.data;

%3D array creation
%Compiles data arrays into a 3D matrix so that the median value can be
%found across the 3rd dimension
BiasFin(:,:,1) = Bias1data;
BiasFin(:,:,2) = Bias2data;
BiasFin(:,:,3) = Bias3data;
BiasFin(:,:,4) = Bias4data;
BiasFin(:,:,5) = Bias5data;
BiasFin(:,:,6) = Bias6data;
BiasFin(:,:,7) = Bias7data;
BiasFin(:,:,8) = Bias8data;
BiasFin(:,:,9) = Bias9data;
BiasFin(:,:,10) = Bias10data;

%Median and final
%Finds the median across the 3rd dimension of the previously made matrix
%and rarranges data so that later imports format properly in MATLAB
BiasFin = flip(imrotate(median(BiasFin,3), 180));

%Variables
%Maximum and minimum of final image used for figure below
Min = min(BiasFin, [], 'all')
Max = max(BiasFin, [], 'all')

%Bias plot
figure(1)
imagesc(BiasFin, [Min, Max]); colorbar();
set(gca,'ColorScale','log');

%Bias FITS write
%Writes the final image to a .fit file for later use
fitswrite(BiasFin, 'Proper Image Masters\PMasterBias.fit')


