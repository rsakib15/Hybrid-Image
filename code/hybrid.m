image1 = im2double(imread('../data/cat.bmp'));
image2 = im2double(imread('../data/dog.bmp'));

I1Filter=gaussian_highpass_filter(image1,10,1)
I2Filter=gaussian_lowpass_filter(image2,25,1);

hybrid_image = I2Filter + I1Filter;

figure(1);imshow(I1Filter+0.5);
figure(2);imshow(I2Filter);
vis = vis_hybrid_image(hybrid_image);
figure(3);imshow(vis);

imwrite(I1Filter+0.5, '../results/low_frequencies.jpg', 'quality', 95);
imwrite(I2Filter, '../results/frequencies.jpg', 'quality', 95);
imwrite(hybrid_image, '../results/hybrid_image.jpg', 'quality', 95);
imwrite(vis, '../results/hybrid_image_scales.jpg', 'quality', 95);