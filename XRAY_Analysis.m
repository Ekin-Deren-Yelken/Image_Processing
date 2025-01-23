% Clear Workspace and Load Data
clear; clc; close all;

% Create an object of the class
processIMG = img_processing_functions;

input_image_path = 'chest_x-ray1.jpeg';
reference_image_path = 'chest_x-ray2.jpeg';

% Call functions using the object
neg_img = processIMG.negative(input_image_path);
cont_img = processIMG.contrast_stretching(input_image_path);
equalized_img = processIMG.equalize(input_image_path);
matched_img = processIMG.histogram_specification(input_image_path, reference_image_path);

% Display results
figure, imshow(neg_img), title('Negative Image');
figure, imshow(cont_img), title('Contrast Stretched Image');
figure, imshow(equalized_img), title('Equalized Image');
figure, imshow(matched_img), title('Histogram Matched Image');

