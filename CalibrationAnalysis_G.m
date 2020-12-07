%Project One - Sloan g Filter Calibration and Analysis
%Primary Author - Morgan Craver
%
%This code will do a combination of things:
%First, it will create "Master" calibration images from raw flat, bias, and 
%dark images in order to make calibrating filtered images of NGC 7662 
%easier and more accurate.  
%Secondly, it will calibrate the Master g' image via the Master flat,
%bias, and dark calibation images to get a True g' filter image and plot
%this True image.
%Third, it will read out the ADU values and the error for this value using
%the aperE function.
%------------------------------------------------------------------------

%Data and Arguments:this portion of the code will import fits files of the
%flats, biases, darks, and g' science images and convert their data into
%arrays which can be further manipulated by MatLab, as well as create
%median images which will be combined to make the master calibration
%images.
        
     %October 17th Data and Arguments:
        %Flats Data and Arguments:
        flats001g1017 = rfits('1017flats-001-g.fit');   %importing flat fits files
        flats002g1017 = rfits('1017flats-002-g.fit');
        flats003g1017 = rfits('1017flats-003-g.fit');
        flats004g1017 = rfits('1017flats-004-g.fit');
        flats005g1017 = rfits('1017flats-005-g.fit');
        flats006g1017 = rfits('1017flats-006-g.fit');
        flats007g1017 = rfits('1017flats-007-g.fit');
        flats008g1017 = rfits('1017flats-008-g.fit');
        flats009g1017 = rfits('1017flats-009-g.fit');
        flats010g1017 = rfits('1017flats-010-g.fit');
        flats011g1017 = rfits('1017flats-011-g.fit');
        flats012g1017 = rfits('1017flats-012-g.fit');
        flats013g1017 = rfits('1017flats-013-g.fit');
        flats014g1017 = rfits('1017flats-014-g.fit');
        flats015g1017 = rfits('1017flats-015-g.fit');
        flats016g1017 = rfits('1017flats-016-g.fit');
        flats017g1017 = rfits('1017flats-017-g.fit');
        
        flat001_1017data = flats001g1017.data;  %Making the imported flats images into data arrays
        flat002_1017data = flats002g1017.data;
        flat003_1017data = flats003g1017.data;
        flat004_1017data = flats004g1017.data;
        flat005_1017data = flats005g1017.data;
        flat006_1017data = flats006g1017.data;
        flat007_1017data = flats007g1017.data;
        flat008_1017data = flats008g1017.data;
        flat009_1017data = flats009g1017.data;
        flat010_1017data = flats010g1017.data;
        flat011_1017data = flats011g1017.data;
        flat012_1017data = flats012g1017.data;
        flat013_1017data = flats013g1017.data;
        flat014_1017data = flats014g1017.data;
        flat015_1017data = flats015g1017.data;
        flat016_1017data = flats016g1017.data;
        flat017_1017data = flats017g1017.data;
        
        FlatFin1017(:,:,1) = flat001_1017data;  %Creating median flat images
        FlatFin1017(:,:,2) = flat002_1017data;
        FlatFin1017(:,:,3) = flat003_1017data;
        FlatFin1017(:,:,4) = flat004_1017data;
        FlatFin1017(:,:,5) = flat005_1017data;
        FlatFin1017(:,:,6) = flat006_1017data;
        FlatFin1017(:,:,7) = flat007_1017data;
        FlatFin1017(:,:,8) = flat008_1017data;
        FlatFin1017(:,:,9) = flat009_1017data;
        FlatFin1017(:,:,10) = flat010_1017data;
        FlatFin1017(:,:,11) = flat011_1017data;
        FlatFin1017(:,:,12) = flat012_1017data;
        FlatFin1017(:,:,13) = flat013_1017data;
        FlatFin1017(:,:,14) = flat014_1017data;
        FlatFin1017(:,:,15) = flat015_1017data;
        FlatFin1017(:,:,16) = flat016_1017data;
        FlatFin1017(:,:,17) = flat017_1017data;
        
        %Biases Data and Arguments:
        calib001bi1017 = rfits('1017calib-001-bi.fit'); %Importing bias fits images
        calib002bi1017 = rfits('1017calib-002-bi.fit');
        calib003bi1017 = rfits('1017calib-003-bi.fit');
        calib004bi1017 = rfits('1017calib-004-bi.fit');
        calib005bi1017 = rfits('1017calib-005-bi.fit');
        calib006bi1017 = rfits('1017calib-006-bi.fit');
        calib007bi1017 = rfits('1017calib-007-bi.fit');
        calib008bi1017 = rfits('1017calib-008-bi.fit');
        calib009bi1017 = rfits('1017calib-009-bi.fit');
        calib010bi1017 = rfits('1017calib-010-bi.fit');
        
        b001_1017data = calib001bi1017.data;    %Making the bias fits images into data arrays
        b002_1017data = calib002bi1017.data;
        b003_1017data = calib003bi1017.data;
        b004_1017data = calib004bi1017.data;
        b005_1017data = calib005bi1017.data;
        b006_1017data = calib006bi1017.data;
        b007_1017data = calib007bi1017.data;
        b008_1017data = calib008bi1017.data;
        b009_1017data = calib009bi1017.data;
        b010_1017data = calib010bi1017.data;
        
        BiasFin1017(:,:,1) = b001_1017data; %Creating median bias images
        BiasFin1017(:,:,1) = b002_1017data;
        BiasFin1017(:,:,1) = b003_1017data;
        BiasFin1017(:,:,1) = b004_1017data;
        BiasFin1017(:,:,1) = b005_1017data;
        BiasFin1017(:,:,1) = b006_1017data;
        BiasFin1017(:,:,1) = b007_1017data;
        BiasFin1017(:,:,1) = b008_1017data;
        BiasFin1017(:,:,1) = b009_1017data;
        BiasFin1017(:,:,1) = b010_1017data;
        
        %Master Bias: this section will create a "master bias" that will be used to 
%calibrate the science image, see Master Flat section for individual line
%explanations;
    %October 17th Master Bias:
    MB_1017 = median(BiasFin1017,3);
        size(MB_1017)
    MB_1017_min = min(MB_1017, [], 'all');
    MB_1017_max = max(MB_1017, [], 'all');
    
    figure(1);
    imagesc(MB_1017, [MB_1017_min, MB_1017_max]); colorbar();
    colormap('turbo');
    set(gca,'ColorScale','log');
    title('g-Filter Master Bias'); 
    
    %b1017 Download:
    fitswrite(MB_1017, 'b1017.fit')
    
    b1017 = rfits('b1017.fit');
    b1017data = b1017.data;
    b1017 = flip(imrotate(median(b1017data, 3), 180));
        
        %Darks Data and Arguments:
        calib001d1017 = rfits('1017calib-001-d.fit');   %Importing dark fits images
        calib002d1017 = rfits('1017calib-002-d.fit');
        calib003d1017 = rfits('1017calib-003-d.fit');
        calib004d1017 = rfits('1017calib-004-d.fit');
        calib005d1017 = rfits('1017calib-005-d.fit');
        calib006d1017 = rfits('1017calib-006-d.fit');
        calib007d1017 = rfits('1017calib-007-d.fit');
        calib008d1017 = rfits('1017calib-008-d.fit');
        calib009d1017 = rfits('1017calib-009-d.fit');
        calib010d1017 = rfits('1017calib-010-d.fit');
        
        d001_1017data = calib001d1017.data-b001_1017data; %Making the dark fits images into data arrays;
        d002_1017data = calib002d1017.data-b002_1017data;
        d003_1017data = calib003d1017.data-b003_1017data;
        d004_1017data = calib004d1017.data-b004_1017data;
        d005_1017data = calib005d1017.data-b005_1017data;
        d006_1017data = calib006d1017.data-b006_1017data;
        d007_1017data = calib007d1017.data-b007_1017data;
        d008_1017data = calib008d1017.data-b008_1017data;
        d009_1017data = calib009d1017.data-b009_1017data;
        d010_1017data = calib010d1017.data-b010_1017data;
        
        DarkFin1017(:,:,1) = d001_1017data; %Creating median dark images 
        DarkFin1017(:,:,2) = d002_1017data;
        DarkFin1017(:,:,3) = d003_1017data;
        DarkFin1017(:,:,4) = d004_1017data;
        DarkFin1017(:,:,5) = d005_1017data;
        DarkFin1017(:,:,6) = d006_1017data;
        DarkFin1017(:,:,7) = d007_1017data;
        DarkFin1017(:,:,8) = d008_1017data;
        DarkFin1017(:,:,9) = d009_1017data;
        DarkFin1017(:,:,10) = d010_1017data;
        
        
        %g' Filter Data and Arguments:
        NGC7662_001g1017 = rfits('7662-001-g.fit'); %Importing the raw science images in the g' filter
        %NGC7662_002g1017 = rfits('7662-002-g.fit');
        NGC7662_003g1017 = rfits('7662-003-g.fit');
        NGC7662_004g1017 = rfits('7662-004-g.fit');
        NGC7662_005g1017 = rfits('7662-005-g.fit');
        NGC7662_006g1017 = rfits('7662-006-g.fit');
        NGC7662_007g1017 = rfits('7662-007-g.fit');
        NGC7662_008g1017 = rfits('7662-008-g.fit');
        NGC7662_009g1017 = rfits('7662-009-g.fit');
        NGC7662_010g1017 = rfits('7662-010-g.fit');
        NGC7662_011g1017 = rfits('7662-011-g.fit');
        NGC7662_012g1017 = rfits('7662-012-g.fit');
        NGC7662_013g1017 = rfits('7662-013-g.fit');
        NGC7662_014g1017 = rfits('7662-014-g.fit');
        NGC7662_015g1017 = rfits('7662-015-g.fit');
        NGC7662_016g1017 = rfits('7662-016-g.fit');
        NGC7662_017g1017 = rfits('7662-017-g.fit');
        NGC7662_018g1017 = rfits('7662-018-g.fit');
        NGC7662_019g1017 = rfits('7662-019-g.fit');
        NGC7662_020g1017 = rfits('7662-020-g.fit');
        
        g001_1017data = NGC7662_001g1017.data;  %Converting the g' fits images into data arrays
        %g002_1017data = NGC7662_002g1017.data;
        g003_1017data = NGC7662_003g1017.data;
        g004_1017data = NGC7662_004g1017.data;
        g005_1017data = NGC7662_005g1017.data;
        g006_1017data = NGC7662_006g1017.data;
        g007_1017data = NGC7662_007g1017.data;
        g008_1017data = NGC7662_008g1017.data;
        g009_1017data = NGC7662_009g1017.data;
        g010_1017data = NGC7662_010g1017.data;
        g011_1017data = NGC7662_011g1017.data;
        g012_1017data = NGC7662_012g1017.data;
        g013_1017data = NGC7662_013g1017.data;
        g014_1017data = NGC7662_014g1017.data;
        g015_1017data = NGC7662_015g1017.data;
        g016_1017data = NGC7662_016g1017.data;
        g017_1017data = NGC7662_017g1017.data;
        g018_1017data = NGC7662_018g1017.data;
        g019_1017data = NGC7662_019g1017.data;
        g020_1017data = NGC7662_020g1017.data;
        
%October 17 Image Cropping: this portion of the code will crop the science
%images into new 200x200 pixel images.    
    %xlength = 200, ylength = 200
    g001Crop = g001_1017data(950:1150, 748:948);   %Choosing pixel coordinates for the raw science images to be cropped around
    g003Crop = g003_1017data(964:1164, 689:889);
    g004Crop = g004_1017data(955:1155, 687:887);
    g005Crop = g005_1017data(946:1146, 687:887);
    g006Crop = g006_1017data(940:1140, 689:889);
    g007Crop = g007_1017data(938:1138, 699:899);
    g008Crop = g008_1017data(936:1136, 698:898);
    g009Crop = g009_1017data(935:1135, 692:892);
    g010Crop = g010_1017data(931:1131, 686:886);
    g011Crop = g011_1017data(932:1132, 676:876);
    g012Crop = g012_1017data(933:1133, 680:880);
    g013Crop = g013_1017data(935:1135, 672:872);
    g014Crop = g014_1017data(947:1147, 655:855);
    g015Crop = g015_1017data(957:1157, 637:837);
    g016Crop = g016_1017data(962:1162, 619:819);
    g017Crop = g017_1017data(971:1171, 602:802);
    g018Crop = g018_1017data(978:1178, 586:786);
    g019Crop = g019_1017data(984:1184, 571:771);
    g020Crop = g020_1017data(990:1190, 557:757);
    
%Master Flat: this section will create a "master flat" that will be used to 
%calibrate the science image. 
    %October 17th Master Flat:
    MF_1017 = median(FlatFin1017,3);    %Median combining the flat images
        size(MF_1017)
    MF_1017_min = min(MF_1017, [], 'all')  %Selecting minimum flat ADU value for colorbar on plot
    MF_1017_max = max(MF_1017, [], 'all')  %Selecting maximum flat ADU value for colorbar on plot
    
    figure(2);      %Creating a figure for the final median flat image.
    imagesc(MF_1017, [6000, 10000]); colorbar();   %Creating a colorbar with a logarithimic scale
    colormap('turbo');
    set(gca,'ColorScale','log');
    title('Master Flat Image Through g` [10/17]');  %Creating a plot title
    
    %f1017 Download: this scetion downloads the final median-combined (m-c) flat
    %image to the current MatLab folder
    fitswrite(MF_1017, 'f1017.fit')
    
    f1017 = rfits('f1017.fit'); %Re-importing the new m-c flat image fits file
    f1017data = f1017.data;     %Creating a data array of the m-c flat image file
    f1017 = flip(imrotate(median(f1017data, 3), 180));  %Flipping the array 180 degrees because MatLab likes to rotate/flip fits images
    
    
%Master Dark: this section will create a "master dark" that will be used to 
%calibrate the science image (procedure follows the previous section, see Master Flat section for individual line
%explanations)
    %October 17th Master Dark:
    MD_1017 = median(DarkFin1017,3);
        size(MD_1017)
    MD_1017_min = min(MD_1017, [], 'all');
    MD_1017_max = max(MD_1017, [], 'all');
    
    figure(3);
    imagesc(MD_1017, [MD_1017_min, MD_1017_max]); colorbar();
    colormap('turbo');
    set(gca,'ColorScale','log');
    title('g-Filter Master Dark'); 
    
    %d1017 Download:
    fitswrite(MD_1017, 'd1017.fit')
    
    d1017 = rfits('d1017.fit');
    d1017data = d1017.data;
    d1017 = flip(imrotate(median(d1017data, 3), 180));
    
%Master g' Filter Image (Science Image):this section will create a "master
%science image" that will be calibrated.
    %October 17th Master g':
    Mg_1017_CoAdd = g001_1017data+g003_1017data+g004_1017data+g005_1017data+g006_1017data+g007_1017data+g008_1017data+g009_1017data+g010_1017data+g011_1017data+g012_1017data+g013_1017data+g014_1017data+g015_1017data+g016_1017data+g017_1017data+g018_1017data+g019_1017data+g020_1017data;
    %Coadding the cropped images
    Mg_1017_min = min(Mg_1017_CoAdd, [], 'all');    %Selecting minimum g' ADU value for colorbar on plot 
    Mg_1017_max = max(Mg_1017_CoAdd, [], 'all');    %Selecting maximum flat ADU value for colorbar on plot
    
    figure(4);  %Creating a plot of the co-added cropped science images
    imagesc(Mg_1017_CoAdd, [Mg_1017_min, Mg_1017_max]); colorbar(); %Creating a colorbar for the plot with a logarithmic scale
    colormap('turbo');
    set(gca,'ColorScale','log');
    title('g-Filter CoAdd');    %Creating a title for the plot
    
    %g1017 Download: this section downloads the co-added cropped g' images
    %as a fits file.
    fitswrite(Mg_1017_CoAdd, 'g1017.fit')
    
    g1017 = rfits('g1017.fit'); %Re-imports the downloaded fits file.
    g1017data = g1017.data;
    
%Calibration g_1017: this section details the calibration process.
    %Numerical Values for Exposures are same for both Dates
    gExp = (NGC7662_001g1017.exposure); %Defining the exposure time of the g' images
    DarkExp = (calib001d1017.exposure); %Defining the exposure time of the dark images
    FlatExp = (flats001g1017.exposure); %Defining the exposure time of the flat images
    gR = gExp/DarkExp;  %Creating a ratio factor with the g' and dark exposure times
    F = MF_1017 - (MB_1017+MD_1017);    %Calibrating the master flat with the master bias and master dark

    %October 17th Calibration:
    Dark1017Argment = d1017data*gR; %Creating an argument for the dark image
    g1017SDSubtract = g1017data-Dark1017Argment; %numerator

    gFAvg = mean(f1017data, 'all'); %average;
    gFNorm = f1017data/gFAvg; %normalized, denominator;

    gFin = g1017SDSubtract./gFNorm; %final calibrated science image
    
    figure(5);  %Creating a figure for this image
    imagesc(gFin, [1020, 5000]); colorbar();
    colormap ('turbo');
    set(gca, 'ColorScale', 'log');
    title('g-Filter Calibrated');
   
%October 17th g-Calibrated Image Shifting: this section takes the cropped
%images and shifts them to a central point so that all of the nebulae in
%the images will be stacked on top of each other.
    x_center = 100; %Where we want the center pixel of the image to be, accounting for neighboring star's distance from nebula;
    y_center = 100;
    
    imagesc(g001Crop)   %This section indicates the image shifting process 
    %by subtracting the center of the nebula (chosen by the user) from the center desired.  
    %This process is repeated for each of the 19 used science images.
    set(gca, 'ColorScale', 'log');
    [x001, y001] = ginput(1)
    Diffx001 = x001-x_center;
    Diffy001 = y001-y_center;
    Nrow001 = round(Diffx001);
    Ncol001 = round(Diffy001);
    imr001 = imshift(g001Crop, Nrow001, Ncol001);
 
    imagesc(g003Crop)
    set(gca, 'ColorScale', 'log');
    [x003, y003] = ginput(1)
    Diffx003 = x003-x_center;
    Diffy003 = y003-y_center;
    Nrow003 = round(Diffx003);
    Ncol003 = round(Diffy003);
    imr003 = imshift(g003Crop, Nrow003, Ncol003);

    imagesc(g004Crop)
    set(gca, 'ColorScale', 'log');
    [x004, y004] = ginput(1)
    Diffx004 = x004-x_center;
    Diffy004 = y004-y_center;
    Nrow004 = round(Diffx004);
    Ncol004 = round(Diffy004);
    imr004 = imshift(g004Crop, Nrow004, Ncol004);
    
    imagesc(g005Crop)
    set(gca, 'ColorScale', 'log');
    [x005, y005] = ginput(1)
    Diffx005 = x005-x_center;
    Diffy005 = y005-y_center;
    Nrow005 = round(Diffx005);
    Ncol005 = round(Diffy005);
    imr005 = imshift(g005Crop, Nrow005, Ncol005);
    
    imagesc(g006Crop)
    set(gca, 'ColorScale', 'log');
    [x006, y006] = ginput(1)
    Diffx006 = x006-x_center;
    Diffy006 = y006-y_center;
    Nrow006 = round(Diffx006);
    Ncol006 = round(Diffy006);
    imr006 = imshift(g006Crop, Nrow006, Ncol006);

    imagesc(g007Crop)
    set(gca, 'ColorScale', 'log');
    [x007, y007] = ginput(1)
    Diffx007 = x007-x_center;
    Diffy007 = y007-y_center;
    Nrow007 = round(Diffx007);
    Ncol007 = round(Diffy007);
    imr007 = imshift(g007Crop, Nrow007, Ncol007);

    imagesc(g008Crop)
    set(gca, 'ColorScale', 'log');
    [x008, y008] = ginput(1)
    Diffx008 = x008-x_center;
    Diffy008 = y008-y_center;
    Nrow008 = round(Diffx008);
    Ncol008 = round(Diffy008);
    imr008 = imshift(g008Crop, Nrow008, Ncol008);
    
    imagesc(g009Crop)
    set(gca, 'ColorScale', 'log');
    [x009, y009] = ginput(1)
    Diffx009 = x009-x_center;
    Diffy009 = y009-y_center;
    Nrow009 = round(Diffx009);
    Ncol009 = round(Diffy009);
    imr009 = imshift(g009Crop, Nrow009, Ncol009);
    
    imagesc(g010Crop)
    set(gca, 'ColorScale', 'log');
    [x010, y010] = ginput(1)
    Diffx010 = x010-x_center;
    Diffy010 = y010-y_center;
    Nrow010 = round(Diffx010);
    Ncol010 = round(Diffy010);
    imr010 = imshift(g010Crop, Nrow010, Ncol010);
    
    imagesc(g011Crop)
    set(gca, 'ColorScale', 'log');
    [x011, y011] = ginput(1)
    Diffx011 = x011-x_center;
    Diffy011 = y011-y_center;
    Nrow011 = round(Diffx011);
    Ncol011 = round(Diffy011);
    imr011 = imshift(g011Crop, Nrow011, Ncol011);
    
    imagesc(g012Crop)
    set(gca, 'ColorScale', 'log');
    [x012, y012] = ginput(1)
    Diffx012 = x012-x_center;
    Diffy012 = y012-y_center;
    Nrow012 = round(Diffx012);
    Ncol012 = round(Diffy012);
    imr012 = imshift(g012Crop, Nrow012, Ncol012);
    
    imagesc(g013Crop)
    set(gca, 'ColorScale', 'log');
    [x013, y013] = ginput(1)
    Diffx013 = x013-x_center;
    Diffy013 = y013-y_center;
    Nrow013 = round(Diffx013);
    Ncol013 = round(Diffy013);
    imr013 = imshift(g013Crop, Nrow013, Ncol013);
    
    imagesc(g014Crop)
    set(gca, 'ColorScale', 'log');
    [x014, y014] = ginput(1)
    Diffx014 = x014-x_center;
    Diffy014 = y014-y_center;
    Nrow014 = round(Diffx014);
    Ncol014 = round(Diffy014);
    imr014 = imshift(g014Crop, Nrow014, Ncol014);

    imagesc(g015Crop)
    set(gca, 'ColorScale', 'log');
    [x015, y015] = ginput(1)
    Diffx015 = x015-x_center;
    Diffy015 = y015-y_center;
    Nrow015 = round(Diffx015);
    Ncol015 = round(Diffy015);
    imr015 = imshift(g015Crop, Nrow015, Ncol015);
    
    imagesc(g016Crop)
    set(gca, 'ColorScale', 'log');
    [x016, y016] = ginput(1)
    Diffx016 = x016-x_center;
    Diffy016 = y016-y_center;
    Nrow016 = round(Diffx016);
    Ncol016 = round(Diffy016);
    imr016 = imshift(g016Crop, Nrow016, Ncol016);
    
    imagesc(g017Crop)
    set(gca, 'ColorScale', 'log');
    [x017, y017] = ginput(1)
    Diffx017 = x017-x_center;
    Diffy017 = y017-y_center;
    Nrow017 = round(Diffx017);
    Ncol017 = round(Diffy017);
    imr017 = imshift(g017Crop, Nrow017, Ncol017);
    
    imagesc(g018Crop)
    set(gca, 'ColorScale', 'log');
    [x018, y018] = ginput(1)
    Diffx018 = x018-x_center;
    Diffy018 = y018-y_center;
    Nrow018 = round(Diffx018);
    Ncol018 = round(Diffy018);
    imr018 = imshift(g018Crop, Nrow018, Ncol018);
    
    imagesc(g019Crop)
    set(gca, 'ColorScale', 'log');
    [x019, y019] = ginput(1)
    Diffx019 = x019-x_center;
    Diffy019 = y019-y_center;
    Nrow019 = round(Diffx019);
    Ncol019 = round(Diffy019);
    imr019 = imshift(g019Crop, Nrow019, Ncol019);
    
    imagesc(g020Crop)
    set(gca, 'ColorScale', 'log');
    [x020, y020] = ginput(1)
    Diffx020 = x020-x_center;
    Diffy020 = y020-y_center;
    Nrow020 = round(Diffx020);
    Ncol020 = round(Diffy020);
    imr020 = imshift(g020Crop, Nrow020, Ncol020);
    
    
%Final G-Image October 17th: this section will combine all of the shifted
%and cropped images into a final True Science image.
    G_Final_CoAdd = imr001+imr003+imr004+imr005+imr006+imr007+imr008+imr009+imr010+imr011+imr012+imr013+imr014+imr015+imr016+imr017+imr018+imr019+imr020;
    %Co-adding the shifted images
    G_Final_min = min(G_Final_CoAdd, [], 'all');
    G_Final_max = max(G_Final_CoAdd, [], 'all');
    G_Final_Rot = rot90(G_Final_CoAdd);
    %Rotating the image 90 degrees
    
    figure(6);  %Creating a figure for this final, cropped, calibrated, and shifted g' image.
    imagesc(G_Final_Rot, [G_Final_min, G_Final_max]); colorbar();
    colormap('turbo');
    set(gca,'ColorScale','log');
    xlim = ([10 190]) 
    ylim = ([0 180])
    title('NGC 7662 Through Sloan g` (Cropped) [10/17]');
    
    %g-Final 1017 Download: this section downloads the final g' image as a fits file. 
    fitswrite(G_Final_Rot, 'g_Final_1017.fit')
    
    g_Final_1017 = rfits('g_Final_1017.fit');   %Re-imports the final g' image and its data.
    g_Final_1017data = g_Final_1017.data;
    g_Final_1017data_1 = rot90(g_Final_1017data);
    g_Final_1017data_2 = flipud(g_Final_1017data_1);
    %Rotating and flipping the image
    
%Cropping G final Image to 180x180pix
    g_final_Crop = g_Final_1017data(10:190, 10:190);
    g_final_Crop_min = min(g_final_Crop, [], 'all');
    g_final_Crop_max = max(g_final_Crop, [], 'all');
    figure(7)
    imagesc(g_final_Crop, [g_final_Crop_min, g_final_Crop_max]); colorbar();
    xlim = ([10 190]) 
    ylim = ([0 180])
    %colormap('turbo');
    set(gca,'ColorScale','log');
    title('NGC 7662 Through Sloan g` (180x180) [10/17]');
    
%Pixel-Corrected 180x180 Cropped Image (Courtesy of Austen Fourkas)
    g180Crop = rfits('GPixelCorrect180.fit');
    g180Cropdata = g180Crop.data;
    g180Crop_min = min(g180Cropdata, [], 'all');
    g180Crop_max = max(g180Cropdata, [], 'all');
    
     
%aperE (Flux) Analysis: this section will calculate the flux of the nebula
%through the final True Science Image.
    %aperE input (October 17th)    
    figure(8);  %Calculating and plotting the nebula based on chosen apertures and Flux calculations
    %colormap('turbo');
    [g1017Ap, g1017Er] = aperE(g180Cropdata, 92, 94, 55, 55, 70, 70, 85, 85, 1/1.35)
    %image name, y coor, x coor, major axis radius, minor axis radius, increase by 4 for RMajor outer and RMajor inner, add another 4 for sky annulus;
    %imagesc([g1017Ap, g1017Er], [50000, 205000]); colorbar();
    set(gca,'ColorScale','log');
    title('Aperture Photometry Through Sloan g` [10/17]');
    
    
%Size Analysis: this section will analyze the size of the nebula in pixel
%dimensions.
    Idata = g_Final_1017data_2; %Assigns the final g' fits data as a variable

    %Figures
    figure(9)   %This section will create a plot of the final fits image, 
    %on which we can draw a line that will profile the ADU values across it
    imagesc(G_Final_Rot, [60000, 205000]); colorbar();
    colormap('turbo');
    set(gca, 'ColorScale', 'log');
    A = improfile;
    Max = max(A,[],'all')
    
    %Value Plot: this section creates a plot of the ADU values as a
    %function of their place on the line previously drawn over the image.
    figure(10)
    colormap('turbo');
    plot(A)
    yline(Max/8);
    
