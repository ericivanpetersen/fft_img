function [Fimg,Fimg_disp,FFimg,FFimg_disp] = fft_img_color(img_file);
% 2-D Fourier transform of an N-band color (or grayscale) image.
%
% Inputs:
%   img_file: string giving path to file for image you wish to FFT
%
% Outputs:
%   Fimg = array of fft values
%   Fimg_disp = array of fft values, log scaled to 255
%   FFimg = array fft(fft) values
%   FFimg_disp = same, scaled to 255
%
% Function saves F(image) and F(F(image)) as files in the same format
%   as the input image, in the same directory.
%
% EXAMPLE:
%   fft_img_color('../Fourier_Space/Mars.jpg')
%       saves files to: '../Fourier_Space/Mars_F.jpg'
%                   and: '../Fourier_Space/Mars_FF.jpg'
close all;

%parse filepath and prepare outpaths:
[filepath, img_name, ext] = fileparts(img_file);
outpath1 = strcat(filepath, '/', img_name, '_F', ext);
outpath2 = strcat(filepath, '/', img_name, '_FF', ext);

%read in file:
img                         = imread(img_file);
num_bands                   = size(img,3); % number of color bands

% Display original Image:
figure
imagesc(img);
title('Image');

% Initialize arrays:
Fimg                    = img .* NaN;
Fimg_disp               = Fimg;
FFimg                   = Fimg;
FFimg_disp              = Fimg;

% Fourier Transform each band:
for nn=1:num_bands;
    [Fimg(:,:,nn),Fimg_disp(:,:,nn),FFimg(:,:,nn),FFimg_disp(:,:,nn)] = fft_band(img(:,:,nn));
end

% Display Fourier Transformed Image:
figure
imagesc(Fimg_disp);
title(strcat('F(', img_name, ')'));
imwrite(Fimg_disp, outpath1) % Save image

% Display Doubly Fourier Transformed Image:
figure
imagesc(FFimg_disp);
title(strcat('F(F(', img_name, '))'));
imwrite(FFimg_disp, outpath2) % Save image

end

