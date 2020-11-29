%Writer: Austen Fourkas | UMD Astronomy | Team Rocket

%Flat imports
%Import .fit files from library
Flat1 = rfits('P Flats\flats-001-i.fit');
Flat2 = rfits('P Flats\flats-002-i.fit');
Flat3 = rfits('P Flats\flats-003-i.fit');
Flat4 = rfits('P Flats\flats-004-i.fit');
Flat5 = rfits('P Flats\flats-005-i.fit');
Flat6 = rfits('P Flats\flats-006-i.fit');
Flat7 = rfits('P Flats\flats-007-i.fit');
Flat8 = rfits('P Flats\flats-008-i.fit');
Flat9 = rfits('P Flats\flats-009-i.fit');
Flat10 = rfits('P Flats\flats-010-i.fit');
Flat11 = rfits('P Flats\flats-011-i.fit');
Flat12 = rfits('P Flats\flats-012-i.fit');
Flat13 = rfits('P Flats\flats-013-i.fit');
Flat14 = rfits('P Flats\flats-014-i.fit');
Flat15 = rfits('P Flats\flats-015-i.fit');
Flat16 = rfits('P Flats\flats-016-i.fit');
Flat17 = rfits('P Flats\flats-017-i.fit');
MasterDark = rfits('Proper Image Masters\PMasterDark.fit');
MasterBias = rfits('Proper Image Masters\PMasterDark.fit');


%Data imports
%Pulls 'data' array out of .fit files, which contains the pixel data needed
%for calibration
Flat1data = Flat1.data;
Flat2data = Flat2.data;
Flat3data = Flat3.data;
Flat4data = Flat4.data;
Flat5data = Flat5.data;
Flat6data = Flat6.data;
Flat7data = Flat7.data;
Flat8data = Flat8.data;
Flat9data = Flat9.data;
Flat10data = Flat10.data;
Flat11data = Flat11.data;
Flat12data = Flat12.data;
Flat13data = Flat13.data;
Flat14data = Flat14.data;
Flat15data = Flat15.data;
Flat16data = Flat16.data;
Flat17data = Flat17.data;
MasterDarkdata = imrotate(MasterDark.data, 90);
MasterBiasdata = imrotate(MasterBias.data, 90);

%Subtracts
%Performs additive noise correction for flat images. The 1/300 prefactor to
%the master dark data is the ratio of the flat image exposure time to the
%dark image exposure time
Flat1Sub = Flat1data-(((1/300)*MasterDarkdata)+MasterBiasdata);
Flat2Sub = Flat2data-(((1/300)*MasterDarkdata)+MasterBiasdata);
Flat3Sub = Flat3data-(((1/300)*MasterDarkdata)+MasterBiasdata);
Flat4Sub = Flat4data-(((1/300)*MasterDarkdata)+MasterBiasdata);
Flat5Sub = Flat5data-(((1/300)*MasterDarkdata)+MasterBiasdata);
Flat6Sub = Flat6data-(((1/300)*MasterDarkdata)+MasterBiasdata);
Flat7Sub = Flat7data-(((1/300)*MasterDarkdata)+MasterBiasdata);
Flat8Sub = Flat8data-(((1/300)*MasterDarkdata)+MasterBiasdata);
Flat9Sub = Flat9data-(((1/300)*MasterDarkdata)+MasterBiasdata);
Flat10Sub = Flat10data-(((1/300)*MasterDarkdata)+MasterBiasdata);
Flat11Sub = Flat11data-(((1/300)*MasterDarkdata)+MasterBiasdata);
Flat12Sub = Flat12data-(((1/300)*MasterDarkdata)+MasterBiasdata);
Flat13Sub = Flat13data-(((1/300)*MasterDarkdata)+MasterBiasdata);
Flat14Sub = Flat14data-(((1/300)*MasterDarkdata)+MasterBiasdata);
Flat15Sub = Flat15data-(((1/300)*MasterDarkdata)+MasterBiasdata);
Flat16Sub = Flat16data-(((1/300)*MasterDarkdata)+MasterBiasdata);
Flat17Sub = Flat17data-(((1/300)*MasterDarkdata)+MasterBiasdata);

%Averages
%Divides each noise corrected flat by the mode of itself in order to
%normalize properly
Flat1Norm = Flat1Sub/mode(Flat1Sub, 'all');
Flat2Norm = Flat2Sub/mode(Flat2Sub, 'all');
Flat3Norm = Flat3Sub/mode(Flat3Sub, 'all');
Flat4Norm = Flat4Sub/mode(Flat4Sub, 'all');
Flat5Norm = Flat5Sub/mode(Flat5Sub, 'all');
Flat6Norm = Flat6Sub/mode(Flat6Sub, 'all');
Flat7Norm = Flat7Sub/mode(Flat7Sub, 'all');
Flat8Norm = Flat8Sub/mode(Flat8Sub, 'all');
Flat9Norm = Flat9Sub/mode(Flat9Sub, 'all');
Flat10Norm = Flat10Sub/mode(Flat10Sub, 'all');
Flat11Norm = Flat11Sub/mode(Flat11Sub, 'all');
Flat12Norm = Flat12Sub/mode(Flat12Sub, 'all');
Flat13Norm = Flat13Sub/mode(Flat13Sub, 'all');
Flat14Norm = Flat14Sub/mode(Flat14Sub, 'all');
Flat15Norm = Flat15Sub/mode(Flat15Sub, 'all');
Flat16Norm = Flat16Sub/mode(Flat16Sub, 'all');
Flat17Norm = Flat17Sub/mode(Flat17Sub, 'all');

%Dead pixel fix
%Locates dead pixels in each flat image and corrects them by taking the
%average of the 8 surrounding pixels. This can be made automatic with a
%while loop (while min(data(s), [], 'all') < ~~~, keep correcting pixels)
Dead11 = Flat1Norm(1714:1718, 514:519);
Dead1Avg1 = median(Dead11, 'all');
Flat1Norm(1716, 515:518) = Dead1Avg1;
Dead12 = Flat1Norm(1702:1706, 286:290);
Dead1Avg2 = median(Dead12, 'all');
Flat1Norm(1704, 287:289) = Dead1Avg2;
Dead13 = Flat1Norm(1335:1337, 621:623);
Dead1Avg3 = median(Dead13, 'all');
Flat1Norm(1336, 622) = Dead1Avg3;

Dead11 = Flat2Norm(1714:1718, 514:519);
Dead1Avg1 = median(Dead11, 'all');
Flat2Norm(1716, 515:518) = Dead1Avg1;
Dead12 = Flat2Norm(1702:1706, 286:290);
Dead1Avg2 = median(Dead12, 'all');
Flat2Norm(1704, 287:289) = Dead1Avg2;
Dead13 = Flat2Norm(1335:1337, 621:623);
Dead1Avg3 = median(Dead13, 'all');
Flat2Norm(1336, 622) = Dead1Avg3;

Dead11 = Flat3Norm(1714:1718, 514:519);
Dead1Avg1 = median(Dead11, 'all');
Flat3Norm(1716, 515:518) = Dead1Avg1;
Dead12 = Flat3Norm(1702:1706, 286:290);
Dead1Avg2 = median(Dead12, 'all');
Flat3Norm(1704, 287:289) = Dead1Avg2;
Dead13 = Flat3Norm(1335:1337, 621:623);
Dead1Avg3 = median(Dead13, 'all');
Flat3Norm(1336, 622) = Dead1Avg3;

Dead11 = Flat4Norm(1714:1718, 514:519);
Dead1Avg1 = median(Dead11, 'all');
Flat4Norm(1716, 515:518) = Dead1Avg1;
Dead12 = Flat4Norm(1702:1706, 286:290);
Dead1Avg2 = median(Dead12, 'all');
Flat4Norm(1704, 287:289) = Dead1Avg2;
Dead13 = Flat4Norm(1335:1337, 621:623);
Dead1Avg3 = median(Dead13, 'all');
Flat4Norm(1336, 622) = Dead1Avg3;

Dead11 = Flat5Norm(1714:1718, 514:519);
Dead1Avg1 = median(Dead11, 'all');
Flat5Norm(1716, 515:518) = Dead1Avg1;
Dead12 = Flat5Norm(1702:1706, 286:290);
Dead1Avg2 = median(Dead12, 'all');
Flat5Norm(1704, 287:289) = Dead1Avg2;
Dead13 = Flat5Norm(1335:1337, 621:623);
Dead1Avg3 = median(Dead13, 'all');
Flat5Norm(1336, 622) = Dead1Avg3;

Dead11 = Flat6Norm(1714:1718, 514:519);
Dead1Avg1 = median(Dead11, 'all');
Flat6Norm(1716, 515:518) = Dead1Avg1;
Dead12 = Flat6Norm(1702:1706, 286:290);
Dead1Avg2 = median(Dead12, 'all');
Flat6Norm(1704, 287:289) = Dead1Avg2;
Dead13 = Flat6Norm(1335:1337, 621:623);
Dead1Avg3 = median(Dead13, 'all');
Flat6Norm(1336, 622) = Dead1Avg3;

Dead11 = Flat7Norm(1714:1718, 514:519);
Dead1Avg1 = median(Dead11, 'all');
Flat7Norm(1716, 515:518) = Dead1Avg1;
Dead12 = Flat7Norm(1702:1706, 286:290);
Dead1Avg2 = median(Dead12, 'all');
Flat7Norm(1704, 287:289) = Dead1Avg2;
Dead13 = Flat7Norm(1335:1337, 621:623);
Dead1Avg3 = median(Dead13, 'all');
Flat7Norm(1336, 622) = Dead1Avg3;

Dead11 = Flat8Norm(1714:1718, 514:519);
Dead1Avg1 = median(Dead11, 'all');
Flat8Norm(1716, 515:518) = Dead1Avg1;
Dead12 = Flat8Norm(1702:1706, 286:290);
Dead1Avg2 = median(Dead12, 'all');
Flat8Norm(1704, 287:289) = Dead1Avg2;
Dead13 = Flat8Norm(1335:1337, 621:623);
Dead1Avg3 = median(Dead13, 'all');
Flat8Norm(1336, 622) = Dead1Avg3;

Dead11 = Flat9Norm(1714:1718, 514:519);
Dead1Avg1 = median(Dead11, 'all');
Flat9Norm(1716, 515:518) = Dead1Avg1;
Dead12 = Flat9Norm(1702:1706, 286:290);
Dead1Avg2 = median(Dead12, 'all');
Flat9Norm(1704, 287:289) = Dead1Avg2;
Dead13 = Flat9Norm(1335:1337, 621:623);
Dead1Avg3 = median(Dead13, 'all');
Flat9Norm(1336, 622) = Dead1Avg3;

Dead11 = Flat10Norm(1714:1718, 514:519);
Dead1Avg1 = median(Dead11, 'all');
Flat10Norm(1716, 515:518) = Dead1Avg1;
Dead12 = Flat10Norm(1702:1706, 286:290);
Dead1Avg2 = median(Dead12, 'all');
Flat10Norm(1704, 287:289) = Dead1Avg2;
Dead13 = Flat10Norm(1335:1337, 621:623);
Dead1Avg3 = median(Dead13, 'all');
Flat10Norm(1336, 622) = Dead1Avg3;

Dead11 = Flat11Norm(1714:1718, 514:519);
Dead1Avg1 = median(Dead11, 'all');
Flat11Norm(1716, 515:518) = Dead1Avg1;
Dead12 = Flat11Norm(1702:1706, 286:290);
Dead1Avg2 = median(Dead12, 'all');
Flat11Norm(1704, 287:289) = Dead1Avg2;
Dead13 = Flat11Norm(1335:1337, 621:623);
Dead1Avg3 = median(Dead13, 'all');
Flat11Norm(1336, 622) = Dead1Avg3;

Dead11 = Flat12Norm(1714:1718, 514:519);
Dead1Avg1 = median(Dead11, 'all');
Flat12Norm(1716, 515:518) = Dead1Avg1;
Dead12 = Flat12Norm(1702:1706, 286:290);
Dead1Avg2 = median(Dead12, 'all');
Flat12Norm(1704, 287:289) = Dead1Avg2;
Dead13 = Flat12Norm(1335:1337, 621:623);
Dead1Avg3 = median(Dead13, 'all');
Flat12Norm(1336, 622) = Dead1Avg3;

Dead11 = Flat13Norm(1714:1718, 514:519);
Dead1Avg1 = median(Dead11, 'all');
Flat13Norm(1716, 515:518) = Dead1Avg1;
Dead12 = Flat13Norm(1702:1706, 286:290);
Dead1Avg2 = median(Dead12, 'all');
Flat13Norm(1704, 287:289) = Dead1Avg2;
Dead13 = Flat13Norm(1335:1337, 621:623);
Dead1Avg3 = median(Dead13, 'all');
Flat13Norm(1336, 622) = Dead1Avg3;

Dead11 = Flat14Norm(1714:1718, 514:519);
Dead1Avg1 = median(Dead11, 'all');
Flat14Norm(1716, 515:518) = Dead1Avg1;
Dead12 = Flat14Norm(1702:1706, 286:290);
Dead1Avg2 = median(Dead12, 'all');
Flat14Norm(1704, 287:289) = Dead1Avg2;
Dead13 = Flat14Norm(1335:1337, 621:623);
Dead1Avg3 = median(Dead13, 'all');
Flat14Norm(1336, 622) = Dead1Avg3;

Dead11 = Flat15Norm(1714:1718, 514:519);
Dead1Avg1 = median(Dead11, 'all');
Flat15Norm(1716, 515:518) = Dead1Avg1;
Dead12 = Flat15Norm(1702:1706, 286:290);
Dead1Avg2 = median(Dead12, 'all');
Flat15Norm(1704, 287:289) = Dead1Avg2;
Dead13 = Flat15Norm(1335:1337, 621:623);
Dead1Avg3 = median(Dead13, 'all');
Flat15Norm(1336, 622) = Dead1Avg3;

Dead11 = Flat16Norm(1714:1718, 514:519);
Dead1Avg1 = median(Dead11, 'all');
Flat16Norm(1716, 515:518) = Dead1Avg1;
Dead12 = Flat16Norm(1702:1706, 286:290);
Dead1Avg2 = median(Dead12, 'all');
Flat16Norm(1704, 287:289) = Dead1Avg2;
Dead13 = Flat16Norm(1335:1337, 621:623);
Dead1Avg3 = median(Dead13, 'all');
Flat16Norm(1336, 622) = Dead1Avg3;

Dead11 = Flat17Norm(1714:1718, 514:519);
Dead1Avg1 = median(Dead11, 'all');
Flat17Norm(1716, 515:518) = Dead1Avg1;
Dead12 = Flat17Norm(1702:1706, 286:290);
Dead1Avg2 = median(Dead12, 'all');
Flat17Norm(1704, 287:289) = Dead1Avg2;
Dead13 = Flat17Norm(1335:1337, 621:623);
Dead1Avg3 = median(Dead13, 'all');
Flat17Norm(1336, 622) = Dead1Avg3;

%MD array
%Compiles data arrays into a 3D matrix so that the median value can be
%found across the 3rd dimension
FlatFin(:,:,1) = Flat1Norm;
FlatFin(:,:,2) = Flat2Norm;
FlatFin(:,:,3) = Flat3Norm;
FlatFin(:,:,4) = Flat4Norm;
FlatFin(:,:,5) = Flat5Norm;
FlatFin(:,:,6) = Flat6Norm;
FlatFin(:,:,7) = Flat7Norm;
FlatFin(:,:,8) = Flat8Norm;
FlatFin(:,:,9) = Flat9Norm;
FlatFin(:,:,10) = Flat10Norm;
FlatFin(:,:,11) = Flat11Norm;
FlatFin(:,:,12) = Flat12Norm;
FlatFin(:,:,13) = Flat13Norm;
FlatFin(:,:,14) = Flat14Norm;
FlatFin(:,:,15) = Flat15Norm;
FlatFin(:,:,16) = Flat16Norm;
FlatFin(:,:,17) = Flat17Norm;

%Median
%Finds the median across the 3rd dimension of the previously made matrix
%and rarranges data so that later imports format properly in MATLAB
FlatMed = flip(imrotate(median(FlatFin, 3), 180));

%Variables
%Maximum and minimum of final image used for figure below
Min = min(FlatMed, [], 'all');
Max = max(FlatMed, [], 'all');

%Flat plot
figure(1)
imagesc(FlatMed, [Min, Max]); colorbar();
set(gca,'ColorScale','log');

%Flat FITS write
%Writes the final image to a .fit file for later use
fitswrite(FlatMed, 'Proper Image Masters\PMasterFlat.fit');







