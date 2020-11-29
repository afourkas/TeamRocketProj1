%Writer: Austen Fourkas | UMD Astronomy | Team Rocket

%FITS imports
%Import .fit files from library. In this case, an uncalibrated science
%image is included for alignment purposes
ScienceCalib = rfits('P I Images\7662-001-i.fit');
Science1 = rfits('P I Images PreAlign\Science1Fin.fit');
Science2 = rfits('P I Images PreAlign\Science2Fin.fit');
Science3 = rfits('P I Images PreAlign\Science3Fin.fit');
Science4 = rfits('P I Images PreAlign\Science4Fin.fit');
Science5 = rfits('P I Images PreAlign\Science5Fin.fit');
Science6 = rfits('P I Images PreAlign\Science6Fin.fit');
Science7 = rfits('P I Images PreAlign\Science7Fin.fit');
Science8 = rfits('P I Images PreAlign\Science8Fin.fit');
Science9 = rfits('P I Images PreAlign\Science9Fin.fit');
Science10 = rfits('P I Images PreAlign\Science10Fin.fit');
Science11 = rfits('P I Images PreAlign\Science11Fin.fit');
Science12 = rfits('P I Images PreAlign\Science12Fin.fit');
Science13 = rfits('P I Images PreAlign\Science13Fin.fit');
Science14 = rfits('P I Images PreAlign\Science14Fin.fit');
Science15 = rfits('P I Images PreAlign\Science15Fin.fit');
Science16 = rfits('P I Images PreAlign\Science16Fin.fit');
Science17 = rfits('P I Images PreAlign\Science17Fin.fit');
Science18 = rfits('P I Images PreAlign\Science18Fin.fit');
Science19 = rfits('P I Images PreAlign\Science19Fin.fit');
Science20 = rfits('P I Images PreAlign\Science10Fin.fit');

%Science data
%Pulls 'data' array out of .fit files, which contains the pixel data needed
%for calibration. The uncalibrated science image is rotated 90 degrees so
%that its orientation and dimensions match that of the calibrated images.
Calibdata = imrotate(ScienceCalib.data, 90);
Science1data = Science1.data;
Science2data = Science2.data;
Science3data = Science3.data;
Science4data = Science4.data;
Science5data = Science5.data;
Science6data = Science6.data;
Science7data = Science7.data;
Science8data = Science8.data;
Science9data = Science9.data;
Science10data = Science10.data;
Science11data = Science11.data;
Science12data = Science12.data;
Science13data = Science13.data;
Science14data = Science14.data;
Science15data = Science15.data;
Science16data = Science16.data;
Science17data = Science17.data;
Science18data = Science18.data;
Science19data = Science19.data;
Science20data = Science20.data;

%Variables
%These establish the base coordinates used for image alignment. The first
%ginput should be used to select the center of the image's primary object.
%The second ginput should be used to select a secondary object which
%appears in every image. 
imagesc(Calibdata);
set(gca,'ColorScale','log');
[x01, y01]= ginput(1)

imagesc(Calibdata);
set(gca,'ColorScale','log');
[x02, y02]= ginput(1)

%This computes the exact center pixel of each image and determines the
%distance between the center and the secondary object selected by the
%second ginput
x0 = (size(Science1data,2)/2)+(x02-x01);
y0 = (size(Science1data,1)/2)+(y02-y01);

%ginputs
%In these inputs, you should select the secondary object in each image, as
%its distance from the primary object should be constant. After doing so
%the code will automatically process all the inputs and properly align the
%primary object to the center of the image. This process is dependent on
%YOUR mouse accuracy, so be careful
imagesc(Science1data);
set(gca,'ColorScale','log');
[x1, y1] = ginput(1);

imagesc(Science2data);
set(gca,'ColorScale','log');
[x2, y2] = ginput(1);

imagesc(Science3data);
set(gca,'ColorScale','log');
[x3, y3] = ginput(1);

imagesc(Science4data);
set(gca,'ColorScale','log');
[x4, y4] = ginput(1);

imagesc(Science5data);
set(gca,'ColorScale','log');
[x5, y5] = ginput(1);

imagesc(Science6data);
set(gca,'ColorScale','log');
[x6, y6] = ginput(1);

imagesc(Science7data);
set(gca,'ColorScale','log');
[x7, y7] = ginput(1);

imagesc(Science8data);
set(gca,'ColorScale','log');
[x8, y8] = ginput(1);

imagesc(Science9data);
set(gca,'ColorScale','log');
[x9, y9] = ginput(1);

imagesc(Science10data);
set(gca,'ColorScale','log');
[x10, y10] = ginput(1);

imagesc(Science11data);
set(gca,'ColorScale','log');
[x11, y11] = ginput(1);

imagesc(Science12data);
set(gca,'ColorScale','log');
[x12, y12] = ginput(1);

imagesc(Science13data);
set(gca,'ColorScale','log');
[x13, y13] = ginput(1);

imagesc(Science14data);
set(gca,'ColorScale','log');
[x14, y14] = ginput(1);

imagesc(Science15data);
set(gca,'ColorScale','log');
[x15, y15] = ginput(1);

imagesc(Science16data);
set(gca,'ColorScale','log');
[x16, y16] = ginput(1);

imagesc(Science17data);
set(gca,'ColorScale','log');
[x17, y17] = ginput(1);

imagesc(Science18data);
set(gca,'ColorScale','log');
[x18, y18] = ginput(1);

imagesc(Science19data);
set(gca,'ColorScale','log');
[x19, y19] = ginput(1);

imagesc(Science20data);
set(gca,'ColorScale','log');
[x20, y20] = ginput(1);

%Difference calculation
%Finds the difference between the selected point and the position
%calculated earlier
Nrow1 = round(mean(x0-x1));
Ncol1 = round(mean(y0-y1));

Nrow2 = round(mean(x0-x2));
Ncol2 = round(mean(y0-y2));

Nrow3 = round(mean(x0-x3));
Ncol3 = round(mean(y0-y3));

Nrow4 = round(mean(x0-x4));
Ncol4 = round(mean(y0-y4));

Nrow5 = round(mean(x0-x5));
Ncol5 = round(mean(y0-y5));

Nrow6 = round(mean(x0-x6));
Ncol6 = round(mean(y0-y6));

Nrow7 = round(mean(x0-x7));
Ncol7 = round(mean(y0-y7));

Nrow8 = round(mean(x0-x8));
Ncol8 = round(mean(y0-y8));

Nrow9 = round(mean(x0-x9));
Ncol9 = round(mean(y0-y9));

Nrow10 = round(mean(x0-x10));
Ncol10 = round(mean(y0-y10));

Nrow11 = round(mean(x0-x11));
Ncol11 = round(mean(y0-y11));

Nrow12 = round(mean(x0-x12));
Ncol12 = round(mean(y0-y12));

Nrow13 = round(mean(x0-x13));
Ncol13 = round(mean(y0-y13));

Nrow14 = round(mean(x0-x14));
Ncol14 = round(mean(y0-y14));

Nrow15 = round(mean(x0-x15));
Ncol15 = round(mean(y0-y15));

Nrow16 = round(mean(x0-x16));
Ncol16 = round(mean(y0-y16));

Nrow17 = round(mean(x0-x17));
Ncol17 = round(mean(y0-y17));

Nrow18 = round(mean(x0-x18));
Ncol18 = round(mean(y0-y18));

Nrow19 = round(mean(x0-x19));
Ncol19 = round(mean(y0-y19));

Nrow20 = round(mean(x0-x20));
Ncol20 = round(mean(y0-y20));

%Final shifts
%Shifts the images based on previously selected points and performs various
%operations in order to make .fit files usable by later MATLAB code
Science1Fin = flip(imrotate(imshift(Science1data, Ncol1, Nrow1),90));
fitswrite(Science1Fin, 'P I Images Aligned\Science1Fin.fit');

Science2Fin = flip(imrotate(imshift(Science2data, Ncol2, Nrow2),90));
fitswrite(Science2Fin, 'P I Images Aligned\Science2Fin.fit');

Science3Fin = flip(imrotate(imshift(Science3data, Ncol3, Nrow3),90));
fitswrite(Science3Fin, 'P I Images Aligned\Science3Fin.fit');

Science4Fin = flip(imrotate(imshift(Science4data, Ncol4, Nrow4),90));
fitswrite(Science4Fin, 'P I Images Aligned\Science4Fin.fit');

Science5Fin = flip(imrotate(imshift(Science5data, Ncol5, Nrow5),90));
fitswrite(Science5Fin, 'P I Images Aligned\Science5Fin.fit');

Science6Fin = flip(imrotate(imshift(Science6data, Ncol6, Nrow6),90));
fitswrite(Science6Fin, 'P I Images Aligned\Science6Fin.fit');

Science7Fin = flip(imrotate(imshift(Science7data, Ncol7, Nrow7),90));
fitswrite(Science7Fin, 'P I Images Aligned\Science7Fin.fit');

Science8Fin = flip(imrotate(imshift(Science8data, Ncol8, Nrow8),90));
fitswrite(Science8Fin, 'P I Images Aligned\Science8Fin.fit');

Science9Fin = flip(imrotate(imshift(Science9data, Ncol9, Nrow9),90));
fitswrite(Science9Fin, 'P I Images Aligned\Science9Fin.fit');

Science10Fin = flip(imrotate(imshift(Science10data, Ncol10, Nrow10),90));
fitswrite(Science10Fin, 'P I Images Aligned\Science10Fin.fit');

Science11Fin = flip(imrotate(imshift(Science11data, Ncol11, Nrow11),90));
fitswrite(Science11Fin, 'P I Images Aligned\Science11Fin.fit');

Science12Fin = flip(imrotate(imshift(Science12data, Ncol12, Nrow12),90));
fitswrite(Science12Fin, 'P I Images Aligned\Science12Fin.fit');

Science13Fin = flip(imrotate(imshift(Science13data, Ncol13, Nrow13),90));
fitswrite(Science13Fin, 'P I Images Aligned\Science13Fin.fit');

Science14Fin = flip(imrotate(imshift(Science14data, Ncol14, Nrow14),90));
fitswrite(Science14Fin, 'P I Images Aligned\Science14Fin.fit');

Science15Fin = flip(imrotate(imshift(Science15data, Ncol15, Nrow15),90));
fitswrite(Science15Fin, 'P I Images Aligned\Science15Fin.fit');

Science16Fin = flip(imrotate(imshift(Science16data, Ncol16, Nrow16),90));
fitswrite(Science16Fin, 'P I Images Aligned\Science16Fin.fit');

Science17Fin = flip(imrotate(imshift(Science17data, Ncol17, Nrow17),90));
fitswrite(Science17Fin, 'P I Images Aligned\Science17Fin.fit');

Science18Fin = flip(imrotate(imshift(Science18data, Ncol18, Nrow18),90));
fitswrite(Science18Fin, 'P I Images Aligned\Science18Fin.fit');

Science19Fin = flip(imrotate(imshift(Science19data, Ncol19, Nrow19),90));
fitswrite(Science19Fin, 'P I Images Aligned\Science19Fin.fit');

Science20Fin = flip(imrotate(imshift(Science20data, Ncol20, Nrow20),90));
fitswrite(Science20Fin, 'P I Images Aligned\Science20Fin.fit');
