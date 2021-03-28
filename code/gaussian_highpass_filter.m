function highpass_filter = gaussian_highpass_filter(image,high_freq,scale_factor)
    total_rows = size(image,1);
    total_cols = size(image,2);
    [X,Y] = meshgrid(1:total_cols,1:total_rows);
    fd = fft2(image);
    fd_shifted=fftshift(fd);
    fp_window = ones(size(image));
    center_x = floor(size(fp_window,2)/2)+1;
    center_y = floor(size(fp_window,1)/2)+1;
    G = 1 - exp(-4*log(2)*(X-center_x).^2/(2*high_freq)^2) .* exp(-4*log(2)*(Y-center_y).^2/(2*high_freq)^2/scale_factor^2);
    fp_window = fp_window.*G;
    windowed_freq_domain_shifted = fd_shifted.*fp_window;
    adjusted_freq_domain = ifftshift(windowed_freq_domain_shifted);
    highpass_filter = ifft2(adjusted_freq_domain);
end
