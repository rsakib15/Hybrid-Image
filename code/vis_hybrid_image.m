function output = vis_hybrid_image(hybrid_image)

pyramid = 5;
scale_factor = 0.5;
padding = 5;

original_height = size(hybrid_image,1);
num_colors = size(hybrid_image,3);
output = hybrid_image;
cur_image = hybrid_image;

for i = 2:pyramid
    output = cat(2, output, ones(original_height, padding, num_colors));
    cur_image = imresize(cur_image, scale_factor, 'bilinear');
    tmp = cat(1,ones(original_height - size(cur_image,1), size(cur_image,2), num_colors), cur_image);
    output = cat(2, output, tmp);
end


