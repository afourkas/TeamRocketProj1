%Writer: Austen Fourkas | UMD Astronomy | Team Rocket

%Dark imports
%Import .fit files from library for both bias and dark images
Dark1 = rfits('P Darks\calib-001-d.fit');
Dark2 = rfits('P Darks\calib-002-d.fit');
Dark3 = rfits('P Darks\calib-003-d.fit');
Dark4 = rfits('P Darks\calib-004-d.fit');
Dark5 = rfits('P Darks\calib-005-d.fit');
Dark6 = rfits('P Darks\calib-006-d.fit');
Dark7 = rfits('P Darks\calib-007-d.fit');
Dark8 = rfits('P Darks\calib-008-d.fit');
Dark9 = rfits('P Darks\calib-009-d.fit');
Dark10 = rfits('P Darks\calib-010-d.fit');
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
%Pull data from bias and dark images, and subtract bias data from
%corresponding dark image
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
Dark1data = Dark1.data-Bias1data
Dark2data = Dark2.data-Bias2data;
Dark3data = Dark3.data-Bias3data;
Dark4data = Dark4.data-Bias4data;
Dark5data = Dark5.data-Bias5data;
Dark6data = Dark6.data-Bias6data;
Dark7data = Dark7.data-Bias7data;
Dark8data = Dark8.data-Bias8data;
Dark9data = Dark9.data-Bias9data;
Dark10data = Dark10.data-Bias10data;

%3D array creation
%Compiles data arrays into a 3D matrix so that the median value can be
%found across the 3rd dimension
DarkFin(:,:,1) = Dark1data;
DarkFin(:,:,2) = Dark2data;
DarkFin(:,:,3) = Dark3data;
DarkFin(:,:,4) = Dark4data;
DarkFin(:,:,5) = Dark5data;
DarkFin(:,:,6) = Dark6data;
DarkFin(:,:,7) = Dark7data;
DarkFin(:,:,8) = Dark8data;
DarkFin(:,:,9) = Dark9data;
DarkFin(:,:,10) = Dark10data;

%Median
%Finds the median across the 3rd dimension of the previously made matrix
%and rarranges data so that later imports format properly in MATLAB
DarkMed = flip(imrotate(median(DarkFin,3), 180));

%Maximum and minimum of final image used for figure below
Min = min(DarkMed, [], 'all');
Max = max(DarkMed, [], 'all');

figure(1)
imagesc(DarkMed); colorbar();
set(gca,'ColorScale','log');

%Write
%Writes the final image to a .fit file for later use
fitswrite(DarkMed, 'Proper Image Masters\PMasterDark.fit')
