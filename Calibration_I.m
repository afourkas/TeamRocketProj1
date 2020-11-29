%Writer: Austen Fourkas | UMD Astronomy | Team Rocket

%FITS imports
%Import .fit files from library
Science1 = rfits('P I Images\7662-001-i.fit');
Science2 = rfits('P I Images\7662-002-i.fit');
Science3 = rfits('P I Images\7662-003-i.fit');
Science4 = rfits('P I Images\7662-004-i.fit');
Science5 = rfits('P I Images\7662-005-i.fit');
Science6 = rfits('P I Images\7662-006-i.fit');
Science7 = rfits('P I Images\7662-007-i.fit');
Science8 = rfits('P I Images\7662-008-i.fit');
Science9 = rfits('P I Images\7662-009-i.fit');
Science10 = rfits('P I Images\7662-010-i.fit');
Science11 = rfits('P I Images\7662-011-i.fit');
Science12 = rfits('P I Images\7662-012-i.fit');
Science13 = rfits('P I Images\7662-013-i.fit');
Science14 = rfits('P I Images\7662-014-i.fit');
Science15 = rfits('P I Images\7662-015-i.fit');
Science16 = rfits('P I Images\7662-016-i.fit');
Science17 = rfits('P I Images\7662-017-i.fit');
Science18 = rfits('P I Images\7662-018-i.fit');
Science19 = rfits('P I Images\7662-019-i.fit');
Science20 = rfits('P I Images\7662-020-i.fit');
MasterDark = rfits('Proper Image Masters\PMasterDark.fit');
MasterFlat = rfits('Proper Image Masters\PMasterFlat.fit');
MasterBias = rfits('Proper Image Masters\PMasterBias.fit');

%Science data
%Pulls 'data' array out of .fit files, which contains the pixel data needed
%for calibration
Science1data = imrotate(Science1.data, 90);
Science2data = imrotate(Science2.data, 90);
Science3data = imrotate(Science3.data, 90);
Science4data = imrotate(Science4.data, 90);
Science5data = imrotate(Science5.data, 90);
Science6data = imrotate(Science6.data, 90);
Science7data = imrotate(Science7.data, 90);
Science8data = imrotate(Science8.data, 90);
Science9data = imrotate(Science9.data, 90);
Science10data = imrotate(Science10.data, 90);
Science11data = imrotate(Science11.data, 90);
Science12data = imrotate(Science12.data, 90);
Science13data = imrotate(Science13.data, 90);
Science14data = imrotate(Science14.data, 90);
Science15data = imrotate(Science15.data, 90);
Science16data = imrotate(Science16.data, 90);
Science17data = imrotate(Science17.data, 90);
Science18data = imrotate(Science18.data, 90);
Science19data = imrotate(Science19.data, 90);
Science20data = imrotate(Science20.data, 90);
MasterDarkdata = MasterDark.data;
MasterFlatdata = MasterFlat.data;
MasterBiasdata = MasterBias.data;

%Calibration
%Performs the standard image calibration process for astrophotography. This
%process requires that the master bias, dark and flat images be created
%BEFORE attempting to complete final image calibration. This code also
%flips and rotates images so that they can be imported into later code with
%no hassle
Science1Fin = flip(imrotate(((Science1data - MasterDarkdata-MasterBiasdata)./MasterFlatdata), 90));
Science2Fin = flip(imrotate(((Science2data - MasterDarkdata-MasterBiasdata)./MasterFlatdata), 90));
Science3Fin = flip(imrotate(((Science3data - MasterDarkdata-MasterBiasdata)./MasterFlatdata), 90));
Science4Fin = flip(imrotate(((Science4data - MasterDarkdata-MasterBiasdata)./MasterFlatdata), 90));
Science5Fin = flip(imrotate(((Science5data - MasterDarkdata-MasterBiasdata)./MasterFlatdata), 90));
Science6Fin = flip(imrotate(((Science6data - MasterDarkdata-MasterBiasdata)./MasterFlatdata), 90));
Science7Fin = flip(imrotate(((Science7data - MasterDarkdata-MasterBiasdata)./MasterFlatdata), 90));
Science8Fin = flip(imrotate(((Science8data - MasterDarkdata-MasterBiasdata)./MasterFlatdata), 90));
Science9Fin = flip(imrotate(((Science9data - MasterDarkdata-MasterBiasdata)./MasterFlatdata), 90));
Science10Fin = flip(imrotate(((Science10data - MasterDarkdata-MasterBiasdata)./MasterFlatdata), 90));
Science11Fin = flip(imrotate(((Science11data - MasterDarkdata-MasterBiasdata)./MasterFlatdata), 90));
Science12Fin = flip(imrotate(((Science12data - MasterDarkdata-MasterBiasdata)./MasterFlatdata), 90));
Science13Fin = flip(imrotate(((Science13data - MasterDarkdata-MasterBiasdata)./MasterFlatdata), 90));
Science14Fin = flip(imrotate(((Science14data - MasterDarkdata-MasterBiasdata)./MasterFlatdata), 90));
Science15Fin = flip(imrotate(((Science15data - MasterDarkdata-MasterBiasdata)./MasterFlatdata), 90));
Science16Fin = flip(imrotate(((Science16data - MasterDarkdata-MasterBiasdata)./MasterFlatdata), 90));
Science17Fin = flip(imrotate(((Science17data - MasterDarkdata-MasterBiasdata)./MasterFlatdata), 90));
Science18Fin = flip(imrotate(((Science18data - MasterDarkdata-MasterBiasdata)./MasterFlatdata), 90));
Science19Fin = flip(imrotate(((Science19data - MasterDarkdata-MasterBiasdata)./MasterFlatdata), 90));
Science20Fin = flip(imrotate(((Science20data - MasterDarkdata-MasterBiasdata)./MasterFlatdata), 90));

%FITS writing
%Writes the final image to a .fit file for later use
fitswrite(Science1Fin, 'P I Images PreAlign\Science1Fin.fit');
fitswrite(Science2Fin, 'P I Images PreAlign\Science2Fin.fit');
fitswrite(Science3Fin, 'P I Images PreAlign\Science3Fin.fit');
fitswrite(Science4Fin, 'P I Images PreAlign\Science4Fin.fit');
fitswrite(Science5Fin, 'P I Images PreAlign\Science5Fin.fit');
fitswrite(Science6Fin, 'P I Images PreAlign\Science6Fin.fit');
fitswrite(Science7Fin, 'P I Images PreAlign\Science7Fin.fit');
fitswrite(Science8Fin, 'P I Images PreAlign\Science8Fin.fit');
fitswrite(Science9Fin, 'P I Images PreAlign\Science9Fin.fit');
fitswrite(Science10Fin, 'P I Images PreAlign\Science10Fin.fit');
fitswrite(Science11Fin, 'P I Images PreAlign\Science11Fin.fit');
fitswrite(Science12Fin, 'P I Images PreAlign\Science12Fin.fit');
fitswrite(Science13Fin, 'P I Images PreAlign\Science13Fin.fit');
fitswrite(Science14Fin, 'P I Images PreAlign\Science14Fin.fit');
fitswrite(Science15Fin, 'P I Images PreAlign\Science15Fin.fit');
fitswrite(Science16Fin, 'P I Images PreAlign\Science16Fin.fit');
fitswrite(Science17Fin, 'P I Images PreAlign\Science17Fin.fit');
fitswrite(Science18Fin, 'P I Images PreAlign\Science18Fin.fit');
fitswrite(Science19Fin, 'P I Images PreAlign\Science19Fin.fit');
fitswrite(Science20Fin, 'P I Images PreAlign\Science20Fin.fit');