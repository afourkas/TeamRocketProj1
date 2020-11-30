%Writer: Austen Fourkas | UMD Astronomy | Team Rocket

%FITS Imports
%Import .fit files from library. These files are created by the alignment process, so it
%must be completed BEFORE running this code
Science1Pre = rfits('P I Images Aligned\Science1Fin.fit');
Science2Pre = rfits('P I Images Aligned\Science2Fin.fit');
Science3Pre = rfits('P I Images Aligned\Science3Fin.fit');
Science4Pre = rfits('P I Images Aligned\Science4Fin.fit');
Science5Pre = rfits('P I Images Aligned\Science5Fin.fit');
Science6Pre = rfits('P I Images Aligned\Science6Fin.fit');
Science7Pre = rfits('P I Images Aligned\Science7Fin.fit');
Science8Pre = rfits('P I Images Aligned\Science8Fin.fit');
Science9Pre = rfits('P I Images Aligned\Science9Fin.fit');
Science10Pre = rfits('P I Images Aligned\Science10Fin.fit');
Science11Pre = rfits('P I Images Aligned\Science11Fin.fit');
Science12Pre = rfits('P I Images Aligned\Science12Fin.fit');
Science13Pre = rfits('P I Images Aligned\Science13Fin.fit');
Science14Pre = rfits('P I Images Aligned\Science14Fin.fit');
Science15Pre = rfits('P I Images Aligned\Science15Fin.fit');
Science16Pre = rfits('P I Images Aligned\Science16Fin.fit');
Science17Pre = rfits('P I Images Aligned\Science17Fin.fit');
Science18Pre = rfits('P I Images Aligned\Science18Fin.fit');
Science19Pre = rfits('P I Images Aligned\Science19Fin.fit');
Science20Pre = rfits('P I Images Aligned\Science20Fin.fit');
MasterDark = rfits('Proper Image Masters\PMasterDark.fit');
MasterFlat = rfits('Proper Image Masters\PMasterFlat.fit');
MasterBias = rfits('Proper Image Masters\PMasterBias.fit');

%FITS Data
%Pulls 'data' array out of .fit files, which contains the pixel data needed
%for calibration. 
Science1Predata = Science1Pre.data;
Science2Predata = Science2Pre.data;
Science3Predata = Science3Pre.data;
Science4Predata = Science4Pre.data;
Science5Predata = Science5Pre.data;
Science6Predata = Science6Pre.data;
Science7Predata = Science7Pre.data;
Science8Predata = Science8Pre.data;
Science9Predata = Science9Pre.data;
Science10Predata = Science10Pre.data;
Science11Predata = Science11Pre.data;
Science12Predata = Science12Pre.data;
Science13Predata = Science13Pre.data;
Science14Predata = Science14Pre.data;
Science15Predata = Science15Pre.data;
Science16Predata = Science16Pre.data;
Science17Predata = Science17Pre.data;
Science18Predata = Science18Pre.data;
Science19Predata = Science19Pre.data;
Science20Predata = Science20Pre.data;

%Crops
%Crops each aligned image about its center into a square image. The first
%two numbers (636:836) define the number of rows in the crop and their
%position in the initial image. The second set of numbers (992:1192) are
%the number of columns in the crop and their position in the initial image
Science1Crop = Science1Predata(636:836, 992:1192);
Science2Crop = Science2Predata(636:836, 992:1192);
Science3Crop = Science3Predata(636:836, 992:1192);
Science4Crop = Science4Predata(636:836, 992:1192);
Science5Crop = Science5Predata(636:836, 992:1192);
Science6Crop = Science6Predata(636:836, 992:1192);
Science7Crop = Science7Predata(636:836, 992:1192);
Science8Crop = Science8Predata(636:836, 992:1192);
Science9Crop = Science9Predata(636:836, 992:1192);
Science10Crop = Science10Predata(636:836, 992:1192);
Science11Crop = Science11Predata(636:836, 992:1192);
Science12Crop = Science12Predata(636:836, 992:1192);
Science13Crop = Science13Predata(636:836, 992:1192);
Science14Crop = Science14Predata(636:836, 992:1192);
Science15Crop = Science15Predata(636:836, 992:1192);
Science16Crop = Science16Predata(636:836, 992:1192);
Science17Crop = Science17Predata(636:836, 992:1192);
Science18Crop = Science18Predata(636:836, 992:1192);
Science19Crop = Science19Predata(636:836, 992:1192);
Science20Crop = Science20Predata(636:836, 992:1192);

%Pixel Fixing
%This process corrects for the propagation of cosmic rays which weren't
%fixed in the calibration process. Once again, this process can be
%automated for each image with a while loop
[x1, y1] = find(Science1Crop == max(Science1Crop, [], 'all'))
Fix1 = Science1Crop(y1-1:y1+1, x1-1:x1+1)
Fix2Avg = median(Fix1, 'all')
Science1Crop(x1,y1) = Fix2Avg;

[x2, y2] = find(Science2Crop == max(Science2Crop, [], 'all'))
Fix2 = Science2Crop(y2-1:y2+1, x2-1:x2+1)
Fix2Avg = median(Fix2, 'all')
Science2Crop(x2,y2) = Fix2Avg;

[x3, y3] = find(Science3Crop == max(Science3Crop, [], 'all'))
Fix3 = Science3Crop(y3-1:y3+1, x3-1:x3+1)
Fix3Avg = median(Fix3, 'all')
Science3Crop(x3,y3) = Fix3Avg;

[x4, y4] = find(Science4Crop == max(Science4Crop, [], 'all'))
Fix4 = Science4Crop(y4-1:y4+1, x4-1:x4+1)
Fix4Avg = median(Fix4, 'all')
Science4Crop(x4,y4) = Fix4Avg;

[x5, y5] = find(Science5Crop == max(Science5Crop, [], 'all'))
Fix5 = Science5Crop(y5-1:y5+1, x5-1:x5+1)
Fix5Avg = median(Fix5, 'all')
Science5Crop(x5,y5) = Fix5Avg;

[x6, y6] = find(Science6Crop == max(Science6Crop, [], 'all'))
Fix6 = Science6Crop(y6-1:y6+1, x6-1:x6+1)
Fix6Avg = median(Fix6, 'all')
Science6Crop(x6,y6) = Fix6Avg;

[x7, y7] = find(Science7Crop == max(Science7Crop, [], 'all'))
Fix7 = Science7Crop(y7-1:y7+1, x7-1:x7+1)
Fix7Avg = median(Fix7, 'all')
Science7Crop(x7,y7) = Fix7Avg;

[x8, y8] = find(Science8Crop == max(Science8Crop, [], 'all'))
Fix8 = Science8Crop(y8-1:y8+1, x8-1:x8+1)
Fix8Avg = median(Fix8, 'all')
Science8Crop(x8,y8) = Fix8Avg;

[x9, y9] = find(Science9Crop == max(Science9Crop, [], 'all'));
Fix9 = Science9Crop(y9-1:y9+1, x9-1:x9+1)
Fix9Avg = median(Fix9, 'all')
Science9Crop(x9,y9) = Fix9Avg;

[x10, y10] = find(Science10Crop == max(Science10Crop, [], 'all'))
Fix10 = Science10Crop(y10-1:y10+1, x10-1:x10+1)
Fix10Avg = median(Fix10, 'all')
Science10Crop(x10,y10) = Fix10Avg;

[x11, y11] = find(Science11Crop == max(Science11Crop, [], 'all'))
Fix11 = Science11Crop(y11-1:y11+1, x11-1:x11+1)
Fix11Avg = median(Fix11, 'all')
Science11Crop(x11,y11) = Fix11Avg;

[x12, y12] = find(Science12Crop == max(Science12Crop, [], 'all'))
Fix12 = Science12Crop(y12-1:y12+1, x12-1:x12+1)
Fix12Avg = median(Fix12, 'all')
Science12Crop(x12,y12) = Fix12Avg;

[x13, y13] = find(Science13Crop == max(Science13Crop, [], 'all'))
Fix13 = Science13Crop(y13-1:y13+1, x13-1:x13+1)
Fix13Avg = median(Fix13, 'all')
Science13Crop(x13,y13) = Fix13Avg;

[x14, y14] = find(Science14Crop == max(Science14Crop, [], 'all'))
Fix14 = Science14Crop(y14-1:y14+1, x14-1:x14+1)
Fix14Avg = median(Fix14, 'all')
Science14Crop(x14,y14) = Fix14Avg;

[x15, y15] = find(Science15Crop == max(Science15Crop, [], 'all'))
Fix15 = Science15Crop(y15-1:y15+1, x15-1:x15+1)
Fix15Avg = median(Fix15, 'all')
Science15Crop(x15,y15) = Fix15Avg;

[x16, y16] = find(Science16Crop == max(Science16Crop, [], 'all'))
Fix16 = Science16Crop(y16-1:y16+1, x16-1:x16+1)
Fix16Avg = median(Fix16, 'all')
Science16Crop(x16,y16) = Fix16Avg;

[x17, y17] = find(Science17Crop == max(Science17Crop, [], 'all'))
Fix17 = Science17Crop(y17-1:y17+1, x17-1:x17+1)
Fix17Avg = median(Fix17, 'all')
Science17Crop(x17,y17) = Fix17Avg;

[x18, y18] = find(Science18Crop == max(Science18Crop, [], 'all'))
Fix18 = Science18Crop(y18-1:y18+1, x18-1:x18+1)
Fix18Avg = median(Fix18, 'all')
Science18Crop(x18,y18) = Fix18Avg;

[x19, y19] = find(Science19Crop == max(Science19Crop, [], 'all'))
Fix19 = Science19Crop(y19-1:y19+1, x19-1:x19+1)
Fix19Avg = median(Fix19, 'all')
Science19Crop(x19,y19) = Fix19Avg;

[x20, y20] = find(Science20Crop == max(Science20Crop, [], 'all'))
Fix20 = Science20Crop(y20-1:y20+1, x20-1:x20+1)
Fix20Avg = median(Fix20, 'all')
Science20Crop(x20,y20) = Fix20Avg;

%Image coadd
%Once all the image sizes are the same (201x201 in this case), they can be
%coadded to process a final image.
ImageCoadd = Science1Crop + Science2Crop + Science3Crop + Science4Crop + Science5Crop + Science6Crop + Science7Crop + Science8Crop + Science9Crop + Science10Crop + Science11Crop + Science12Crop + Science13Crop + Science14Crop + Science15Crop + Science16Crop + Science17Crop + Science18Crop + Science19Crop + Science20Crop;
 
%Dead pixel fixing
%This process fixes dead pixels which propagated across the alignment
%process, and can be configured to account for the number of dead pixels
%present in the final image. In this case there were 12 dead pixels present
%the final image, so the second value in the for loop is 12
for s = 1:12
    [x, y] = find(ImageCoadd == min(ImageCoadd, [], 'all'))
    FixLoop = ImageCoadd(y-1:y+1, x-1:x+1);
    FixMed = median(FixLoop,'all');
    ImageCoadd(x,y) = FixMed;
end

%Adjusts final image to work properly in later MATLAB code
ScienceFin = flip(imrotate(ImageCoadd, 90));

%Prints final image for checking purposes
imagesc(ScienceFin); colorbar();
set(gca, 'ColorScale', 'log');

%Writes to .fit file
fitswrite(ScienceFin, 'Proper Image Masters\ScienceFin.fit');
