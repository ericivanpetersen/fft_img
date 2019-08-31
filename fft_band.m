function [Fimg,Fimg_disp,FFimg,FFimg_disp] = fft_band(img)
% 2-D Fourier transform of single band image.
% 
% Inputs: 
%   img = 2-D array of image brightness values 
%
% Outpus:
%   Fimg = 2D array of fft values
%   Fimg_disp = 2D array of fft values, log scaled to 255
%   FFimg = 2D array fft(fft) values
%   FFimg_disp = same, scaled to 255


% Calculate 2D fourier transform & fourier transform of the transform:
Fimg                        = fft2(img);
FFimg                       = fft2(Fimg);

% Convert values to 255 scale for image display purposes:
Fimg_disp                   = 255 * mat2gray(log(abs(fftshift(Fimg)))); % Log scale for Fimg
FFimg_disp                  = 255 * mat2gray(abs(FFimg));

end

