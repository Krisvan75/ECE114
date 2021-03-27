U = imread("ca6_image.tiff");

% generating a noisy version of the image using Gaussian Noise
Ug = imnoise(U,'gaussian',0,0.002);

%Generating a salt and pepper noisy version
Us = imnoise(U,'salt & pepper');

%High pass filter h_H
h_H = (1./7).*[-1 -2 -1; -2 19 -2; -1 -2 -1];

%Using a High Pass filter on the original image
Uh = imfilter(U,h_H);

%Plotting the filtered image in contrast with the original to compare.
figure();
subplot(2,1,1);
imagesc(U);
title('Original');
subplot(2,1,2);
imagesc(Uh);
title('HighPass Filter');
colormap(gray);

% Histogram Equilizer
Ue = histeq(U);

%Plotting the equalized image in contrast with the original to compare.
figure();
subplot(2,1,1);
imagesc(U);
title('Original');
subplot(2,1,2);
imagesc(Ue);
title('Histogram Equilizer');
colormap(gray);

%LowPass Filter
h_L = (1./10).*[1 1 1; 1 2 1; 1 1 1];

Ul = imfilter(Ug,h_L);

figure();
subplot(2,1,1);
imagesc(Ug);
title('Gaussian Noise');
subplot(2,1,2);
imagesc(Ul);
title('Low Pass Filter');
colormap(gray);

%Median filter to salt and pepper noise image
Um = medfilt2(Us);

figure();
subplot(2,1,1);
imagesc(Us);
title('Salt and Pepper Noise');
subplot(2,1,2);
imagesc(Um);
title('Median Filter');
colormap(gray);


